<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repairs.aspx.cs" Inherits="CPSC337_Project.Repairs" MasterPageFile="~/Site.Master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid text-center" id="repairs-div">
        <h1><u>Repairs</u></h1>
        <p>Please select the console you would like to repair:</p>
        <form>
            <select id="repairs-dropdown" onchange="updateTotal()"></select>
            <p class="form">Select Problem:</p>
            <div class="row form">
                <div class="col-xl-4"></div>
                <div class="col-xl-4">
                    <input type="checkbox" name="power" value="50" onchange="updateTotal()"/>
                    <label for="power"> Won't Power On</label><br />
                    <input type="checkbox" name="output" value="40" onchange="updateTotal()"/>
                    <label for="output"> Powers On, No Output to Screen</label><br />
                    <input type="checkbox" name="play" value="30" onchange="updateTotal()"/>
                    <label for="play"> Games Won't Play</label><br />
                    <input type="checkbox" name="cosmetic" value="20" onchange="updateTotal()"/>
                    <label for="cosmetic"> Cosmetic Flaws (Besides Cleaning)</label><br />
                    <input type="checkbox" name="clean" value="10" onchange="updateTotal()"/>
                    <label for="clean"> Cleaning Request</label>
                </div>
                <div class="col-xl-4"></div>
            </div>
        </form>
        <p id="total"></p>
    </div>

</asp:Content>


<asp:Content ID="RepairsCustomJS" ContentPlaceHolderID="CustomJS" runat="server">
    <script src="Scripts/repairs.js" onload="fillDropdown()"></script>
</asp:Content>