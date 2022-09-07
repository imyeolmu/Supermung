<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./inc/admin-header.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<style>
.card-text {
	margin-top: 30px;
	font-size: 90px;
	font-weight: 700;
	color: #ab93c9;	
	padding: 100px;
	padding-top: 10px;
}
</style>

<div style="min-height: 1500px;">
<!-- 윤희 -->
<section class="d-flex">
	<div class="card-body state d-flex justify-content-center" style="margin-top: 70px;">
		<div><h6 class="card-title text-center" style="font-weight:500">전체 주문량</h6>
			<p class="card-text text-center">${order}</p></div>
		<div><h6 class="card-title text-center" style="font-weight:500">배송 준비</h6>
			<p class="ready card-text" style="color: #ffd66b;">${ready}</p></div>
		<div><h6 class="card-title text-center" style="font-weight:500">주문 취소</h6>
	   		<p class="cancel card-text" style="color: #8ebb8e;">${cancel}</p></div>
  	</div>
</section>
<section class="d-flex">
	<div class="container mt-5 ms-5">
	<canvas id="canvas" height="400" width="500"></canvas>
	<script>
	var chartLabels = [];
	var chartData = [];

	$.getJSON("http://localhost:8080/getSales", function(data) {
		$.each(data, function(inx, obj) {
			chartLabels.push(inx);
			chartData.push(obj.price);
		});

		createChart();
		console.log("create Chart")
	});

	var lineChartData = {
		labels : chartLabels,
		datasets : [
		{
			label : "주문 1건당 매출액",
			backgroundColor : "rgba(171, 147, 201, 0.3)",
			borderColor :"rgba(171, 147, 201, 0.5)",
			pointBackgroundColor : "rgba(171, 147, 201, 0.5)",
			pointBorderColor : "rgba(171, 147, 201, 0.8)",
			data : chartData
		}
		]
	}

	function createChart() {
		var ctx = document.getElementById("canvas").getContext("2d");
		LineChartDemo = Chart.Line(ctx, {
			data : lineChartData,
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		})
	}
</script>
	</div>
		<!-- 은지 -->
	<div class="container mt-5 me-5">
	 <!-- Start Single Info -->
    <div class="single-info d-flex justify-content-center mb-4">
        <h6 style="font-weight:500">회원수</h6>
        <span class="ms-2" style="color:#ffd66b; font-weight:700">${total}</span>
        <h6 style="font-weight:500" class="ms-2">오늘가입수</h6>
         <span class="ms-2" style="color:#ffd66b; font-weight:700">${totalto}</span>
        <h6 style="font-weight:500" class="ms-2">이번주가입수</h6>
        <span class="ms-2" style="color:#ffd66b; font-weight:700">${totalw}</span>
    </div>
    <!-- End Single Info -->
	
	<canvas id="myChart" height="350" width="500"></canvas>
<script>
  const labels = [
    '5일전',
    '4일전',
    '3일전',
    '2일전',
    '1일전',
    '오늘',
    ]


  const data = {
    labels: labels,
    datasets: [{
      label: '회원수',
      backgroundColor: 'rgba(171, 147, 201, 0.3)',
      borderColor :"rgba(171, 147, 201, 0.5)",
	  pointBackgroundColor : "rgba(171, 147, 201, 0.5)",
	  pointBorderColor : "rgba(171, 147, 201, 0.8)",
      data: ['${five}', '${four}','${three}','${two}','${one}', '${totalto}'],
    }]
  };

  const config = {
    type: 'line',
    data: data,
    options: {}
  };

      
const myChart = new Chart(
       document.getElementById('myChart'),
       config
     );
      
</script>
	</div>
</section>
<!-- 진호 -->
<section class="d-flex mt-5">
	<div id="chart_div" style="width: 800px; height: 500px;"></div>
	<div class="container mt-5 w-50 me-5">
	<h6 class="card-title text-center mb-3" style="font-weight:600">BEST SELLER</h6>
	   <table class="table">
	      <thead>
	         <tr class="text-center">
	            <th style="width:15%">순위</th>
	            <th style="width:70%">상품명</th>
	            <th style="width:15%">카테고리명</th>
	         </tr>
	      </thead>
	      <tbody>
	         <c:forEach items="${list}" var="list">
	         	<c:set var="i" value="${i+1}"/>
	         <tr class="text-center">
	            <td>${i}</td>
	            <td>${list.pname}</td>
	            <td>${list.pcategory_fk1}</td>
	         </tr>
			</c:forEach>
	      </tbody>
	   </table>   
	</div>
</section>
<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['Walk',    123],
        ['Carrier',      134],
        ['Outdoor',  14],
        ['Food', 98],
        ['Grooming',    53],
        ['Home',    215],
        ['Clothes',    1023],
        ['For human',    85],
        ['Toy',    85],
        ['Dining',   77]
      ]);

      var options = {
  	        title: '카테고리 상품별 개수',
  	      	pieHole: 0.4,
  	    	colors: ['#ffa98f', '#ff9e7d', '#ffb914', '#ff9e9b']
      		};	
  	      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
  	      chart.draw(data, options);
    }
</script>
</div>
<%@ include file="./inc/footer.jsp"%>