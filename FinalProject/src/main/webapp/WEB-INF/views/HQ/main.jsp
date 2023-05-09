<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
 	.main_frm{
 		width: 80%;
 		margin :0 auto;
 	}
 	#chart{
 		max-height: 60%;
 		max-width: 100%;
 		margin : 0 auto;
 		margin-top : 0;
 	}
 	#noticeBox{
 		width:50%;
 		margin: 0 auto;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 		height : 30%;
	
 		overflow: scroll;
 	}
 	#noticeLine{
 		background: #fff;
 		text-align : center;
 	}
 	.noticeNo{
 		width :20%;
 		font-size : 1.3em
 	}
 	.noticetitle{
 		width : 50%;
 		font-size : 1.3em
 	}
 	.noticeDate{
 		width : 30%;
 		font-size : 1.3em
 	}
 	.noticeLine:hover{
 		background:black;
 		color: white;
 	}
 </style>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1/dist/chart.umd.min.js"></script>
 <script>
	var json = ${json};	
	var stackedBar;
	let chartLabelX;
	
	$(function(){
		//jsonData get
		function json2var(json_data,returnType){ 
			var chart_sum = [];
			var chart_avg = [];
			var chart_no =[];
			var chart_camp = [];
			$.each(json_data, function(idx, prop){
				chart_camp.push(prop.camp);
				chart_avg.push(prop.avg);
				chart_sum.push(prop.sum);
				chart_no.push(prop.sellNo);
			});
			if(returnType=='avg'){
				return chart_avg;
			}
			if(returnType=='no'){
				return chart_no;
			}
			if(returnType=='camp'){
				return chart_camp;
			}
			return chart_sum;
		}
		
		//차트용 data
		let chartTitle;
		chartLabelX=json2var(json,'camp');
		
		//let chartData = new Array();
		let BchartColors = ['rgba(255, 99, 132, 0.2)','rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)','rgba(201, 203, 207, 0.2)']
		let BchartBorderColors =['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)']
		let chartctx = document.getElementById('graph');
		
		function chart(chartData){
			const data = {
					labels:chartLabelX,
					datasets: [{
					label: "매출",
					data: chartData,
					backgroundColor: BchartColors,
					borderColor: BchartBorderColors,
					borderWidth: 1
					}]
			};
			console.log(data);
			stackedBar = new Chart(chartctx, {// chart객체
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
		var data
		chartLabelX = json2var(json,'camp');
		
		data = json2var(json,'sum');
		
		chart(data); // 그래프 표시
		
		//noticeLine click;
		$(".noticeLine").click(function(){
			var no=$(this).find(".noticeNo").attr("id")
			$.ajax({
				url:"noticeContent",
				data:{no:no},
				type:"post",
				success:function(result){
					$(".modal-body").html(result);
					$("#noticeModal").modal('show')
					
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
		$(document).on('click','.closeBtn',function(){
			$(".modal-body").html("");
		});
	});
 </script>
<main class="main_frm container-fluid ">
	<div id="noticeBox" class="flex-column">
		<div id="noticeLine" class=" bg-secondary text-white h3">공지</div>
		<c:forEach var="notice" items="${notice}">
			<div class="d-flex noticeLine flex-row">
				<div class="noticeNo" id="${notice.no }">${notice.no }</div>
				<div class="noticetitle">${notice.title}</div>
				<div class="noticeDate">${notice.writeDate }</div>
			</div>		
		</c:forEach>
		
	</div>	
	<div id = "chart" class="d-flex justify-content-center">
		<canvas id='graph' style="width:80%;">
		</canvas>
	</div>
</main>
<!-- The Modal -->
<div class="modal" id="noticeModal">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">공지사항</h4>
        <button type="button" class="btn-close closeBtn" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger closeBtn" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
	<c:if test="${auth==4}">
		<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
    </c:if> 
