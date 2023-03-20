//Open xml document
var xmlhttp = new XMLHttpRequest()
xmlhttp.open("GET", "consoles.xml", false)
xmlhttp.send()
var xmlDoc = xmlhttp.responseXML.documentElement

function fillDropdown() {
    $(xmlDoc).find("Console").sort(function (a, b) {
        if ($(a).find("Name").text().toUpperCase() > $(b).find("Name").text().toUpperCase())
            return 1;
        else if ($(a).find("Name").text().toUpperCase() < $(b).find("Name").text().toUpperCase())
            return -1;
        else
            return 0;
    }).each(function () {

        var $dropdown = $("#repairs-dropdown");

        var option = document.createElement("option");
        option.innerHTML = $(this).find("Name").text();

        $dropdown.append(option);

    });
}

function updateTotal() {
    var total = 0;

    //Console base cost
    switch ($("#repairs-dropdown").find(":selected").text()) {
        case "Atari 2600":
            total += 50;
            break;
        case "Nintendo Entertainment System":
            total += 50;
            break;
        case "Sega Genesis":
            total += 50;
            break;
        case "Super Nintendo Entertainment System":
            total += 50;
            break;
        case "Sony Playstation":
            total += 50;
            break;
        case "Nintendo 64":
            total += 100;
            break;
        case "Sony Playstation 2":
            total += 100;
            break;
        case "Xbox":
            total += 100;
            break;
        case "Nintendo GameCube":
            total += 100;
            break;
        case "Xbox 360":
            total += 100;
            break;
        case "Sony Playstation 3":
            total += 150;
            break;
        case "Nintendo Wii":
            total += 150;
            break;
        case "Nintendo Wii U":
            total += 150;
            break;
        case "Xbox One":
            total += 150;
            break;
        case "Sony Playstation 4":
            total += 150;
            break;
    }

    //Services cost
    $("input:checkbox:checked").each(function () {
        total += Number($(this).val());
    });

    //Calculate tax
    total += total * 0.06;

    document.getElementById("total").innerHTML = "Total: $" + total.toFixed(2);
}