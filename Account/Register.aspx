<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CPSC337_Project.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <h2 id="title" class="form">Register</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <p class="text-center">Create a new account</p>
        <div class="container-fluid">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4">
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 col-form-label">Email</asp:Label>
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 col-form-label">Name</asp:Label>
                        <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                            CssClass="text-danger" ErrorMessage="The name field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="Username" CssClass="col-md-2 col-form-label">Username</asp:Label>
                        <asp:TextBox runat="server" ID="Username" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                            CssClass="text-danger" ErrorMessage="The username field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 col-form-label">Address</asp:Label>
                        <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                            CssClass="text-danger" ErrorMessage="The address field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 col-form-label">Phone</asp:Label>
                        <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone"/>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                            CssClass="text-danger" ErrorMessage="The phone field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Password</asp:Label>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label">Confirm password</asp:Label>
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    <br />
                        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-outline-dark mx-auto d-block" />
                    <br />
                </div>
                <div class="col-4"></div>
            </div>
            </div>
            
    </main>
</asp:Content>
