//Open xml document
var xmlhttp = new XMLHttpRequest()
xmlhttp.open("GET", "consoles.xml", false)
xmlhttp.send()
var xmlDoc = xmlhttp.responseXML.documentElement

function displayConsoles() {
    $(".console").remove();
    var selected = $("#console-dropdown").find(":selected").text();
    var consoles = $(xmlDoc).find("Console").each(function() {

        var $console = $(this);
        var name = $console.find("Name").text();
        var year = $console.find("ReleaseYear").text();
        var dev = $console.find("Developer").text();
        var image = $console.find("Image").text();

        if (dev == selected || selected == "All") {
            //Create HTML element
            var div = document.createElement("div");
            div.className = "col-md-4 console";

            var p1 = document.createElement("p");
            p1.className = "text-center container-fluid";
            var b = document.createElement("b");
            b.innerHTML = name;
            p1.appendChild(b);

            var img = document.createElement("img");
            img.className = "mx-auto d-block rounded img-fluid img-responsive";
            img.src = "Images/" + image;
            img.alt = name;

            var p2 = document.createElement("p");
            p2.className = "text-center container-fluid";
            p2.innerHTML = "Release Year: " + year;

            div.appendChild(p1);
            div.appendChild(img);
            div.appendChild(p2);

            //Insert HTML element into document
            $("#consoles").append(div);
        }

    });
    
}