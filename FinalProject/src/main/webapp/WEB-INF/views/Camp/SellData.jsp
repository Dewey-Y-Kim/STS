<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
#main_body{
	width : 80%;
	margin : 0 auto;
}
#selldateBox{
margin-bottom : 1%;
}
#Sell_list{
}
.line{
	width:100%;
	margin-bottom:1%;
}
.sellLine{
	border:1px solid blue;
	border-radius: 5px;
}
#sell-line-tltle{
	border-radius: 5px;
}
.column{
	text-align: center;
}
.no{
	width : 15%;
}

.data-Line{
	width :70%;
	padding-left: 1%;
	padding-right: 1%;
}
.data-Line-inner{
	border-left : 1px solid blue;
	border-right : 1px solid blue;
}
.col-model{
	width : 40%;
	text-align:left;
}
.col-qtt{
	width :10%;
}
.col-price{
	width :25%;
	text-align:right;
}
.col-sellprice{
	width :25%;
}
.col-menu {
	text-align:center;
}
.seller{
	width :15%;
}
.genderbox{
	width:220px;
}
.customIn{
	margin-right:1%;
}
.input_box{
	margin-top :2%;
}
#custom_submit_btn{
	display:none;
}
#opto_submit_btn{
	display:none;
}
.column{
margin-right: 20px;
}
.telbox :last-child{
	margin-right: 1%;
}
.input_box{
	border-top: 1px solid blue;
	margin :1%;
}
#memo{
	max-width:800px;
	width : 80%;
	height: 80px;
	margin : 1%;
	resize : none;
}
.number{
	text-align:right;
}
</style>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function(){
		// $('#custom_modal').modal('show');
		$('#search_date').change(function(){
			location.href="Selldata?date="+$('#search_date').val();
		});
		//이름에서 엔터키 누르면 검색
		$(document).on('keyup','.nameIn',function(){
		//$(".nameIn").keyup(function(){
			console.log('1');
			if(event.keyCode==13){
				if($(".nameIn").val()==""){
					console.log("cancelled");
					console.log("name:"+$(".nameIn").val());
					return false;
				}else{
					search("name",$("#name").val());
				}
			}
		});
		
		//전화번호에서 엔터키 누르면 검색
		$(document).on('keyup','.telIn',function(){
		//$(".telIn").keyup(function(){
			console.log('1');
			if(event.keyCode==13){
				if($("#tel3").val()==""){
					console.log("cancelled");
					return false;
				}else {
					search("tel",$("#tel3").val());
				}
			}
		});
		
		// 주소 검색
		$(document).on('click','#addr1_btn',function(){
		//$("#addr1_btn").click(function(){
			//popup
			$("#addr1_btn").postcodifyPopUp({
				insertAddress : "#addr1",
			    hideOldAddresses : false
			});	
		});
		
		//diopter 보정
		//$(".diopter").change(function(){
			/*
			if($(this).val() >20){
				$(this).val(($(this).val()/100).toFixed(2));
			}
			*/
			// 025 -1.00 -100
		$(document).on('change','.diopter',function(){
			let num = $(this).val();
			console.log(num);
			if( num > 20 || num < -20) {
					$(this).val( (num/100).toFixed(2) ); //+-20 이상 124 -> 1.24
			}else { // 20이내....
					$(this).val( ( ( num )*1 ).toFixed(2) ); // -1 -1.00
			}
			num = $(this).val()
			if ( num % 0.25 != 0 ){
				alert('유효한 값인지 확인을 부탁드립니다.');
			}
		});
		
		// 인풋 박스 클릭시 열림
		$('.sellLine').click(function(){
			var id='#'+$(this).next('div[class=input_box]').attr('id');
			var sellno=$(this).children('.class_sellNo').val();
			var customNo=$(this).children()
			console.log(sellno);
			$(".input_box").html("");
			//console.log(id.prev().child('class=[no]').val());
			inputbox_open(id,sellno);
		});
		
		// inputbox x 클릭시 닫힘
		$(document).on('click','.detail-close',function(){
			$(this).closest('.input_box').html("");
		});
		
		// promiseDate 입력시 form 값 변환
		$(document).on('change','#promise',function(){
			$('.promiseDate').val($("#promise").val());
		});
		
		$(document).on('change',)
		//modal 선택시
		$(document).on('click',".modal-body",function(){
			$.ajax({
				url:'customSetter',
				data:{no:$(this).find('input[type=hidden]').val()},
				type:'post',
				success:function(s){
					console.log(s);
					$(".customNo").val(s.customNo);
					$("#name").val(s.name);
					$("#birth").val(s.birth);
					
					if(s.gender=='M'){
						$('#genderM').attr("checked",true);
					}else{
						$('#genderF').attr("checked",true);
					}
					$("select[name='tel1'] option[value="+s.tel1+"]").attr("selected",true);
					$("input[name='tel2']").val(s.tel2);
					$("input[name='tel3']").val(s.tel3);
					$("#email").val(s.email);
					$("#addr1").val(s.addr1);
					$("#addr2").val(s.addr2);
					$('#custom_modal').modal('hide');
					$('#opto_submit_btn').css("display","block");
				},error:function(e){
					console.log(e.responseText);
				}
			})
		});
		
		// 검색버튼
		$(document).on('click','#regist_btn',function(){
			if($('#name').val()!=""){
				search("name",$("#name").val());
			}
			if($('#tel3').val()!=""){
				search("tel",$("#tel3").val());
			}
		});
		//검색
		function search(searchKey,searchWord){
			var data = {searchKey: searchKey,searchWord: searchWord}
			$.ajax({
				data:data,
				url:"customSearch",
				dataType:"json",
				type:"post",
				success:function(result){
					if(result.length!=0){
						var tag;
						// tag += '<div class="modal-dialog"><div class="modal-content"><div class="modal-header "><button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button></div><div class="modal-body chk1" id="chk1"> bod1</div><div class="modal-body chk2" id="chk2"> bod2</div><div class="modal-body chk3" id="chk3"> bod3</div><div class="modal-body chk5" id="chk5"> bod5</div><div class="modal-footer">footer</div></div></div>';
						$(result).each(function(idx,data){
							//d-flex flex-column 
							tag = '<div class="modal-body modal-list" id="chk'+data.customNo+'" style="border : 1px solid #333; margin : 5%;">'
							tag += '<div class="d-flex justify-content-around">'
							tag += '<div><span class="no">'+data.customNo+'</span><input type="hidden" value="'+data.customNo+'"/></div>';
							tag += '<div><span>'+data.name+'</div>'
							tag += '<div><span class="chk">'+data.tel1+'-'+data.tel2+'-'+data.tel3+'<span></div></div>';
							tag += '<div><span>'+data.addr1+'</span></div>';
							
							tag += '</div>';
						});
						$('.modal-body').html(tag);
						$('#custom_modal').modal('show');
					}else{
						// $("#regist_btn").attr("onclick", "regist()");
						// $("#regist_btn").attr("value", "고객등록");
						// $("#custom_submit_btn").css("display","block");
						
					}
				},error:function(e){
					console.log(e.responseText);
				}
			});	
		}
		//고객 등록
		// $(document).on('click','.modal_close',function(){
			
		$('.modal_close').click(function(){
			$("#custom_submit_btn").css('display','block');
		});
		
		//고객 정보 등록
		$(document).on('click','#custom_submit_btn',function(){
			console.log('btn click');			
			var data = $("#regist_Frm").serialize();
			var url = "addcustomInfo";
			$.ajax({
				url:url,
				data:data,
				type:'post',
				success:function(result){
					if(result!=null){
						console.log(result);
						$(".customNo").val(result);
						$("#opto_submit_btn").css("display","block");
					}
				},error:function(e){
					console.log(e.responseText);
					alert('등록실패');
				}
			});
		});
		
		//검안 등록
		
		//$("#opto_submit_btn").click(function(){
		$(document).on('click','#opto_submit_btn',function(){
			event.preventDefault();
			var chk_this=$(this);
			var url="updateOptData";
			var data = $("#opt_frm").serialize();
			$.ajax({
				url:url,
				data:data,
				type:"post",
				success:function(result){
					$(chk_this).closest(".input_box").prev().find("input[class=registed]").val("1");
					$(chk_this).closest(".input_box").prev().find(".no").css("background","#ddd");
					console.log(result);
					//결과 입력창에 출력
					var json=JSON.parse(result);
					console.log(result);
					$(chk_this).find('.no').css("background","#ddd");
					$('.input_box').html("");
					
					console.log(chk_this);
				},error:function(e){
					console.log("failed");
				}
			});
		});
		$(document).on('change','.')
	});
		
	// 검색버튼
	function btn_search(){
		console.log("버튼클릭");
		console.log($("#name").val());
		if($("#registed").val()=='N'){
			if($('.nameIn').val()!=""){
				search("name",$("#name").val());
				}
			if($('#tel3').val()!=""){
				search("tel",$("#tel3").val());
			}
		}
	};
	
	//검색
	function search(searchKey,searchWord){
		var data = {searchKey: searchKey,searchWord: searchWord}
		$.ajax({
			data:data,
			url:"customSearch",
			dataType:"json",
			type:"post",
			success:function(result){
				if(result.length!=0){
					var tag;
					// tag += '<div class="modal-dialog"><div class="modal-content"><div class="modal-header "><button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button></div><div class="modal-body chk1" id="chk1"> bod1</div><div class="modal-body chk2" id="chk2"> bod2</div><div class="modal-body chk3" id="chk3"> bod3</div><div class="modal-body chk5" id="chk5"> bod5</div><div class="modal-footer">footer</div></div></div>';
					$(result).each(function(idx,data){
						//d-flex flex-column 
						tag = '<div class="modal-body modal-list" id="chk'+data.customNo+'" style="border : 1px solid #333; margin : 5%;">'
						tag += '<div class="d-flex justify-content-around">'
						tag += '<div><span class="no">'+data.customNo+'</span><input type="hidden" value="'+data.customNo+'"/></div>';
						tag += '<div><span>'+data.name+'</div>'
						tag += '<div><span class="chk">'+data.tel1+'-'+data.tel2+'-'+data.tel3+'<span></div></div>';
						tag += '<div><span>'+data.addr1+'</span></div>';
						
						tag += '</div>';
					});
					$('.modal-body').html(tag);
					$('#custom_modal').modal('show');
				}else{
					// $("#regist_btn").attr("onclick", "regist()");
					// $("#regist_btn").attr("value", "고객등록");
					$("#custom_submit_btn").css("display","block");
					
				}
			},error:function(e){
				console.log(e.responseText);
			}
		});	
	}
	
	//input_box open
	function inputbox_open(path,sellNo,customNo){
		var tag="";
		tag += '<div class="roll_box" id="roll_box" style="margin-top:1%;">';
		tag += '<form id = "regist_Frm"><div id="inputbox"><div class="d-flex justify-content-between" style="margin-bottom:1%;"><div class="input-group" style="width:25%;"><span class="input-group-text">예정일</span><input type="date" class="form-control" id="promise"/><input type="hidden" id="sellStatus" name="sellSataus" value="0"/></div><div id="btn_box"><div class="d-flex justify-content-end"><div class="d-flex">';
		tag += '<input type="button" class="btn btn-outline-primary" id="opto_submit_btn" value="검안등록"/>';
		tag += '<input type="button" class="btn btn-outline-success" id="custom_submit_btn" value="고객등록"/>';
		tag += '<input type="button" class="btn btn-outline-info" id="regist_btn" value="검색" onclick="btn_search()">';
		tag += '<input type="button" class="btn-close detail-close"></div></div>'
		tag += '</div></div>';
		tag += '<div class="line d-flex flex-fill justify-content-between customInfo customInfoFirst">';
		tag += '<div class="input-group flex-fill column" id="customNo_box" Style="width:25%"><span class="input-group-text">고객번호</span><input type="text" class="form-control customIn customNo" id="customNo" value="" readonly/></div>';
		tag += '<div class="input-group  column" id="namebox" Style="width:28%;">';
		tag += '<span class="input-group-text">이름</span><input type="text" class="customIn form-control nameIn" id="name" name="name"/></div>';
		tag += '<div class="flex-fill column input-group" style="width:20%;" id="birthbox"><span class="input-group-text">생년월일</span>';
		tag += '<input type="text" maxlenth="8" class="form-control customIn" id="birth" name="birth"></div>';
		tag += '<div class="input-group-text flex-fill d-inline-flex form-switch column input-group genderbox" style="max-width:80px;"><span class = "gender_box_font">남</span><input type="radio" name="gender" id="genderM" value="M"><span class = "gender_box_font">여</span><input type="radio" name="gender" id="genderF" value="F"></div></div>';
		tag += '<div class="line d-flex flex-fill flex-row customInfo customInfoSecond">';
		tag += '<div class="input-group flex-fill telbox"><span class="input-group-text">전화번호</span><select name="tel1" class="form-select dropdown-toggle" style="border: 1px solid gray"><option class="dropdown-item" value="010">010</option><option class="dropdown-item" value="02">02</option><option class="dropdown-item" value="031">031</option><option class="dropdown-item" value="032">032</option><option class="dropdown-item" value="033">033</option><option class="dropdown-item" value="041">041</option><option class="dropdown-item" value="042">042</option><option class="dropdown-item" value="043">043</option><option class="dropdown-item" value="044">044</option><option class="dropdown-item" value="051">051</option><option class="dropdown-item" value="052">052</option><option class="dropdown-item" value="053">053</option><option class="dropdown-item" value="054">054</option><option class="dropdown-item" value="055">055</option><option class="dropdown-item" value="061">061</option><option class="dropdown-item" value="062">062</option><option class="dropdown-item" value="063">063</option><option class="dropdown-item" value="064">064</option></select>';
		tag += '<span class="input-group-text">-</span><input type="text" name="tel2" class="form-control btn-light telbox" minlength="3" maxlength="4">';
		tag += '<span class="input-group-text">-</span><input type="text" id="tel3" name="tel3" class="form-control btn-light telbox telIn" minlength="3" maxlength="4"></div>';
		tag += '<div class="flex-fill column input-group"><span class="input-group-text">E-mail</span><input type="text" maxlenth="8" class="form-control customIn" id="email" name="email"></div></div>';
		tag += '<div class="d-flex customInfo customInfothird"><div class="flex-fill flex-row input-group">';
		tag += '<span class="input-group-text">주소</span>';
		tag += '<input type="text" class="form-control customIn" Style="margin:0;" id="addr1" name="addr1" readonly>';
		tag += '<input type="text" maxlenth="8" class="form-control customIn" name="addr2" Style="margin-right:0">';
		tag += '<input type="button" class ="btn btn-outline-info form-control" id="addr1_btn" value="검색" />';
		tag += '</div></div></div></form>';
		<!-- 검안정보입력창 -->
		tag += '<form id="opt_frm"><div id="container" class="optolist container">';
		tag += '<input type="hidden" name="customNo" class="customNo" value=""/>';
		tag += '<input type="hidden" name="sellNo" class="sellNo" value="'+sellNo+'"/>';
		tag += '<input type="hidden" name="sellDate" class="sellDate" value="'+$('#search_date').val()+'"/>';
		tag += '<input type="hidden" name="promiseDate" class="promiseDate" value=""';
		
		tag += '<div class="d-flex flex-column">';
		tag += '<div class="d-flex justify-content-end">';
		tag += '<div class="input-group" style="width:20%; margin-top:1%;">';
		tag += '<span class="input-group-text" style="width:100px">PD(mm)</span>';
		tag += '<input type="text" class="form-control diopt_in" name="pd"/>';	
		tag += '</div></div>';
		tag += '<div class="line d-flex flex-fill flex-row">';
		tag += '<div class="flex-fill row"><span></span></div>';
		tag += '<div class="flex-fill row"><span>Sph</span></div>';
		tag += '<div class="flex-fill row"><span>Cyl</span></div>';
		tag += '<div class="flex-fill row"><span>Axis</span></div>';
		tag += '<div class="flex-fill row"><span>ADD</span></div></div>';
		tag += '<div class="line d-flex flex-fill flex-row"><div class="flex-fill row input-group diopt_box"><span class="input-group-text diopt_in">OD</span>';
		tag += '<input type="number" class="form-control diopter diopt_in" name="RSph" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/> ';
		tag += '<input type="number" class="form-control diopter diopt_in" name="RCyl" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>';
		tag += '<input type="text" class="form-control diopt_in" name="RAxis" />';
		tag += '<input type="number" class="form-control diopter diopt_in" name="RAdd" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>';
		tag += '</div></div>';
		tag += '<div class="line d-flex flex-fill flex-row">';
		tag += '<div class="flex-fill row input-group diopt_box">';
		tag += '<span class="input-group-text diopt_in">OS</span>';
		tag += '<input type="number" class="form-control diopter diopt_in" name="LSph" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>';
		tag += '<input type="number" class="form-control diopter diopt_in" name="LCyl" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>';
		tag += '<input type="text" class="form-control diopt_in" name="LAxis"/>';
		tag += '<input type="number" class="form-control diopter diopt_in" name="LAdd" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000" />';
		tag += '</div></div>';
		tag += '<textarea rows="" cols="" id="memo" name="memo"></textarea></div></div></form>';
		tag += '</div>';
		$(path).html(tag);
	}

</script>
<main class="main_frm container">
	<div id="main_body">
		<div class="d-flex justify-content-end">
			<div class="input-group" id="selldateBox" style="width:25%;">
					<span class="input-group-text">판매일</span>
					<input id="search_date" class="form-control" type="date" name="date" value="${sellDate }"/>
			</div>
		</div>
		<div id=Sell_list class="flex-column">
			<div id="sell-line-tltle" class = "line d-flex d-inline-flex justify-content-between bg-secondary text-white h3">
					<div class="no col-menu">no</div>
					<div class="d-flex flex-row data-Line">
						<div class="column col-menu col-model" style="text-align:left;">물품</div>
						<div class="column col-menu col-qtt">수량</div>
						<div class="column col-menu col-price number">단가</div>
						<div class="column col-menu col-sellprice number">판매가</div>
					</div>
					<div class="seller col-menu">판매자</div>
			</div>
			<c:forEach var="list" items="${selledList}">
				<div class="d-flex sellLine line justify-content-between">
					<input type="hidden" value="${list.sellNo}" class="class_sellNo">
					<input type="hidden" class="registed" id="registed_${list.sellNo}" value="${optResult}" >
					<div class="no col-menu"
						<c:if test="${optResult!=0}">
							style="background:#ddd"
						</c:if>
					>${list.sellNo}</div>
					<div class="d-flex flex-column data-Line data-Line-inner">
					<c:forEach var="data" items="${selledData }">
					<div class="d-flex flex-row">
							<c:if test ="${list.sellNo == data.sellNo }">
								<div class="column col-model">${data.model } <input type="hidden" value="${data.goodNo }"/></div>
								<div class="column col-qtt">${data.qtt }</div>
								<div class="column col-price">${data.realPriceStr} </div>
								<div class="column col-price">${data.totalStr} </div>
							</c:if>
					</div>
					
					</c:forEach>
					</div>
					<div class="seller col-menu">${list.ename }</div>
				</div>
				<div class='input_box' id ='inputbox_${list.sellNo}'>
				</div>
			</c:forEach>
		</div>
	</div>
		<!-- The Modal -->
		<div class="modal" id="custom_modal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header ">
				  <h4 class="modal-title">고객검색</h4>
				  <button type="button" class="btn btn-danger modal_close" data-bs-dismiss="modal">Close</button>
		      </div>
		      <div class="modal-body chk1" id="chk1"></div>
			  <div class="modal-footer">
	        	<button type="button" class="btn btn-danger modal_close" data-bs-dismiss="modal">Close</button>
	      	  </div>	
		    </div>
		  </div>
		</div>
</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />