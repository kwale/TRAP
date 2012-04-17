var $jit = {}

describe("Bar Chart", function() {

    var fakeBarChart = {};
    fakeBarChart.loadJSON = function() {};
    fakeBarChart.getLegend = function() {};

    $jit.BarChart = function() {return fakeBarChart};

    it("should create a jit barchart", function() {

        $jit.BarChart = jasmine.createSpy("JIT Bar Chart").andReturn(fakeBarChart);

        var barChart = new Trap.BarChart("id");
        barChart.init();

        expect($jit.BarChart).toHaveBeenCalled();

    });

    it("should load data", function() {

        fakeBarChart.loadJSON = jasmine.createSpy("Load Json");

        var data = "some data";
        var barChart = new Trap.BarChart("id");
        barChart.init();
        barChart.loadData(data);

        expect(fakeBarChart.loadJSON).toHaveBeenCalledWith(data)

    });

    it("should return a reference to the legend", function() {

        fakeBarChart.getLegend = jasmine.createSpy("get Legend");

        var barChart = new Trap.BarChart("id");
        barChart.init();
        barChart.getLegend();

        expect(fakeBarChart.getLegend).toHaveBeenCalled();

    });
});