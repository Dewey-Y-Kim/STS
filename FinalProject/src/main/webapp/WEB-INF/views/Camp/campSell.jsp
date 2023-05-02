<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.caro_body_line{
	flex-direction : column;
	display:flex;
	flex:1;
}
.main_frm{
	max-height :700px;
}
.caro_body{
	display:flex;
	flex:1;
	width : 94%;
	min-height : 400px;
	min-width:700px;
}
#caro_body{
	width :100%;
}
.caro_btn{
	min-height : 650px;
	border:none;
	color : none;
}
.caro_L_btn{
	flex:0 0 3%;
	order : -1;
	max-height : 800px;
}
.caro_R_btn{
	flex:0 0 3%;
	order : 2;
}

.startDate{
	display:none;
}
.btn_box{
	width : 100%;
}
.get_btn{
	width : 100px;
}
.date {
	width:15%;
}

.line{ 
	margin :0 auto;
}
.name{
	width : 25%;
}
.sum{
	width : 25%; 
}
.no{
	width : 25%;
}
.avg{
	width : 25%;
}

#list_box .line:nth-child(2n+1){
	background: #eee;
}
#callSold{
	width:100%;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.2.1/dist/chart.umd.min.js"></script>
<script>
	// 시작할때
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
		let chartData=CData;
		let BchartColors = ['rgba(255, 99, 132, 0.2)','rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)','rgba(201, 203, 207, 0.2)']
		let BchartBorderColors =['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)']
		let chartctx = document.getElementById('graph');
		
		function chart(chartData){
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
		var CData = json2var(json,'sum'); 
		//차트 표시
		
		chart(CData); // 그래프 표시

		//기간검색 클릭
		$(document).on('click','#getBetween',function(){
			$('#getBetween').val("일일검색");
			$('#getBetween').attr('id','getOne');
			$('.startDate').css('display','block');
			$('#startdate').val("");
		});
		$(document).on('click','#getOne',function(){
			$('#getOne').val("기간검색");
			$('#getOne').attr('id','getBetween');
			$('.startDate').css('display','none');	
		})
		//매출확인 클릭
		$('#getData').click(function(){
			var data = $('#callSold').serialize();
			var url = 'callsold';
			console.log('[data]'+data);
			$.ajax({
				data:data,
				url:url,
				type:'post',
				success:function(result){
					tag="";
					var Jsondata = JSON.parse(result);
					json=Jsondata;
					console.log(json);
					$(Jsondata).each(function(idx,list){
						tag += '<div class="line d-flex">';
						tag += '<div class="name">'+list.camp+'</div>';
						tag +='<div class="sum">'+list.sum+'</div>';
						tag +='<div class="no">'+list.sellNo+'</div>';
						tag +='<div class="avg">'+list.avg+'</div></div>';
					});
					$('#list_box').html(tag);
					/*
					var cvs = document.getElementById('graph');
					var context = cvs.getContext('2d');
					context.clearRect(0, 0, cvs.width, cvs.height);
					context.beginPath();
					*/
					stackedBar.destroy();
					var CData = json2var(Jsondata,'sum');
					chart(CData);
					//chart_bar(json2var(json));
					$('#chartType').val("sum").prop('selected',true);
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
		$(document).on('change',"#chartType",function(){
			//console.log($('#chartType').val());
			/*
			console.log($(json));
			var cvs = document.getElementById('graph');
			var context = cvs.getContext('2d');
			context.clearRect(0, 0, cvs.width, cvs.height);
			context.beginPath();
			*/
			stackedBar.destroy();
			var data
			chartLabelX = json2var(json,'camp');
			if($('#chartType').val()=='no'){
				data = json2var(json,'no');
				
			}else if($('#chartType').val()=='sum'){
				data = json2var(json,'sum');
			}else if($('#chartType').val()=='avg'){
				data = json2var(json,'avg');
			}
			
			console.log("CData : "+data);
			chart(data);
		});
		
		
	});

	
</script>
<main id='main_Frm' class="d-flex container-fluid d-flex flex-column main_frm">
	<div class=' '>	
		<div class="input-group">
				<form id="callSold">
					<div class="d-flex btn_box justify-content-end">
						<input type="button" class="btn btn-outline-success form-control get_btn" id="getBetween" value="기간검색"/>
						<span class="input-group-text startDate">시작</span>
						<input type="date" class="form-control startDate date" id="startdate" name="startDate"/>
						<span class="input-group-text startDate">끝</span>
						<input type="date" class="form-control date" name="endDate" value="${date}" />
						<input type="button" class="btn btn-success form-control get_btn" id="getData" value="매출확인"/>
					</div>
				</form>	
			</div>	
	</div>	
	<div class="d-flex container" >	
		<div class="caro_L_btn caro">
			<button type="button" class="caro_btn caro" data-bs-target="#caro_body" data-bs-slide="prev">
			    <img src="${pageContext.request.contextPath}/resources/img/arrowL.png" style="filter: opacity(20%);width:20px;height:90px"/>
			</button>
		</div>
	
		<!-- Carousel -->
		<div class='caro_body caro'>
			<div id="caro_body" class="carousel slide caro" data-bs-ride="false">
				<!-- The slideshow/carousel -->
				<div class="carousel-inner caro">
					<div class="carousel-item active list">
							<!-- list Style -->
							<div class="container box">
								<div class="line d-flex">
									<div class="name">
										매장
									</div>
									<div class="sum">
										매출(KPW)
									</div>
									<div class="no">
										판매건수
									</div>
									<div class="avg">
										객단가(KPW)
									</div>
								</div>
								<div id="list_box">
									<c:forEach var="item" items="${list}">
										<div class="line d-flex">
											<div class="name">
												${item.campname }
											</div>
											<div class="sum">
												${item.sum }
											</div>
											<div class="no">
												${item.sellNo }
											</div>
											<div class="avg">
												${item.avg }
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
				    </div>
					<div class="carousel-item canvas">
						<!-- graph Style -->
						<canvas id="graph">
						</canvas>
						<div>
							<select id="chartType">
								<option value="sum">매출</option>
								<option value="avg">객단가</option>
								<option value="no">판매건수</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Right btn -->
		<div class="caro_R_btn">
			<button  type="button" class ="caro_btn btn-link" data-bs-target="#caro_body" data-bs-slide="next">
			    <img src="${pageContext.request.contextPath}/resources/img/arrowR.png" style="filter: opacity(20%);width:20px;height:90px"/>
			</button>
		</div>
	</div>
</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />