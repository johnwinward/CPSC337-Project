using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CPSC337_Project
{
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLGames.SelectCommand = "SELECT * FROM Inventory join Consoles on Inventory.Console = Consoles.ConsoleID where Console = '" + ConsolesDropDown.SelectedValue + "'";
            SQLGames.DataBind();
            GamesGridView.DataBind();
        }
    }
}