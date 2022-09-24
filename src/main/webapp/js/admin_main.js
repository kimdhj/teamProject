


$(document).on("change","#yearselect,#monthsel",function(){
console.log($("rect"));



init();

})





getyearselect();
function getyearselect() {
	var now = new Date();	// 현재 날짜 및 시간
	let year = now.getFullYear();
	let con = '';
	for (let i = 2020; i <= year; i++) {
		if (i == year) {
			con += `<option selected value="${i}">${i}</option>`
			continue;
		}
		con += `<option value="${i}">${i}</option>`

	}
	$("#yearselect").html(con);
}
getmonthselect();
function getmonthselect() {
	var now = new Date();	// 현재 날짜 및 시간
	var month = now.getMonth() + Number(1);
	let con = '';
	for (let i = 1; i <= 12; i++) {
		if (i == month) {
			con += `<option selected value="0${i}">${i}</option>`
			continue;
		}
		con += `<option value="${i}">${i}</option>`

	}
	$("#monthsel").html(con);
}

console.log("달", $("#monthsel").val());
console.log("연도", $("#yearselect").val());
init();
function init(){

$("#myChartOne").slideUp(1000,'linear')
$("#myChartTwo").slideUp(1000,'linear')
$("#myChartThree").slideUp(1000,'linear')
$("#myChartFour").slideUp(1000,'linear')
$("#donught").slideUp(1000,'linear')
$("#donught2").slideUp(1000,'linear')
$.ajax({
	type: 'get',
	url: '/categorysel.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("categorysel", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([String(it.titlestr),Number(it.count)]);
		data.push(it.count);
		color.push(bgcolor[ind]);
		})
			google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', '권');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '카테고리 별 분류',
			'width': 500,
			'height': 500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document.getElementById('myChartOne'));
		chart.draw(data, options);

		$("#myChartOne").slideDown(2000,'linear')
	}
	}

})
$.ajax({
	type: 'get',
	url: '/booksel.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("booksel", re);
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([it.titlestr,Number(it.count)]);
		data.push(it.count);
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
		google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', '권');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '가장 많이 팔린 책',
			'width': 500,
			'height':500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document.getElementById('myChartTwo'));
		chart.draw(data, options);

		$("#myChartTwo").slideDown(2000,'linear')
	}
		
	},
	error:function(er){
	console.log(er);
	}

})
$.ajax({
	type: 'get',
	url: '/dashcache.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashcache", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([it.titlestr,Number(it.count)]);
		data.push();
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
		
	google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', '원');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '총 매출',
			'width': 500,
			'height': 500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document.getElementById('myChartThree'));
		chart.draw(data, options);
	
		$("#myChartThree").slideDown(2000,'linear')
	}
		
	}

})
$.ajax({
	type: 'get',
	url: '/dashcount.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashcount", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([it.titlestr,Number(it.count)]);
		data.push(it.count);
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
			google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', '권');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '책 판매 수',
			'width': 500,
			'height': 500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document.getElementById('myChartFour'));
		chart.draw(data, options);
			
			$("#myChartFour").slideDown(2000,'linear')
	}
	}

})
$.ajax({
	type: 'get',
	url: '/dashbookbuy.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashbookbuy", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([String(it.titlestr),Number(it.count)]);
		data.push();
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
		google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '책구매 댓글',
			'width': 500,
			'height': 500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('donught2'));
		chart.draw(data, options);
		$("#donught2").slideDown(2000,'linear')
	}
	}

})
$.ajax({
	type: 'get',
	url: '/dashgetuser.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashgetuser", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push([it.titlestr,Number(it.count)]);
	
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
			google.charts.load('current', { 'packages': ['corechart'] });

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		data.addRows(label);

		// Set chart options
		var options = {
			'title': '일반회원 구독 회원',
			'width': 500,
			'height': 500,
			 is3D: true
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('donught'));
		chart.draw(data, options);
		$("#donught").slideDown(2000,'linear')
	}
		
	}

})
$.ajax({
	type: 'get',
	url: '/dashnotcancelcount.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashnotcancelcount", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push(it.title);
		data.push(it.count);
		color.push(bgcolor[ind]);
		})
		console.log(label,data,color);
		let up=0;
		$($("#first .stat-cards-info__num")[1]).text(data[1]);
		if(Number(data[0])==0){
		up=0;
		}else{
		
		up=data[1]/data[0]
		if(Number(up)>1){
			up="+"+(Number(up)-1);
			up=up.substring(0,5)
		}else{
		up="-"+Number(up);
		up=up.substring(0,5)
		}
		}
			$($("#first .stat-cards-info__profit")[1]).text(up);
	
	}

})
$.ajax({
	type: 'get',
	url: '/dashcancelcount.do',
	dataType: 'json',
	data: {
		year: $("#yearselect").val(),
		month: $("#monthsel").val()
	},
	success: function(re) {
		console.log("dashcancelcount", re)
		let label=[];
		let data=[];
		let color=[];
		let bgcolor=['red', 'blue', 'green', 'yellow', 'brown'];
		re.map((it,ind)=>{
		
		label.push(it.title);
		data.push(it.count);
		color.push(bgcolor[ind]);
		})
		console.log();
	
		let up=0;
		$($("#first .stat-cards-info__num")[0]).text(data[1]);
		if(Number(data[0])==0){
		up=0;
		}else{
		
		up=data[1]/data[0]
		if(Number(up)>1){
		up="+"+(Number(up)-1);
		up=up.substring(0,5)
		}else{
		up="-"+Number(up);
		up=up.substring(0,5)
		}
		}
		$($("#first .stat-cards-info__profit")[0]).text(up);
	}

})

}  