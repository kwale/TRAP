var Trap = Trap || {};

Trap.Legend = function(chartLegend, baseElementId) {

    this.init = function() {
        var baseElement = $("#" + baseElementId);
        for(var item in chartLegend) {
            if (chartLegend.hasOwnProperty(item)) {
                var li = new Trap.LegendItem(item, chartLegend[item]).createElement();
                console.log(li);
                baseElement.append(li);
            }
        }
    };
};