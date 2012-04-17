var Trap = Trap || {};

Trap.TestStatusBarChart = function() {

    var barChart;

    this.init = function() {
        barChart = new Trap.BarChart().init();

        $.getJSON(Trap.TEST_STATUS_JSON_URL, function(jsonData) {
            var data = {};
            data.values = jsonData;
            data.label = Trap.TEST_STATUS_OPTIONS;
            barChart.loadData(data);
        });
    };
};