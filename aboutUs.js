//Open xml document
var xmlhttp = new XMLHttpRequest()
xmlhttp.open("GET", "consoles.xml", false)
xmlhttp.send()
var xmlDoc = xmlhttp.responseXML.documentElement

function displayConsoles() {
    var selected = $("#console-dropdown").find(":selected").text();
    var consoles = $(xmlDoc).find("Console").each(function() {

        var $console = $(this);
        var name = $console.find("Name").text();
        var year = $console.find("ReleaseYear").text();
        var dev = $console.find("Developer").text();

        if (dev == selected) {
            //Create HTML element
        }

    });
    
}