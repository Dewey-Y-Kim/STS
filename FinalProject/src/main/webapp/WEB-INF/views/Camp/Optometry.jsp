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
</style>
<script>
	$(function(){
		$(".nameIn").keyup(function(){
			if(event.keyCode==13){
				//이름에서 엔터키 누르면 검색
				if($(".nameIn").val()==""){
					console.log("cancelled");
					console.log("name:"+$(".nameIn").val());
					return false;
				}else{
					search("name",$("#name").val());
				}
			}
		});
		$(".telIn").keyup(function(){
			if(event.keyCode==13){
				//전화번호에서 엔터키 누르면 검색
				if($("#tel3").val()==""){
					console.log("cancelled");
					return false;
				}else {search("tel",$("#tel3").val());}
			}
		});
		$(".addr_modal_find").keyup(function(){
			if(event.keyCode==13){
				//전화번호에서 엔터키 누르면 검색
				if($(".addr_modal_find").val()==""){
					console.log("cancelled");
					return false;
				}else {
					data = {"address_find":$(".addr_modal_find").val()};
					console.log(data);
					url = "addressFind";
					$.ajax({
						data: data,
						url:url,
						contentType:'json',
						type:'post',
						success : function(result){
							console.log(result);
							$("#addr_modal").find(".btn-close").trigger('click');
						}, error:function(e){
							console.log(e.responseText);
							$(".addr_modal_find").val("");
							$("#addr_modal").find(".btn-close").trigger('click');
						}
					})					
				}
			}
		});
	});
	function search(searchKey,searchWord){
		var data = {"searchKey": searchKey,"searchWord": searchWord}
		$.ajax({
			data:data,
			url:"customSearch",
			type:"post",
			success:function(result){
				console.log(result);
				console.log("success");
			},error:function(e){
				console.log(e.responseText);
			}
		});	
	}
</script>
<main class=main_frm>
	<div id="inputbox">
		<form>
			<div class="line d-flex flex-fill flex-row customInfo customInfoFirst">
				<div class="input-group flex-fill column" id="customNo_box">
				    <span class="input-group-text">고객번호</span>
				    <input type="text" class="form-control customIn" name="form-controlcustomno" readonly/>
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
				<div class="flex-fill column input-group" id="email">
					<span class="input-group-text">E-mail</span>
					<input type="text" maxlenth="8" class="form-control customIn" name="birth">
				</div>
			</div>
			<div class="d-flex customInfo customInfothird">
				<div class="flex-fill flex-row column input-group">
					<span class="input-group-text">주소</span>
					<input type="text" maxlenth="8" class="form-control customIn" name="addr1" readonly>
					<input type="button" class ="btn btn-outline-info form-control" id="function_btn" data-bs-toggle="modal" data-bs-target="#addr_modal" value="검색" />
					<input type="text" maxlenth="8" class="form-control customIn" name="addr2">
				</div>
			</div>
		</form>	
	</div>
	<div id="optolist container">
		<div class="d-flex flex-column">
			<div class="line d-flex flex-fill flex-row">
				<div class="flex-fill row"><span></span></div><div class="flex-fill row"><span>Sph</span></div><div class="flex-fill row"><span>Cyl</span></div><div class="flex-fill row"><span>Axi</span></div><div class="flex-fill row"><span>ADD</span></div>
			</div>
			<div class="line d-flex flex-fill flex-row">
				<div class="flex-fill row"><span>OD</span></div><div class="flex-fill row"><span>Sph</span></div><div class="flex-fill row"><span>Cyl</span></div><div class="flex-fill row"><span>Axi</span></div><div class="flex-fill row"><span>ADD</span></div>
			</div>
			<div class="line d-flex flex-fill flex-row">
				<div class="flex-fill row"><span>OS</span></div><div class="flex-fill row"><span>Sph</span></div><div class="flex-fill row"><span>Cyl</span></div><div class="flex-fill row"><span>Axi</span></div><div class="flex-fill row"><span>ADD</span></div>
			</div>
			<hr/>
		</div>
		
	</div>
<div class="modal" id="custom_modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header ">
        <div class="input-group">
        	<h4 class="modal-title input-group-text">고객정보</h4>
        	<input type="text" class="flex-fill" id="addr_modal_find" name="addr1">
        </div>
        <button type="button" class="btn-close form-control" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<div class="modal" id="addr_modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header ">
        <div class="input-group">
        	<h4 class="modal-title input-group-text">도로명주소</h4>
        	<input type="text" class="flex-fill addr_modal_find" id="addr_modal_find" name="address_find">
        </div>
        <button type="button" class="btn-close form-control" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />