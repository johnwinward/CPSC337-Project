<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="CPSC337_Project.AboutUs" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <h1>The Vision</h1>
                <p>
                    Fifteen years ago, our founder John discovered how fun video games are, but also how important it is to be living in a time where the first video games
                    ever sold can still be obtained and played. This discovery led to the founding of JDW Games, where obtaining and playing these games is easier than
                    ever before. John also plays modern video games, so why not combine the old and new? The result is the store you see today.
                </p>
            </div>
        </div>

        <div class="row" id="consoles">
            <h1 class="container-fluid">Consoles we support</h1>
            <!--Dropdown Div-->
            <div class="container-fluid">
                <div class="text-center">
                    <label for="console-dropdown"><b>Developer: </b></label>
                    <select id="console-dropdown" onchange="displayConsoles()">
                        <option>All</option>
                        <option>Atari</option>
                        <option>Microsoft</option>
                        <option>Nintendo</option>
                        <option>Sega</option>
                        <option>Sony</option>
                    </select>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

<asp:Content ID="AboutUsCustomJS" ContentPlaceHolderID="CustomJS" runat="server">
    <script src="Scripts/aboutUs.js" onload="displayConsoles()"></script>
</asp:Content>