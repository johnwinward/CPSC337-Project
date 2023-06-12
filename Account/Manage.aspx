<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="CPSC337_Project.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <h2 class="form text-center">Account Info</h2>
                <asp:DetailsView ID="UserGridView" runat="server" DataSourceID="AccountInfo" AutoGenerateColumns="true" CssClass="mx-auto form" DataKeyNames="ID" AutoPostBack="true" BorderColor="#0002A1" Font-Bold="true">

                </asp:DetailsView>
            </div>
            <div class="col-4"></div>
        </div>
    </div>

    <h2 class="text-center form">Change your account settings</h2>
    <div class="container-fluid">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <br />
                <asp:Button runat="server" OnClick="updateEmail" Text="Update" CssClass="btn btn-outline-dark mx-auto d-block" />
                <br />
                <br />

                <asp:Label runat="server" AssociatedControlID="Username">Username</asp:Label>
                <asp:TextBox runat="server" ID="Username" CssClass="form-control" />
                <br />
                <asp:Button runat="server" OnClick="updateUsername" Text="Update" CssClass="btn btn-outline-dark mx-auto d-block" />
                <br />
                <br />

                <asp:Label runat="server" AssociatedControlID="Name">Name</asp:Label>
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" />
                <br />
                <asp:Button runat="server" OnClick="updateName" Text="Update" CssClass="btn btn-outline-dark mx-auto d-block" />
                <br />
                <br />

                <asp:Label runat="server" AssociatedControlID="Address">Address</asp:Label>
                <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                <br />
                <asp:Button runat="server" OnClick="updateAddress" Text="Update" CssClass="btn btn-outline-dark mx-auto d-block" />
                <br />
                <br />

                <asp:Label runat="server" AssociatedControlID="Phone">Phone</asp:Label>
                <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone" />
                <br />
                <asp:Button runat="server" OnClick="updatePhone" Text="Update" CssClass="btn btn-outline-dark mx-auto d-block" />
                <br />
                <br />
            </div>
            <div class="col-4"></div>
        </div>
    </div>

    <asp:SqlDataSource ID="AccountInfo" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:UsersConnection%>"></asp:SqlDataSource>
</asp:Content>
