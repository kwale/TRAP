window.$ = {};
window.$.getJSON = function() {};

Trap.TEST_STATUS_JSON_URL = "test url";
Trap.TEST_STATUS_OPTIONS = "some options";

describe("test status barchart", function() {

    it("should create a new BarChart", function() {

        spyOn(Trap, "BarChart");

        var testStatusBarChart = new Trap.TestStatusBarChart("id");
        testStatusBarChart.init()

        expect(Trap.BarChart).toHaveBeenCalled();
    });

    it("should request the JSON data for the chart", function() {
        $.getJSON = jasmine.createSpy("Get JSON");

        var testStatusBarChart = new Trap.TestStatusBarChart("id");
        testStatusBarChart.init()

        expect($.getJSON).toHaveBeenCalledWith(Trap.TEST_STATUS_JSON_URL, jasmine.any(Function));

    });

    it("should pass the correct data and labels to the chart", function() {
        var fakeBarChart = {};
        fakeBarChart.loadData = jasmine.createSpy("load Data");

        Trap.BarChart = jasmine.createSpy("Bar Chart").andReturn(fakeBarChart);

        var fakeData = "some fake data";

        $.getJSON = function(url, fn) {
            fn(fakeData);
        }

        var expectedData = {
            label: Trap.TEST_STATUS_OPTIONS,
            values: fakeData
        }

        var testStatusBarChart = new Trap.TestStatusBarChart("id");
        testStatusBarChart.init()

        expect(fakeBarChart.loadData).toHaveBeenCalledWith(expectedData);
    });
});