var Trap = Trap || {};

Trap.LegendItem = function(legendItemName, backgroundColor) {

    var createDiv = function() {
        var div = $("<div></div>");
        div.css("background-color", backgroundColor)
        return div;
    }

    this.createElement = function() {

        var listItem = $("<li></li>");
        listItem.text(legendItemName);

        listItem.append(createDiv());

        return listItem;
    }
}