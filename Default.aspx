<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CPSC337_Project._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-sm">
        <h1>Welcome to</h1>
        <img class="rounded-circle img-fluid d-block mx-auto" src="Images/Logo.png" alt="Logo" />
    </div>
    <div class="container-fluid">

        <div class="row">
            <div class="col-xl-6">
                <h2><b>Who are we?</b></h2>
                <p>
                    We're JDW Games. We specialize in reparing and selling video games and consoles, old or new!
                    If you want to get the latest games, relive your childhood through retro games, or fix that broken Xbox you've been holding on to,
                    we're here for you.
                </p>
            </div>
            <div class="col-xl-6 d-flex">
                <img class="rounded mx-auto d-block img-fluid justify-content-center align-self-center" src="Images/games-pile.jpg" alt="Video game store shelf filled with games" />
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6 d-flex">
                <img class="rounded mx-auto d-block img-fluid justify-content-center align-self-center" src="Images/games-counter.jpg" alt="Nintendo Entertainment System Console" />
            </div>
            <div class="col-xl-6">
                <h2><b>What do we sell?</b></h2>
                <p>We sell games and consoles like:</p>
                <ul class="list-group sell-list">
                    <li class="list-group-item">Xbox Series X, One, 360, Original</li>
                    <li class="list-group-item">Playstation 5, 4, 3, 2, 1</li>
                    <li class="list-group-item">NES, SNES, Nintendo 64</li>
                    <li class="list-group-item">Sega Genesis</li>
                    <li class="list-group-item">Atari 2600</li>
                    <li class="list-group-item">And many more!</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <h2><b>How can I buy games?</b></h2>
                <p class="col">If you like the games, consoles, and accessories you see here online, you can purchase them on this website, on our <a href="www.ebay.com">Ebay store</a>, or at our physical store in Bensalem, Pennsylvania!</p>
            </div>
            <div class="col-xl-6 d-flex">
                <img class="rounded mx-auto d-block img-fluid justify-content-center align-self-center" src="Images/games-shelf2.jpg" alt="A shopping center in Bensalem, Pennsylvania" />
            </div>
        </div>
    </div>

</asp:Content>
