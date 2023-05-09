<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
 	.main_frm{
 		width: 80%;
 		margin :0 auto;
 	}
 	#firstline{
 		min-height : 40%;
 	}
 	#searchList{
 		max-height : 40%;
 	}
 	#promiseBox{
 		width:45%;
 		margin: 1% auto;
 		margin-top : 50px;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 		height : 400px;
 		overflow: scroll;
 	}
 	#findBox{
 		width:45%;
 		margin: 1% auto;
 		margin-top : 50px;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 		
 		overflow: scroll;
 	}
 	#chart{
 		min-width:45%;
 		margin: 1% auto;
 		margin-top : 50px;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 	}
 	#noticeBox{
 		width:45%;
 		margin: 1% auto;
 		margin-top : 50px;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 	}
 	#promiseBox{
 		width:45%;
 		margin: 1% auto;
 		margin-top : 50px;
 		border : 1px solid #6c757d;
 		border-radius: 5px;
 	}
 	.title{
 		background: #fff;
 		text-align : center;
 	}
 	.searchbox{
 		width : 80%;
 		margin :0 auto;
 		margin-top : 1%;
 		
 	}
 	.nameText{
 		width : 20%;
 	}
 	.nameIn{
 		width :30%;
 	}
 	.noticeLine{
 		width :90%;
 		margin : 0 auto;
 		font-size: 1.6em;
 	}
 	.noticeNo{
 		width :20%;
 	}
 	.noticetitle{
 		width : 50%;
 	}
 	.noticeDate{
 		width : 30%;
 	}
 	.noticeLine:hover{
 		background:black;
 		color: white;
 	}
 	.promiseLine{
 		width :90%;
 		margin : 0 auto;
 	}
 	.promiseNoLine{
 		width : 10%;
 	}
 	.promiseNameLine{
 		width : 25%;
 	}
 	.promiseTelLine{
 		width : 35%;
 	}
 	.promiseQttLine{
 		width : 10%;
 	}
 	.promisePriceLine{
 		width : 20%; 
 	}
 	#chart{
 		border : none;
 	}
 	.box{
 		overflow: scroll;
 	}
 	.hrLine{
 		width :90%;
 		margin : 0 auto;
 	}
 	.promiseChk{
 		background-color:#eee;
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
		$(document).on('click','.promiseLine',function(){
			if( $(this).hasClass("promiseChk") ){
				$(this).removeClass('promiseChk');
				console.log('had');
			}else{
				$(this).addClass('promiseChk');
			}
		})
	});
	
 </script>
<main class="main_frm container-fluid ">
	<div id="firstline" class="d-flex">
		<!-- 
		<div id="findBox">
				<div id="searchLine" class="bg-secondary text-white h3 title">검색</div>
				<div id="searchBox" class="searchbox input-group box">
					<span class="input-group-text nameText">이름</span>
					<input type="text" class="nameIn form-control" id="name" name="name" placeholder=""/>
					<input type="button" class="btn btn-secondary" id="search_btn" value="검색"/>
				</div>
				<div id="searchList"></div>
		</div>
		 -->
		 <div id="promiseBox">
			<div id="PromiseLine" class="bg-secondary text-white h3 title">고객과의 약속</div>
			<div class="box">
			<c:forEach var="promise" items="${promise}">
				<div class="d-flex promiseLine flex-row" id="${promise.sellNo }">
					<div class="promiseNoLine">${promise.sellNo }</div>
					<div class="promiseNameLine">${promise.name }</div>
					<div class="promiseTelLine">${promise.tel }</div>
					<div class="promiseQttLine">${promise.qtt }(ea)</div>
					<div class="promisePriceLine">₩${promise.price }</div>
				</div>
				<hr class="hrLine">		
			</c:forEach>
			</div>
		</div>
		<div id="noticeBox" class="flex-column ">
			<div id="noticeLine" class=" bg-secondary text-white h3 title">공지</div>
			<div class="box">
			<c:forEach var="notice" items="${notice}">
				<div class="d-flex noticeLine flex-row">
					<div class="noticeNo" id="${notice.no }">${notice.no }</div>
					<div class="noticetitle">${notice.title}</div>
					<div class="noticeDate">${notice.writeDate }</div>
				</div>
				<hr class="hrLine">		
			</c:forEach>
			</div>
		</div>
	</div>
	<div class="d-flex">
		<div id = "chart" class="d-flex justify-content-center">
			<canvas id='graph'>
			</canvas>
		</div>
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
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger closeBtn" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />