var Trap = Trap || {};

Trap.TestStatusBarChartWithLegend = function(baseElementId, legendId) {

    var barChart;

    this.init = function() {
        barChart = new Trap.BarChart(baseElementId);
        barChart.init();

        $.getJSON(Trap.TEST_STATUS_JSON_URL, function(jsonData) {
            var data = {};
            data.values = jsonData;
            data.label = Trap.TEST_STATUS_OPTIONS;
            barChart.loadData(data);
            new Trap.Legend(barChart.getLegend(), legendId).init();
        });
    };
};