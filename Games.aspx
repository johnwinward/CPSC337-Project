<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="CPSC337_Project.Games" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <form runat="server">

        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <asp:UpdatePanel runat="server">
            <ContentTemplate>

                <div class="row text-center">
                    <div class="col-12">
                        <label for="ConsolesDropDown">Please select the console you're shopping for: </label>
                        <asp:DropDownList ID="ConsolesDropDown" runat="server" AutoPostBack="true" DataSourceID="SQLConsoles" DataTextField="ConsoleName"
                            DataValueField="ConsoleID" OnSelectedIndexChanged="ClearSelected" CssClass="ConsolesDropDown"></asp:DropDownList>
                    </div>
            
                </div>

                <div class="row text-center container-fluid">
                    <div class="col-6">
                        <p><u>Games View</u></p>
                        <asp:GridView ID="GamesGridView" runat="server" DataSourceID="SQLGames" AutoGenerateColumns="false" CssClass="mx-auto" DataKeyNames="InventoryID" AutoPostBack="true" BorderColor="#0002A1" Font-Bold="true">
                            <Columns>
                                <asp:CommandField ShowSelectButton="true" ItemStyle-ForeColor="#0002A1" />
                                <asp:BoundField DataField="Name" HeaderText="Game Name" ReadOnly="True"  ItemStyle-CssClass="GridViewText" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-6">
                        <p><u>Details View</u></p>
                        <asp:DetailsView runat="server" ID="GameDetailsView" DataSourceID="SQLDetails" AutoGenerateRows="false" CssClass="mx-auto" DataKeyNames="InventoryID" AutoPostBack="true" BorderColor="#0002A1" Font-Bold="true">
                            <Fields>
                                <asp:BoundField DataField="Name" HeaderText="Game Name" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                                <asp:ImageField DataImageUrlField="ImagePath" AlternateText="Game Image" HeaderText="Image" ReadOnly="true"></asp:ImageField>
                                <asp:BoundField DataField="ConsoleName" HeaderText="Console" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                                <asp:BoundField DataField="ReleaseYear" HeaderText="Release Year" ReadOnly="True"  ItemStyle-CssClass="GridViewText"/>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>

    

    <asp:SqlDataSource ID="SQLConsoles" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:GamesConnection%>"
        SelectCommand="SELECT * FROM Consoles"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SQLGames" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:GamesConnection%>"
        SelectCommand="SELECT * FROM Inventory"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SQLDetails" runat="server" DataSourceMode="DataReader" ConnectionString="<%$ ConnectionStrings:GamesConnection%>"
        SelectCommand="SELECT * FROM Inventory join Consoles on Inventory.Console = Consoles.ConsoleID where InventoryID = @InventoryID">
        <SelectParameters>
            <asp:ControlParameter ControlID="GamesGridView" Name="InventoryID" PropertyName="SelectedValue" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>