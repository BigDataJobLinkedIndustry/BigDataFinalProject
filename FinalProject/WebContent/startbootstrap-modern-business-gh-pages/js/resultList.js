//매출액 구글차트
google.charts.load("current", {
	packages : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawChart1);
function drawChart1() {
	var data = google.visualization.arrayToDataTable([
			[ "Element", "Density", {
				role : "style"
			} ], [ "매출액", 200, "#b87333" ] ]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : "매출분위",
		//여기에 사이즈 정하면 됨 width, height
		bar : {
			groupWidth : "30%"
		},
		legend : {
			position : "none"
		},
	};
	var chart = new google.visualization.ColumnChart(document
			.getElementById("columnchart_values"));
	chart.draw(view, options);
}


//위험도 구글차트
google.charts.load('current', {
	'packages' : [ 'gauge' ]
});
google.charts.setOnLoadCallback(drawChart2);

function drawChart2() {

	var data = google.visualization.arrayToDataTable([ [ 'Label', 'Value' ],
			[ 'Warning', 50 ] ]);

	var options = {
		//여기에 사이즈 정하면 됨 width, height
		redFrom : 75,
		redTo : 100,
		yellowFrom : 50,
		yellowTo : 75,
		greenFrom : 25,
		greenTo : 50,
	};

	var chart = new google.visualization.Gauge(document
			.getElementById('chart_div'));

	chart.draw(data, options);

	setInterval(function() {
		chart.draw(data, options);
	}, 13000);
	setInterval(function() {
		chart.draw(data, options);
	}, 5000);
	setInterval(function() {
		chart.draw(data, options);
	}, 26000);
}