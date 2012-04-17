var Trap = Trap || {};

var fakeLegendItem = {};
fakeLegendItem.createElement = function() {};

describe("legend", function() {

    it("should create a new legend item for each value in the legend", function() {

        Trap.LegendItem = jasmine.createSpy("legend Item").andReturn(fakeLegendItem);

        var chartLegend = { "val1" : "color1", "val2": "color2", "val3" : "color3" };
        var legend = new Trap.Legend(chartLegend);

        legend.init();

        expect(Trap.LegendItem.callCount).toBe(3);
        expect(Trap.LegendItem).toHaveBeenCalledWith("val1", "color1");
        expect(Trap.LegendItem).toHaveBeenCalledWith("val2", "color2");
        expect(Trap.LegendItem).toHaveBeenCalledWith("val3", "color3");
    });

    it("should append the legend items to the base element", function() {

        var fakeLegendListElement = {};
        fakeLegendListElement.append = jasmine.createSpy("Append");

        window.$ = function() { return fakeLegendListElement; };

        Trap.LegendItem = jasmine.createSpy("legend Item").andReturn(fakeLegendItem);

        var chartLegend = { "val1" : "color1", "val2": "color2", "val3" : "color3" };
        var legend = new Trap.Legend(chartLegend);

        legend.init();

        expect(fakeLegendListElement.append.callCount).toBe(3);
    });

})

