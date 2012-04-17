var Trap = Trap || {};

Trap.BarChart = function(baseElementId) {

    var barChart;

    this.init = function() {
        barChart = new $jit.BarChart({
            injectInto: baseElementId,
            animate: true,
            orientation: 'vertical',
            barsOffset: 20,
            Margin: {
                top:5,
                left: 5,
                right: 5,
                bottom:5
            },
            labelOffset: 5,
            type: 'stacked:gradient',
            showAggregates:true,
            showLabels:true,
            Label: {
                type: "HTML",
                size: 13,
                family: 'Arial',
                color: 'white'
            },
            Tips: {
                enable: true,
                onShow: function(tip, elem) {
                    tip.innerHTML = "<b>" + elem.name + "</b>: " + elem.value;
                }
            }
        });
    };

    this.loadData = function(data) {
        barChart.loadJSON(data);
    };

    this.getLegend = function() {
        return barChart.getLegend();
    }
};