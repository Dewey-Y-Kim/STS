<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
main{
	over-flow : scroll;
}
.row{
	width:20%;
}
#custom_submit_btn{
	display:none;
}
#opto_submit_btn{
	display:none;
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
/*
.customInfoFirst>div:first-child {
	width :10%;
}

.customInfoFirst>div:nth-child(5n+2) {
	width: 15%;
}
.customInfoFirst>div:last-child{
	width:1%;
}
*/
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
#memo{
	max-width:800px;
	height:80px;
	margin :1%;
	resize : none;
}
#OptData{
	max-height : 300px;
	overflow : scroll;
}
#OptData span{
	width :20%;
}
</style>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
	$(function(){
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
		
		$(document).on('click',".modal_selectbox input[type=button]",function(){
			console.log($(this).attr('class'));	
		});
		//$('.modal *').click(function(){
		//	console.log($(this).attr('class'));
		//});
		// $(document).document 재 확인 - > 변경된 html 적용시.....
		// .click 잘 안될경우.....
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
					$('#opto_submit_btn').css("display","block");
					optdata(); // 검안정보출력
				},error:function(e){
					console.log(e.responseText);
				}
			})
		});
		//검안 등록
		$("#opto_submit_btn").click(function(){
			event.preventDefault();
			var url="addOptData";
			var data = $("#opt_frm").serialize();
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
	function regist(){
		var data = $("#regist_Frm").serialize();
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
	//고객정보 결정시 검안정보 출력
	function optdata(){
		console.log("customNo:"+$('#customNo').val())
		$.ajax({
			url:"optData",
			data :{customNo:$('#customNo').val()},
			type :'Post',
			success:function(result){
				console.log("listPrint");
				console.log(result);
				
				var tag='<div>';
				$.each(result,function(idx,data){
					console.log(data);
					
					
					tag+='<div class="d-flex justify-content-start"><div class="input-group" style="width:50%;border-bottom:1px solid black;">';
					tag+=data.registDate+'</div></div><div class="line d-flex flex-fill flex-row input-group">';
					tag+='<span class="input-group-text">PD : '+data.pd+'</span>';
					tag += '<span class="input-group-text">Sph</span><span class="input-group-text">Cyl</span><span class="input-group-text">Axis</span><span class="input-group-text">ADD</span></div><div class="line d-flex flex-fill flex-row">';
					tag += '<div class="flex-fill row input-group"><span class="input-group-text diopt_in">OD</span>';
					tag +='<span class="input-group-text diopt_in">'+(data.rsph/100*100)+'</span>'; 
					tag += '<span class="input-group-text diopt_in">'+data.rcyl+'</span>';
					tag += '<span class="input-group-text diopt_in">'+data.raxis+'</span>';
					tag += '<span class="input-group-text diopt_in">'+data.radd+'</span></div></div>';
					tag += '</div><div class="line d-flex flex-row align-items-start">';
					tag += '<div class="flex-fill row input-group diopt_box"><span class="input-group-text diopt_in">OS</span>';
					tag += '<span class="input-group-text diopt_in">'+data.lsph+'</span>'; 
					tag += '<span class="input-group-text diopt_in">'+data.lcyl+'</span>';
					tag += '<span class="input-group-text diopt_in">'+data.laxis+'</span>';
					tag += '<span class="input-group-text diopt_in">'+data.ladd+'</span></div></div>';
					if(data.memo !=null){
						tag += '<div class="flex-fill row input-group">'+data.memo+'</div>'
					}
					tag += '</div>';
				});
				console.log(tag);
				tag+="</div>";
				$("#OptData").html(tag);
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
					<div class="d-flex">
						<input type="button" class="btn btn-outline-primary" id="opto_submit_btn" value="검안등록"/>
						<input type="button" class="btn btn-outline-success" id="custom_submit_btn" value="고객등록"/>
						<input type="button" class="btn btn-outline-info" id="regist_btn" value="검색" onclick="btn_search()">
						
						<input type="hidden" id="registed" value="N"/>
					</div>
				</div>
				<div class="line d-flex flex-fill justify-content-between customInfo customInfoFirst">
					<div class="input-group flex-fill column" id="customNo_box" Style="width:10%">
					    <span class="input-group-text">고객번호</span>
					    <input type="text" class="form-control customIn customNo" id="customNo" value="" readonly/>
					</div>
					<div class="blank" style="width:30px">
					</div>
					<div class="input-group  column" id="namebox" Style="width:28%;">
					    <span class="input-group-text">이름</span>
					    <input type="text" class="customIn form-control nameIn" id="name" name="name"/>
					</div>
					<div class="blank">
					</div>
					<div class="flex-fill column input-group" id="birthbox">
						<span class="input-group-text">생년월일</span>
						<input type="text" maxlenth="8" class="form-control customIn" id="birth" name="birth">
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
			<input type="hidden" name="customNo" class="customNo" value=""/>
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
	<hr/>
	<!-- 검안결과 표시 -->
	<div id="OptData">
			
	</div>
	
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