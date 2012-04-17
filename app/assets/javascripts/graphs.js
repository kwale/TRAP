

var buildLegend = function(barChart) {
    var legend = barChart.getLegend();
    for(var name in legend) {
        if (legend.hasOwnProperty(name)) {
            var legendItem = new Trap.LegendItem(name, legend[name]);
            $("#legend").append(legendItem.createElement());
        }
    }
};