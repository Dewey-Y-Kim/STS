<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.caro_btn{
	border:none;
	background-color:transparent;
}
button {
	border:none;
	background-color:transparent;
}
main{
position: relative;
}
.section{
min-height : 700px;
}

.line{
	width :100%;
}
.text_tile{
	width :100%;
}
.column{
	width:20%;
}
input[class=]
 indicatebtn{
 	color: white;
 }
.caro_body_line{
	flex-direction : column;
	display:flex;
	flex:1;
}
.caro_body{
	display:flex;
	flex:1;
	width : 94%;
	min-height : 834px;
}
#caro_body{
	width :100%;
}
.caro_btn{
	min-height : 834px;
}
.caro_L_btn{
	flex:0 0 3%;
	order : -1;
	min-height : 834px;
}
.caro_R_btn{
	flex:0 0 3%;
	order : 2;
}
#goodInserter span{
	width:200px;
}
#goodInserter>div{
	margin : 3%;
}
.list{
	flex: 0 0 100%;
}
.column{
	text-align : center;
}
.list_selected{
	background-color :black;
	color : white;
	border-radius: 5px;
}
#searchSpace{
	width : 100%;
	text-align : 100%;
}
</style>
<script>
	$(function(){
		// 1.list폼
		// 클릭 이벤트 : border 생성 삭제 버튼 클릭시 비동기식 전송 -> 리스트 다시받아와 표시
		$('.stat').click(function(){
			if($(this).hasClass('list_selected')) {
				$(this).removeClass("list_selected");
			}else{
				$(this).addClass("list_selected");
				//console.log($(this).find('.brandcode').val());
			};
		});
		$('.good_del_btn').click(function(){
			var data = [];
			$('.list_selected').find('.brandcode').each(function(idx,obj){
				data.push($(obj).val());
			});
			jsondata ={delarray:data}
			url = "brandDel"
			$.ajax({
				url : url,
				data : jsondata,
				contentType: 'json',
				type : 'post',
				success : function(result){
					//location.reload();
					console.log(result);
				},error : function(e){
					console.log(e.responceText);
				}
			})
		});
		// 2. 등록폼		
		//선택종류가 lens이거나, cl일경우 모델명에 도수범위 삽입 
		// frm 이거나 etc일경우 모델명 삽입
		/*
		:
		sph범위 시작:<input type='text' name='sphStart'>
		sph범위 끝:<input type='text' name='sphEnd'>
		cyl범위 :-<input type='text' name='cylEnd'>
		<div class="input-group mb-3"> <span class="input-group-text">제품명</span><input type='text' class="form-control" name='model'></div>
		*/
		
		$('.goodClass').change(function(){
			var tag ='<div class="input-group mb-3 input-group-lg"> <span class="input-group-text">제품명</span><input type="text" class="form-control insertinput" name="name"></div>';
			if($('.goodClass').val()==2 || $('.goodClass').val()==3){
				tag += '<div class="input-group mb-3 input-group-lg"> <span class="input-group-text">sph +범위</span><input type="text" name="sphStart" class="form-control insertinput"></div>';
				tag += '<div class="input-group mb-3 input-group-lg"> <span class="input-group-text">sph -범위</span><input type="text" name="sphEnd" class="form-control insertinput"></div>';
				tag += '<div class="input-group mb-3 input-group-lg"> <span class="input-group-text">cyl -범위</span><input type="text" name="cylEnd" class="form-control insertinput" placeholder="-단위로 입력하셔야 합니다."></div>';
			}
			$("#model").html(tag);
		});
		
		$('#insertSubmit').click(function(){
			event.preventDefault();
			var data= $('#goodInserter').serialize();
			var url = "goodInsert";
			if($('.sellerinput').val()==""){
				alert('판매처를 선택해야 합니다.');
				return false;
			}
			if($('.insertinput').val()==""){
				alert('모든 사항을 입력해 주세요.');
				return false;
			}
			$.ajax({
				type:'post',
				data: data,
				url:url,
				success:function(s){
					
					$('.insertinput').val("");
					console.log('success');
				}, error:function(e){
					alert('등록에 실패하였습니다.');
					console.log(e.responseText);
				}
			});
		});
	});
//3

/* 4
 .indicate{
	width: 60%;
	margin : 0 auto;
}
.indicate>div{
	width : 80%;
	margin : 0 auto;
	background-color: black;
	font : white;
}
.indicate>div>button{
	width : 100%;
	margin : 0 auto;
}
 
 
<div class="d-flex line justify-content-around indicate">
		    <div><button type="button" class="btn btn-dark indicatebtn" data-bs-target="#caro_body" data-bs-slide-to="0" class="active">목록</button></div>
		    <div><button type="button" class="btn btn-dark indicatebtn" data-bs-target="#caro_body" data-bs-slide-to="1">등록</button></div>
		</div>
*/
</script>
<main class="container-fluid">
	<div class="line">
	<!-- Indicators/dots -->
		<div class="b-flex viewpart flex-row line caro_body_line ">
			<div class="caro_L_btn">
				<button type="button" class="caro_btn" data-bs-target="#caro_body" data-bs-slide="prev">
				    <span class="text-primary carousel-control-prev-icon"></span>
				    <img src="${pageContext.request.contextPath}/resources/img/arrowL.png" style="filter: opacity(20%);width:20px;height:90px"/>
				</button>
			</div>
			<!-- Carousel -->
			<div class='caro_body'>
			<div id="caro_body" class="carousel slide" data-bs-ride="false">
			<!-- The slideshow/carousel -->
				<div class="carousel-inner">
					<div class="carousel-item active list">
							<c:if test="${auth>2}">
							<div class="d-flex flex-row-reverse" Style="margin-right:5%">
								<input type="button" class='good_del_btn btn btn-outline-warning' value="삭제"/>
							</div>
							</c:if>
						<div class = "d-flex line good_line">
							<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">제품명</span></div>
							<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">판매처</span></div>
							<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">분류</span></div>
							<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">구입가</span></div>
							<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">판매가</span></div>
							<div class="d-flex lasteditbox"><span class="text_tile"> </span></div>
						</div>
						<div class="d-flex listline flex-column">
							<c:forEach var="list" items="${goodlist}">
								<div class="d-flex flex-fill line stat">
									<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">${list.name}</span>
									<input type="hidden" class='brandcode' name="brandcode" value="${list.brandcode }"/></div>
									<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">${list.sellername}</span></div>
									<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">${list.classifyname}</span></div>
									<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">${list.buyprice}</span></div>
									<div class="d-flex flex-fill textbox flex-wrap text-center column"><span class="text_tile">${list.sellprice}</span></div>
								</div>
							</c:forEach>
						</div>
						<div id="searchSpace"> 검색용</div>
				    </div>
					<div class="carousel-item form">
						<div><form id="goodInserter">
							<div id="goodcode">
								<span class="input-group-text">종류</span>
								<select name="classifyno" class="goodClass form-select form-select-lg">
									<option value="1"> 안경테</option>
									<option value="2">렌즈</option>
									<option value="3"> CL</option>
									<option value="0"> 기타용품</option>
								</select>
							</div>
							<div id="sellercode">
								<span class="input-group-text">판매처</span>
								<select name="sellercode" class="form-select form-select-lg sellerinput">
									<option value="" selected>선택</option>
									<c:forEach var="sell" items="${seller }">
										<option value="${sell.sellercode }">${sell.sellername}</option>
									</c:forEach> 
								</select>
							</div>
							<div id="model">
								<div class="input-group mb-3 input-group-lg">
								  <span class="input-group-text">제품명</span>
								  <input type='text' name='name' class="form-control insertinput">
								</div>
							</div>
							<div id="buyprice">
								<div class="input-group mb-3 input-group-lg">
								  <span class="input-group-text">매입가</span>
								  <input type="text" name="buyprice" class="form-control insertinput"/>
								</div>
							</div>
							<div id="sellprice">
								<div class="input-group mb-3 input-group-lg">
								  <span class="input-group-text">판매가</span>
								  <input type="text" name="sellprice" class="form-control insertinput"/>
								</div>
							</div>
							<div class="d-flex flex-row-reverse">
								<input type="button" id="insertSubmit" class="btn btn-outline-success" value="등록"/>
							</div>
						</form></div>
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
	</div>
</main>

<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
<c:if test="${auth==4}">
	<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
</c:if>
