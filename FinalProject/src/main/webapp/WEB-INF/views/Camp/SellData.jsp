<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
#Sell_list{
	width : 90%;
	margin : 5%;
}
.line{
	width:100%;
	margin-bottom:1%;
}
.sellLine{
	border:1px solid blue;
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
.inputBox{
	display : none;
	margin-bottom:1%;
}
#custom_submit_btn{
	display:none;
}
#opto_submit_btn{
	display:none;
}

</style>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function(){
		$(".sellLine").click(function(){
			$(".inputBox").css("display",'none');
			$(this).next().css('display','block');
			
			
		});
		// $('#custom_modal').modal('show');
		
		//전화번호에서 엔터키 누르면 검색
		
		
		//이름에서 엔터키 누르면 검색
		
		
		// 주소 검색
		$(".addr1_btn").click(function(){
			//popup
			$(".addr1_btn").postcodifyPopUp({
				insertAddress : ".addr1",
			    hideOldAddresses : false
			});	
		});
		
		//diopter 보정
		$(".diopter").change(function(){
			/*
			if($(this).val() >20){
				$(this).val(($(this).val()/100).toFixed(2));
			}
			*/
			// 025 -1.00 -100
			let num = $(this).val();
			if( num > 20 || num < -20) {
					$(this).val( (num/100).toFixed(2) ); //+-20 이상 124 -> 1.24
			}else { // 20이내....
					$(this).val(((100*$(this).val())/100).toFixed(2)); // -1 -1.00
			}
			num = $(this).val()
			if ( num % 0.25 != 0 ){
				alert('유효한 값인지 확인을 부탁드립니다.');
			}
		});
		
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
						$('.genderbox input[value="M"]').attr("selected",true);
					}else{
						$('.genderbox input[value="F"]').attr("selected",true);
					}
					$("select[name='tel1'] option[value="+s.tel1+"]").attr("selected",true);
					$("input[name='tel2']").val(s.tel2);
					$("input[name='tel3']").val(s.tel3);
					$("#email").val(s.email);
					$("#addr1").val(s.addr1);
					$("#addr2").val(s.addr2);
					$('#custom_modal').modal('hide');
					$('.opto_submit_btn').css("display","block");
				},error:function(e){
					console.log(e.responseText);
				}
			})
		});
		
		//검안 등록
		**
		$(".opto_submit_btn").click(function(){
			event.preventDefault();
			var url="addOptData";
			var data = $().serialize();
			console.log(data);
			$.ajax({
				url:url,
				data:data,
				type:"post",
				success:function(result){
					console.log(result);
					//결과 입력창에 출력
				},error:function(e){
					console.log("failed");
				}
			});
		});
	});
		
	// 검색버튼
	function btn_search(){
		console.log("버튼클릭");
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
	function search(id,searchKey,searchWord){
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
					$('.modal-content').html(tag);
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
	
	//고객 정보 등록
	function regist(id){
		var data = $(id).serialize();
		var url = "addcustomInfo";
		$.ajax({
			url:url,
			data:data,
			type:'post',
			success:function(result){
				if(result>0){
					btn_search();
				}
			},error:function(e){
				console.log(e.responseText);
				alert('등록실패');
			}
		});
	}
</script>
<main class=main_frm>
	<div id=Sell_list class="flex-column">
		<div id="sell-line-tltle" class = "line d-flex d-inline-flex justify-content-between">
				<div class="no col-menu">no</div>
				<div class="d-flex flex-row data-Line">
					<div class="column col-menu col-model">물품</div>
					<div class="column col-menu col-qtt">수량</div>
					<div class="column col-menu col-price">단가</div>
					<div class="column col-menu col-sellprice">판매가</div>
				</div>
				<div class="seller col-menu">판매자</div>
		</div>
		<c:forEach var="list" items="${selledList}">
			<div class="d-flex sellLine line justify-content-between">
				<div class="no col-menu">${list.sellNo}</div>
				<div class="d-flex flex-column data-Line data-Line-inner">
				<c:forEach var="data" items="${selledData }">
				<div class="d-flex flex-row">
						<c:if test ="${list.sellNo == data.sellNo }">
							<div class="column col-model">${data.model } <input type="hidden" value="${data.goodNo }"/></div>
							<div class="column col-qtt">${data.qtt }</div>
							<div class="column col-price">${data.realPrice} </div>
							<div class="column col-price">${data.realPrice*data.qtt} </div>
						</c:if>
				</div>
				</c:forEach>
				</div>
				<div class="seller col-menu">${list.ename }</div>
			</div>
			<div class="inputBox">
				<form class="inserter">
			        <div class="d-flex">
						<input type="button" class="btn btn-outline-primary opto_submit_btn"  value="검안등록"/>
						<input type="button" class="btn btn-outline-success custom_submit_btn" value="고객등록"/>
						<input type="button" class="btn btn-outline-info regist_btn" value="검색" onclick="btn_search()">
						
						<input type="hidden" id="registed" value="N"/>
					</div>
			        <div class="line d-flex flex-fill justify-content-between customInfo customInfoFirst">
						<div class="input-group flex-fill">
							<span class="input-group-text">고객번호</span>
							<input type="text" class="form-control customIn customNo" value="" readonly/>
						</div>
						<div class="name input-group  column">
							<span class="input-group-text">이름</span>
							<input type="text" class="customIn form-control customIn nameIn" name="name"/>
						</div>
						<div class="birth flex-fill column input-group">
							<span class="input-group-text">생년월일</span>
							<input type="text" maxlenth="8" class="form-control customIn" name="birth">
						</div>
						<div class="genderbox input-group-text flex-fill d-inline-flex form-switch input-group customIn">
							<span class = "gender_box_font">남</span><input type="radio" name="gender" value="M">
							<span class = "gender_box_font">여</span><input type="radio" name="gender" value="F">
						</div>
					</div>
					<div class="line d-flex flex-fill flex-row customInfo customInfoSecond">
						<div class="input-group flex-fill telbox">
							<span class="input-group-text">전화번호</span>
							<select name="tel1" class="form-select dropdown-toggle" style='border: 1px solid gray);'>
								<option class="dropdown-item" value="010">010</option>
								<option class="dropdown-item" value="02">02</option>
				        		<option class="dropdown-item" value="031">031</option>
				        		<option class="dropdown-item" value="032">032</option>
				        		<option class="dropdown-item" value="033">033</option>
				        		<option class="dropdown-item" value="041">041</option>
				        		<option class="dropdown-item" value="042">042</option>
				        		<option class="dropdown-item" value="043">043</option>
				        		<option class="dropdown-item" value="044">044</option>
				        		<option class="dropdown-item" value="051">051</option>
				        		<option class="dropdown-item" value="052">052</option>
				        		<option class="dropdown-item" value="053">053</option>
				        		<option class="dropdown-item" value="054">054</option>
				        		<option class="dropdown-item" value="055">055</option>
				        		<option class="dropdown-item" value="061">061</option>
				        		<option class="dropdown-item" value="062">062</option>
				        		<option class="dropdown-item" value="063">063</option>
				        		<option class="dropdown-item" value="064">064</option>
				        	</select>
							<span class="input-group-text">-</span>
							<input type="text" name="tel2" class="form-control btn-light telbox" minlength="3" maxlength="4">
							<span class="input-group-text">-</span>
							<input type="text" id="tel3" name="tel3" class="form-control btn-light telbox telIn" minlength="3" maxlength="4">
						</div>
						<div class="flex-fill column input-group">
							<span class="input-group-text">E-mail</span>
							<input type="text" maxlenth="8" class="form-control customIn email" name="email">
						</div>
					</div>
					<div class="d-flex customInfo customInfothird">
						<div class="flex-fill flex-row column input-group">
							<span class="input-group-text">주소</span>
							<input type="text" class="form-control customIn addr1" name="addr1" readonly>
							<input type="button" class ="btn btn-outline-info form-control addr1_btn" value="검색" />
							<input type="text" maxlenth="8" class="form-control customIn" name="addr2">
						</div>
					</div>
			    </form>
			    <form id="opt_frm">
					<div id="container" class="optolist container">
						<input type="hidden" name="customNo" class="customNo" value=""/>
						<input type="hidden" name="sellNo" value="${list.sellNo}">
						<div class="d-flex flex-column">
							<div class="d-flex justify-content-end">
								<div class="input-group" style="width:20%;">
								<span class="input-group-text" style="width:100px">PD(mm)</span>
								<input type="text" class="form-control diopt_in" name="pd"/>	
							</div>
							</div>
							<div class="line d-flex flex-fill flex-row">
								<div class="flex-fill row">
									<span></span>
								</div>
								<div class="flex-fill row">
									<span>Sph</span>
								</div>
								<div class="flex-fill row">
									<span>Cyl</span></div>
								<div class="flex-fill row">
									<span>Axis</span>
								</div>
								<div class="flex-fill row">
									<span>ADD</span>
								</div>
							</div>
							<div class="line d-flex flex-fill flex-row">
								<div class="flex-fill row input-group diopt_box">
									<span class="input-group-text diopt_in">OD</span>
									<input type="number" class="form-control diopter diopt_in" name="RSph" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/> 
									<input type="number" class="form-control diopter diopt_in" name="RCyl" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>
									<input type="text" class="form-control diopt_in" name="RAxis" />
									<input type="number" class="form-control diopter diopt_in" name="RAdd" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>
								</div>
							</div>
							<div class="line d-flex flex-fill flex-row">
								<div class="flex-fill row input-group diopt_box">
									<span class="input-group-text diopt_in">OS</span>
									 <input type="number" class="form-control diopter diopt_in" name="LSph" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/> 
									<input type="number" class="form-control diopter diopt_in" name="LCyl" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000"/>
									<input type="text" class="form-control diopt_in" name="LAxis"/>
									<input type="number" class="form-control diopter diopt_in" name="LAdd" min="-10.00" max="10.00" step="0.25" placeHolder = "0.00 or 000" />
								</div>
							</div>
							<textarea rows="" cols="" id="memo" name="memo"></textarea>
						</div> 
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
	<!-- The Modal -->
	<div class="modal" id="custom_modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header ">
	       	<!-- 
	       	<div id="customList" style='width:100%;'> 
	       	
	       	</div>
	       	 -->
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	      <div class="modal-body chk1" id="chk1"> bod1</div>
	      <div class="modal-body chk2" id="chk2"> bod2</div>
	      <div class="modal-body chk3" id="chk3"> bod3</div>
	      <div class="modal-body chk5" id="chk5"> bod5</div>
		  <!-- <div class="modal-footer">footer</div>  -->	
	    </div>
	  </div>
	</div> 
</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />