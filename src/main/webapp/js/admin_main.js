let myChartOne = document.getElementById('myChartOne').getContext('2d');
		let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
		let myChartThree = document.getElementById('myChartThree').getContext('2d');
		let myChartFour = document.getElementById('myChartFour').getContext('2d');

		let barChart = new Chart(myChartOne, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '학원', '연구원', '출판사', '미디어사', '위니브' ],
				datasets : [ {
					label : '테스트',
					data : [ 10, 100, 100, 200, 1000 ]

				} ]
			}
		})

		let barChartTwo = new Chart(myChartTwo, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '1월', '3월', '6월', '9월', '12월' ],
				datasets : [ {
					label : '기간별 매출액',
					data : [ 2000, 1000, 1000, 2000, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow',
							'purple' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			}
		})

		let barChartThree = new Chart(myChartThree, {
			type : 'bar', //pie, line, doughnut, polarArea
			data : {
				labels : [ '1월', '3월', '6월', '9월', '12월' ],
				datasets : [ {
					label : '구독자 현황',
					data : [ 200, 100, 100, 200, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow',
							'purple' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			},
			options : {
				plugins : {
					title : {
						display : true,
						text : '바올랩 매출',
						fontSize : 30,
						fontColor : 'red'
					},
					legend : {
						display : true,
						position : 'top'
					},
					tooltip : {
						enabled : true
					}

				},
				layout : {
					padding : {
						left : 80,
						right : 80,
						top : 20,
						bottom : 0
					}
				}

			}
		})

		let barChartFour = new Chart(myChartFour, {
			type : 'line', //pie, line, doughnut, polarArea
			data : {
				labels : [ '10대', '20대', '30대', '40대', '50대이상' ],
				datasets : [ {
					label : '도서 구매량',
					data : [ 230, 110, 90, 300, 500 ],
					backgroundColor : [ 'red', 'blue', 'green', 'yellow', 'brown' ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8

				} ]
			},
			options : {
				plugins : {
					title : {
						display : false,
						text : '바올랩 매출',
						fontSize : 30,
						fontColor : 'red'
					},
					legend : {
						display : true,
						position : 'top'
					},
					tooltip : {
						enabled : true
					}

				},
				layout : {
					padding : {
						left : 0,
						right : 0,
						top : 0,
						bottom : 0
					}
				}

			}
		})
		//도넛차트
		gooledonught();
		function gooledonught(){
		   google.charts.load('current', {'packages':['corechart']});

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
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'일반회원 구독 획원',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('donught'));
        chart.draw(data, options);
      }
		}
		gooledonught2();
		function gooledonught2(){
		   google.charts.load('current', {'packages':['corechart']});

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
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'일반회원 구독 획원',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('donught2'));
        chart.draw(data, options);
      }
		}