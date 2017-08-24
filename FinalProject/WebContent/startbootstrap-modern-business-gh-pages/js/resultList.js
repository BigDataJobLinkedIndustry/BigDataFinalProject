
function showList(jsonResult,index) {
	console.log("showList")
	//console.log(index);
	//매출액 차트
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);
	function drawChart1() {
		var sales = 0;
		//매출분위별 표시매출액
		switch(jsonResult.sales_degree){
		case 1: sales = 100; break;
		case 2: sales = 300; break;
		case 3: sales = 450; break;
		case 4: sales = 650; break;
		case 5: sales = 900; break;
		case 6: sales = 1200; break;
		case 7: sales = 1500; break;
		case 8: sales = 2000; break;
		case 9: sales = 3000; break;
		case 10: sales = 8500; break;
		}
		var data = google.visualization.arrayToDataTable([
				[ "Element", "Density", {
					role : "style"
				} ], [ "매출액", sales, "#b87333" ] ]);

		var view = new google.visualization.DataView(data);
		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			title : "매출분위",
			bar : {
				groupWidth : "30%"
			},
			legend : {
				position : "none"
			},
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById("columnchart_values"+index));
		chart.draw(view, options);
		
	}

	//위험도 구글차트
	google.charts.load('current', {
		'packages' : [ 'gauge' ]
	});
	google.charts.setOnLoadCallback(drawChart2);

	function drawChart2() {

		var data = google.visualization.arrayToDataTable([
				[ 'Label', 'Value' ], [ 'Warning', jsonResult.danger ] ]);

		var options = {
			redFrom : 75,
			redTo : 100,
			yellowFrom : 50,
			yellowTo : 75,
			greenFrom : 25,
			greenTo : 50,
		};

		var chart = new google.visualization.Gauge(document
				.getElementById('chart_div'+index));

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
}