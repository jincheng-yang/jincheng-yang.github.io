/**
 * 
 * Pan & Zoom Axes
 * https://bl.ocks.org/mbostock/db6b4335bf1662b413e7968910104f0f
 * 
 */

d3.select("svg")
	.attr("width", document.body.clientWidth)
	.attr("height", document.body.clientHeight)

var svg = d3.select("svg"),
    width = +svg.attr("width"),
    height = +svg.attr("height");

var zoom = d3.zoom()
    .scaleExtent([0.01, 10000])
    .on("zoom", zoomed);

var x_scale = d3.scaleLinear()
    .domain([-1, width + 1])
    .range([-1, width + 1]);

var y_scale = d3.scaleLinear()
    .domain([1, -height - 1]) // Reverse the vertical axis
    .range([-1, height + 1]);

var xAxis = d3.axisBottom(x_scale)
    .ticks((width + 2) / (height + 2) * 5)
    .tickSize(height)
    .tickPadding(8 - height)

var yAxis = d3.axisRight(y_scale)
    .ticks(5)
    .tickSize(width)
    .tickPadding(8 - width)

var xAxis2 = d3.axisBottom(x_scale)
    .ticks((width + 2) / (height + 2) * 25)
    .tickSize(height)
    .tickPadding(8 - height)

var yAxis2 = d3.axisRight(y_scale)
    .ticks(25)
    .tickSize(width)
    .tickPadding(8 - width)


var view = svg.append("g")
    
var gX2 = svg.append("g")
    .attr("class", "axis axis--x minor")
    .call(xAxis2)

var gY2 = svg.append("g")
    .attr("class", "axis axis--y minor")
    .call(yAxis2)

var gX = svg.append("g")
    .attr("class", "axis axis--x")
    .call(xAxis)

var gY = svg.append("g")
    .attr("class", "axis axis--y")
    .call(yAxis)

svg.call(zoom)

svg.call(zoom.transform, d3.zoomIdentity.translate(width / 2, height / 2).scale(250))

function zoomed() {
	view.attr("transform", d3.event.transform)
	gX.call(xAxis.scale(d3.event.transform.rescaleX(x_scale)))
	gX2.call(xAxis2.scale(d3.event.transform.rescaleX(x_scale)))
	gY.call(yAxis.scale(d3.event.transform.rescaleY(y_scale)))
	gY2.call(yAxis2.scale(d3.event.transform.rescaleY(y_scale)))
	resetBoundary()
}

var window_left = d3.zoomIdentity.translate(width / 2, height / 2).scale(250).invertX(0)
var window_right = d3.zoomIdentity.translate(width / 2, height / 2).scale(250).invertX(width)
var window_top = -d3.zoomIdentity.translate(width / 2, height / 2).scale(250).invertY(0)
var window_bottom = -d3.zoomIdentity.translate(width / 2, height / 2).scale(250).invertY(height)
var window_width = window_right - window_left
var window_height = window_top - window_bottom

function resetBoundary() {
	window_left = d3.event.transform.invertX(0)
	window_right = d3.event.transform.invertX(width)
	window_top = -d3.event.transform.invertY(0) // Reverse the vertical axis
	window_bottom = -d3.event.transform.invertY(height)
	window_width = window_right - window_left
	window_height = window_top - window_bottom
}