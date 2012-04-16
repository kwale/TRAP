var barChart = function(options) {
    return new $jit.BarChart({
        injectInto: options.id,
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
}

var loadStandardBarChart = function(jsonUrl, options) {
    loadGraphData(jsonUrl, barChart(options), loadBarGraphData, options);
}

var loadGraphData = function(jsonUrl, graph, loadDataFunction, options) {
    $.getJSON("/test_status_by_tag.json", function(data) {
        loadDataFunction(data, graph, options)
    });
};


var loadBarGraphData = function(jsonData, graph, options) {
    var data = {};
    data.values = jsonData;
    data.label = options.labels;
    graph.loadJSON(data);
};

var loadBarGraphDataAndLegend = function(jsonData, graph, options) {
    loadBarGraphData(jsonData, graph, options);
    buildLegend(graph);
};

var buildLegend = function(barChart) {
    var legend = barChart.getLegend();
    for(var name in legend) {
        if (legend.hasOwnProperty(name)) {
            var li = $("<li></li>");
            li.text(name);

            var div = $("<div></div>");
            div.css("background-color", legend[name]);
            li.append(div);

            $("#legend").append(li);
        }
    }
};