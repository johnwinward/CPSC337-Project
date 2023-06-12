using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using CPSC337_Project.Models;
using System.Web.Services.Description;
using Microsoft.Ajax.Utilities;
using Microsoft.Owin.BuilderProperties;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Xml.Linq;
using System.Web.UI;

namespace CPSC337_Project.Account
{
    public partial class Manage : System.Web.UI.Page
    {

        private string UserDetailsQueryString;
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {

        }

        protected void Page_Load()
        {
            UserDetailsQueryString = "Select * From Users where Convert(VARCHAR, Email) = '" + HttpContext.Current.User.Identity.Name + "'";
            AccountInfo.SelectCommand = UserDetailsQueryString;
            /*var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    //ChangePassword.Visible = true;
                }
                else
                {
                    //CreatePassword.Visible = true;
                    //ChangePassword.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            } */
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        //Added Code
        protected void updateEmail(object sender, EventArgs e)
        {

            SqlConnection con2 = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Users.mdf;Integrated Security=True");
            con2.Open();
            SqlCommand sqlCommand = new SqlCommand("Update Users set Email = @email where Convert(nvarchar, Email) = @oldEmail", con2);
            sqlCommand.Parameters.AddWithValue("@email", Email.Text);
            sqlCommand.Parameters.AddWithValue("@oldEmail", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con2.Close();

            SqlConnection con = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-CPSC337-Project-20230329050905.mdf;Initial Catalog=aspnet-CPSC337-Project-20230329050905;Integrated Security=True");
            con.Open();
            sqlCommand.Dispose();
            sqlCommand = new SqlCommand("Update AspNetUsers set Email = @email, UserName = @email where Convert(nvarchar, Email) = @oldEmail", con);
            sqlCommand.Parameters.AddWithValue("@email", Email.Text);
            sqlCommand.Parameters.AddWithValue("@oldEmail", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con.Close();

            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please log in again using your new email address.')", true);

        }

        protected void updateUsername(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Users.mdf;Integrated Security=True");
            con2.Open();
            SqlCommand sqlCommand = new SqlCommand("Update Users set UserID = @user where Convert(nvarchar, Email) = @email", con2);
            sqlCommand.Parameters.AddWithValue("@user", Username.Text);
            sqlCommand.Parameters.AddWithValue("@email", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con2.Close();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void updateName(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Users.mdf;Integrated Security=True");
            con2.Open();
            SqlCommand sqlCommand = new SqlCommand("Update Users set Name = @name where Convert(nvarchar, Email) = @email", con2);
            sqlCommand.Parameters.AddWithValue("@name", Name.Text);
            sqlCommand.Parameters.AddWithValue("@email", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con2.Close();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void updateAddress(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Users.mdf;Integrated Security=True");
            con2.Open();
            SqlCommand sqlCommand = new SqlCommand("Update Users set Address = @add where Convert(nvarchar, Email) = @email", con2);
            sqlCommand.Parameters.AddWithValue("@add", Address.Text);
            sqlCommand.Parameters.AddWithValue("@email", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con2.Close();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void updatePhone(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection("Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Users.mdf;Integrated Security=True");
            con2.Open();
            SqlCommand sqlCommand = new SqlCommand("Update Users set Phone = @phone where Convert(nvarchar, Email) = @email", con2);
            sqlCommand.Parameters.AddWithValue("@phone", Phone.Text);
            sqlCommand.Parameters.AddWithValue("@email", HttpContext.Current.User.Identity.Name);
            sqlCommand.ExecuteNonQuery();
            con2.Close();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}