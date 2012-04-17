describe("Legend Item", function() {

    var fakeJqueryObject = {};
    fakeJqueryObject.text = function() {};
    fakeJqueryObject.css = function() {};
    fakeJqueryObject.append = function() {};

    it("should create a new list item", function() {

        window.$ = jasmine.createSpy("jquery").andReturn(fakeJqueryObject);

        var legendItem = new Trap.LegendItem("Some name", "some colour");

        legendItem.createElement();

        expect(window.$).toHaveBeenCalledWith("<li></li>");

    });

    it("should set the text for the list item to be the name passed in", function() {

        fakeJqueryObject.text = jasmine.createSpy("Text");
        window.$ = jasmine.createSpy("jquery").andReturn(fakeJqueryObject);

        var legendItemName = "Pass";
        var legendItem = new Trap.LegendItem(legendItemName, "some colour");

        legendItem.createElement();

        expect(fakeJqueryObject.text).toHaveBeenCalledWith(legendItemName);

    });

    it("should create a new div for the colour block", function() {

        window.$ = jasmine.createSpy("jquery").andReturn(fakeJqueryObject);

        var legendItem = new Trap.LegendItem("Some name", "some colour");

        legendItem.createElement();

        expect(window.$).toHaveBeenCalledWith("<div></div>");
    });

    it("should set the background colour for the div to the colour passed in", function() {

        fakeJqueryObject.css = jasmine.createSpy("CSS");
        window.$ = jasmine.createSpy("jquery").andReturn(fakeJqueryObject);

        var color = "black";
        var legendItem = new Trap.LegendItem("Some name", color);

        legendItem.createElement();

        expect(fakeJqueryObject.css).toHaveBeenCalledWith("background-color", color);

    });

    it("should append the div to the list item", function() {

        fakeJqueryObject.append = jasmine.createSpy("append");
        window.$ = jasmine.createSpy("jquery").andReturn(fakeJqueryObject);

        var legendItem = new Trap.LegendItem("Some name", "color");

        legendItem.createElement();

        expect(fakeJqueryObject.append).toHaveBeenCalledWith(fakeJqueryObject);

    });

});