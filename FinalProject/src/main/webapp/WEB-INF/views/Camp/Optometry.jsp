<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.row{
	width:20%;
}
.customInfo {
	margin: 1%;
}
.customIn{
	width :100%;
}
.telbox {
	width:30%;
}
.column{
	width: 15%;
}
.customInfoFirst>div:first-child {
	width :10%;
}
.customInfoFirst>div:nth-child(5n+2) {
	width: 15%;
}
.customInfoFirst>div:last-child{
	width:1%;
}
.genderbox{
	max-width :10%;
}
.gender_box_font{
	font-size: 1.3em;
	margin:1%;
}
.customInfoFirst>span{
	width:5em;
}
.blank{
	width:30px;
}
#birthbox{
	width :5%;
}

#function_btn{
	max-width:50px;
}
#extra_addr{
	max-width: 8%;
}
.diopt_box{
	width:80%;
}
.diopt_in{
	width:15%;
}
</style>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	
	$(function(){
		// 검색버튼
		$("#regist_btn").click(function(){
			if($('.nameIn').val()!=""){
				search("name",$("#name").val());
				}
			if($('#tel3').val()!=""){
				search("tel",$("#tel3").val());
			}
		});
		//이름에서 엔터키 누르면 검색
		$(".nameIn").keyup(function(){
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
		$(".telIn").keyup(function(){
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
		$("#addr1_btn").click(function(){
			//popup
			$("#addr1_btn").postcodifyPopUp({
				insertAddress : "#addr1",
			    hideOldAddresses : false
			});	
		});
		//diopter 보정
		$(".diopter").change(function(){
			if($(this).val() >20){
				$(this).val($(this).val()/100);
			}
		});
		//등록
		$("#submit_btn").click(function(){
			event.preventDefault();
			var url="addOptData";
			var data = $("regist_Frm").serialize();
			alert("failed");
			$.ajax({
				url:url,
				data:data,
				type:"post",
				success:function(result){
					console.log(result);	
				},error:function(e){
					console.log("failed");
				}
			});
		});
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
				console.log(result.length)
				if(result.length!=0){
					var tag;
					$(result).each(function(idx,data){
						console.log(data);
						console.log(data.customNo);
						tag = '<div class="modal_selectbox d-flex flex-column selectbox" style="border : 1px solid #333; margin : 5%;" id="'+data.customNo+'">'
						tag += '<div class="d-flex justify-content-around">'
						tag += '<div class="">'+data.customNo+'</div>';
						tag += '<div>'+data.name+'</div>'
						tag += '<div class="">'+data.tel1+'-'+data.tel2+'-'+data.tel3+'</div></div>';
						tag += '<div class="">'+data.addr1+'</div>';
						tag += '<div><input type="button" onclick="chk('+data+')"></div>'
						tag += '</div>';
					})
					
					$('#customList').html(tag);
					$('#custom_modal').modal('show');
				}else{
					$("#regist_btn").attr("onclick", "regist()");
					$("#regist_btn").attr("value", "고객등록");
					
				}
			},error:function(e){
				console.log(e.responseText);
			}
		});	
	}
	// 모달 선택버튼
	function chk(result){
		console.log(result);
	}
	
	//등록
	function regist(){
		var data = $("#regist_Frm").serialize();
		var url = "addcustomInfo";
		$.ajax({
			url:url,
			data:data,
			type:'post',
			success:function(result){
				var data = JSON.parse(result);
				$('#opt_customNo').val(data.customNo);
			},error:function(e){
				console.log(e.responseText);
				alert('등록실패');
			}
		});
	}
	//고객정보 결정시
	function optdata(){
		$.ajax({
			url:"optData",
			data :{customNo:$('#customNo').val()},
			type :'Post',
			success:function(result){
				console.log(result);
				result.each(function(data,idx){
					var tag = '<div class="line d-flex flex-fill flex-row"><div class="flex-fill row"><span>'+data.registdate+'</span></div>';
					tag += '<div class="flex-fill row"><span>Sph</span></div>';
					tag += '<div class="flex-fill row"><span>Cyl</span></div>';
					tag += '<div class="flex-fill row"><span>Axis</span></div>';
					tag += '<div class="flex-fill row"><span>ADD</span></div></div>';
					tag += '<div class="line d-flex flex-fill flex-row"><div class="flex-fill row"><span>OD</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.RSph+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.RCyl+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.RAxis+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.RAdd+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.LSph+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.LCyl+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.LAxis+'</span></div>';
					tag += '<div class="flex-fill row"><span>'+data.LAdd+'</span></div>';
					tag += '<div>PD:'+data.pd+'</div></div>'
				});
				$("#optData").html(tag);
			},error:function(e){
				console.log(e.responseText);
			}
		});
	};
	/*
	function searchAddr(){
		if($(".addr_modal_find").val()==""){
			console.log("cancelled");
			return false;
		}else {
			Jsondata = {keyword : $(".addr_modal_find").val()};
			console.log(Jsondata);
			url = "addressFind";
			$.ajax({
				data: Jsondata,
				url:url,
				type:'POST',
				success : function(result){
					var jsondata=JSON.parse(result);
					console.log("text"+jsondata.results.juso);
					var tag = "";
					jsondata.results.juso.map(function(data,idx){
						tag +='<div class="juso_div_detail" style="border:1px solid #777;border-radius: 5px" onclick="$("#addr1").val(($(this).find("in").val())">'
			        	tag +='<span class="in">'+ data.roadAddr+'</span>';
			        	tag += data.jibunAddr;
			        	tag += '</div>';
			        	$(".juso_body").append(tag);
					});
					
					//$("#addr_modal").find(".btn-close").trigger('click');
				}, error:function(e){
					console.log(e.responseText);
					$(".addr_modal_find").val("");
					$("#addr_modal").find(".btn-close").trigger('click');
				}
			});
		}
		*/
	
</script>
<main class=main_frm>
	<form id = "regist_Frm">
		<!-- 고객창 -->
		<div id="inputbox">
				<div class="d-flex justify-content-end">
					<div><input type="button" class="btn btn-outline-success" id="regist_btn" value="검색"></div>
				</div>
				<div class="line d-flex flex-fill flex-row customInfo customInfoFirst">
					<div class="input-group flex-fill column" id="customNo_box">
					    <span class="input-group-text">고객번호</span>
					    <input type="text" class="form-control customIn" id="customNo" value="" readonly/>
					</div>
					<div class="blank" style="width:30px">
					</div>
					<div class="input-group  column" id="namebox">
					    <span class="input-group-text">이름</span>
					    <input type="text" class="customIn form-control nameIn" id="name" name="name"/>
					</div>
					<div class="blank">
					</div>
					<div class="flex-fill column input-group" id="birthbox">
						<span class="input-group-text">생년월일</span>
						<input type="text" maxlenth="8" class="form-control customIn" name="birth">
					</div>
					<div class="blank" style="width:30px">
					</div>
					<div class="input-group-text flex-fill d-inline-flex form-switch column input-group genderbox">
						<span class = "gender_box_font">남</span><input type="radio" name="gender" value="M"><span class = "gender_box_font">여</span><input type="radio" name="gender" value="F">
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
					<div class="blank">
					</div>
					<div class="flex-fill column input-group">
						<span class="input-group-text">E-mail</span>
						<input type="text" maxlenth="8" class="form-control customIn" id="email" name="email">
					</div>
				</div>
				<div class="d-flex customInfo customInfothird">
					<div class="flex-fill flex-row column input-group">
						<span class="input-group-text">주소</span>
						<input type="text" class="form-control customIn" id='addr1' name="addr1" readonly>
						<input type="button" class ="btn btn-outline-info form-control" id="addr1_btn" value="검색" />
						<input type="text" maxlenth="8" class="form-control customIn" name="addr2">
					</div>
				</div>
			</div>
	</form>
		<!-- 검안정보입력창 -->
	<form id="opt_frm">
		<div id="container" class="optolist container">
			<div class="d-flex flex-column">
				<div class="d-flex justify-content-end">
					<div class="input-group" style="width:20%;">
						<span class="input-group-text" style="width:50px">PD</span>
						<input type="text" class="form-control diopter diopt_in" name="pd" placeHolder = "pd"/>
					</div>
					<div>
						<input type="button" id="submit_btn" class="btn btn-outline-primary" value="등록버튼"/>
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
						<span>Axi</span>
					</div>
					<div class="flex-fill row">
						<span>ADD</span>
					</div>
				</div>
				<div class="line d-flex flex-fill flex-row">
					<div class="flex-fill row input-group diopt_box">
						<span class="input-group-text diopt_in">OD</span>
						<input type="text" class="form-control diopter diopt_in" name="RSph" placeHolder = "Sph"/> 
						<input type="text" class="form-control diopter diopt_in" name="RCyl" placeHolder = "Cyl"/>
						<input type="text" class="form-control diopt_in" name="RAxis" placeHolder = "Axis"/>
						<input type="text" class="form-control diopter diopt_in" name="RAdd" placeHolder = "Add"/>
					</div>
				</div>
				<div class="line d-flex flex-fill flex-row">
					<div class="flex-fill row input-group diopt_box">
						<span class="input-group-text diopt_in">OS</span>
						<input type="text" class="form-control diopter diopt_in" name="LSph" placeHolder = "Sph"/> 
						<input type="text" class="form-control diopter diopt_in" name="LCyl" placeHolder = "Cyl"/>
						<input type="text" class="form-control diopt_in" name="LAxis" placeHolder = "Axis"/>
						<input type="text" class="form-control diopter diopt_in" name="LAdd"placeHolder = "Add"/>
					</div>
				</div>
				<textarea rows="" cols="" id="memo" name="memo"></textarea>
			</div>
		</div>
	</form>
	<hr/>
	<!-- 검안결과 표시 -->
	<div id="OptData">
	</div>
	
	<div class="modal" id="custom_modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header ">
	       	<div id="customList" style='width:100%;'>
	       	
	       	</div>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div> 
<!-- <div class="modal" id="addr_modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header
      <div class="modal-header ">
        <div class="input-group">
        	<h4 class="modal-title input-group-text">도로명주소</h4>
        	<input type="text" class="flex-fill addr_modal_find" id="addr_modal_find" name="address_find">
        </div>
        
        <button type="button" class="btn-close form-control" data-bs-dismiss="modal"></button>
      </div>
       -->
      <!-- Modal body 
	      <div class="juso_body">
	     	
	      </div>

      <!-- Modal footer 
      <div class="modal-footer">
      	<button class="btn" id="search_addr_btn">검색</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> -->

</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />