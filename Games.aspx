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
        <div class="row text-center">
            <div class="col-12">
                <asp:GridView ID="GamesGridView" runat="server" DataSourceID="SQLGames" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Game Name" ReadOnly="True"/>
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