<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="CPSC337_Project.Games" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form runat="server">
        <div class="row text-center">
            <div class="col-12">
                <label for="ConsolesDropDown">Please select the console you're shopping for: </label>
                <asp:DropDownList ID="ConsolesDropDown" runat="server" AutoPostBack="true" DataSourceID="SQLConsoles" DataTextField="ConsoleName" DataValueField="ConsoleID">
                </asp:DropDownList>
            </div>
            
        </div>
        <div class="row text-center container-fluid">
            <div class="col-12">
                <asp:GridView ID="GamesGridView" runat="server" DataSourceID="SQLGames" AutoGenerateColumns="false" CssClass="mx-auto">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Game Name" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                        <asp:ImageField DataImageUrlField="ImagePath" AlternateText="Game Image" HeaderText="Image" ReadOnly="true"></asp:ImageField>
                        <asp:BoundField DataField="ConsoleName" HeaderText="Console" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                        <asp:BoundField DataField="ReleaseYear" HeaderText="Release Year" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    

    <asp:SqlDataSource ID="SQLConsoles" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:GamesConnection%>"
        SelectCommand="SELECT * FROM Consoles"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SQLGames" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:GamesConnection%>"
        SelectCommand="SELECT * FROM Inventory"></asp:SqlDataSource>

</asp:Content>