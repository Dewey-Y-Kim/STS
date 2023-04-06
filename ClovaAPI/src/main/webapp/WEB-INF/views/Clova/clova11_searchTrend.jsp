<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1/dist/chart.umd.min.js"></script>

<script>
	$(function(){
		// 차트용 data
		let chartTitle;
		let chartLabelX=[];
		//let chartData = new Array();
		let chartData=[];
		let BchartColors = ['rgba(255, 99, 132, 0.2)','rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)','rgba(201, 203, 207, 0.2)']
		let BchartBorderColors =['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)']
		let chartctx = document.getElementById('barChart');
		function chart_bar(){
			const data = {
					labels:chartLabelX,
					datasets: [{
					label: chartTitle,
					data: chartData,
					backgroundColor: BchartColors,
					borderColor: BchartBorderColors,
					borderWidth: 1
				}]
			};
			console.log(data);
			const stackedBar = new Chart(chartctx, {// chart객체
			    type: 'bar',
			    data: data,
			    options: {
			        scales: {
			            x: {
			                stacked: true
			            },
			            y: {
			                stacked: true
			            }
			        }
			    }
			});
		}
		function chart_pie(){
			const data = {
					  labels: chartLabelX,
					  datasets: [{
					    label: chartTitle,
					    data: chartData,
					    backgroundColor: BchartBorderColors,
					hoverOffset: 4
				}]
			};
			new Chart(document.getElementById("pieChart"),{
				type: 'pie',
				data:data
			});
		}
		$("#searchTrendFrm").submit(function(){
			event.preventDefault();
			let params = $("#searchTrendFrm").serialize();
			let url = "SearchTrend";
			$.ajax({
				url:url,
				type:"post",
				data:params,
				success:function(result){
					$("#resultText").val(result);
					var json = JSON.parse(result);
					chartTitle = json.results[0].title;
					console.log("chartTitle:"+chartTitle);
					chartLabelX = json.results[0].data.map(function(obj,i){
						chartLabelX[i]=obj.period;//기준일
						chartData[i]=obj.ratio;
						console.log(chartData[i]);
						console.log(chartLabelX[i]);
					});
					$("barChart").val(chart_bar());
					$("barChart").val(chart_pie());
				},error:function(error){
					console.log(error.responseText);	
				}
			});
		});
	});
</script>
</head>
<body>
<div class="container">
	<h1>Search Trend</h1>
	<form method="post" id="searchTrendFrm">
		<ul>
			<li>구간 시작 날짜 : <input type="date" name="startDate" value="2022-01-01"/> </li>
			<li>구간 종료 날짜 : <input type="date" name="endDate" value="2022-05-30"/></li>
			<li>구간단위 : <select name="timeUnit">
				<option value="date">일별</option>
				<option value="week">주별</option>
				<option value="month" selected>월별</option>
			</select> </li>
			<li>그룹이름 : <input type="text" name="groupName" value="검도"/></li>
			<li>keyWord : <input type="text" name="keywords" value="진검"/>
			<input type="text" name="keywords" value="가검"/>
			<input type="text" name="keywords" value="목검"/>
			<input type="text" name="keywords" value="반야심경"/>
			<input type="text" name="keywords" value="방탄"/>
		</ul>
		<input type="submit" value="submit"/>
	</form>
	<hr/>
	<div>
		<textarea id="resultText" cols="100" rows="10" ></textarea>
		<div width="30%">
		<canvas id="pieChart"></canvas>
		</div><div width="30%">
		<canvas id="barChart"></canvas>
		</div>
	</div>
</div>
</body>