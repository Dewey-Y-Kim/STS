<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#main_Frm{
	width:100%;
}
#btn_box{
	margin : 1% 1% 1% 0;
	
}
#input{
	margin-bottom : 1%;
}
#brokenList{
	margin-top :1%;
}
#brokenList>.list:nth-child(2n){
	background: #ddd;
}

.no{
	width : 10%;
}
.model{
	width : 25%;
}
.qtt{
	width : 10%;
}
.date{
	width : 25%;
}
.modal_model{
	width:60%;
	text-align: center;
}
.modal_name{
	width: 40%;
	text-align: center;
}
#body{
	width : 80%;
	margin : 0 auto;
}
#input{
	width : 80%;
	margin : 0 auto;
}

.line{
	margin-bottom: 1%;
}
</style>

<script>
	$(function(){
		//모델에서 엔터입력시
		$(document).on('keyup','#model',function(){
			console.log('1');
			if(event.keyCode==13){
				if($("#model").val()==""){
					return false;
				}else{
					search($("#model").val());
				}
			}
		});
		$(document).on('click','#search',function(){
			if($("#model").val()!=""){
				search($("#model").val());
			}
		});
		//modal 선택시
		$(document).on('click',".modelList",function(){
			$("#model").val( $(this).find("div").attr('id') );
			$('#goodNo').val( $(this).find('input').val() );
			//모달닫기
			$("#findmodal").modal('hide');
		});
		
		//등록버튼 클릭시
		$("#find").click(function(){
			var tag="";
			tag += '<form id="inputForm"><div class="input-group">';
			tag += '<span class="input-group-text text">모델명</span>';
			
			tag += '<input type="text" class="form-control" id="model" name="model" />';
			tag += '<input type="button" class="btn btn-info" value="제품검색" id="search">';
			
			tag += '<input type="hidden" name="goodNo" id="goodNo" value="">';
			tag += '<span class="input-group-text text">수량</span>';
			tag += '<input type="number" class="form-control" step ="1" id="qtt" name="qtt"/>';
			tag += '<input type="button" id="input_btn" class="btn btn-danger"value="반품등록"/>';
			tag += '</div></form>';
			$("#input").html(tag);
		});
		
		// 제품등록 선택시
		$(document).on('click','#input_btn',function(){
			if( $('#qtt').val()!=0 && $('#qtt').val()!="" && $('#qtt').val()!=null ){
				if(confirm('정말 등록하시겠습니까?')){
					url ="refundInsert";
					data =$("#inputForm").serialize();
					$.ajax({
						url:url,
						data:data,
						type:"post",
						success:function(result){
							$(input).html("");
							var tag=""
							tag += '<div class="d-flex line list justify-content-between container h5">';
							tag += '<div class="no">'+result.refundNo+'</div>';
							tag += '<div class="model">'+result.model+'</div>';
							tag += '<div class="qtt">'+result.qtt+'</div>';
							tag += '<div class="date">'+result.registdate+'</div></div>';
							$("#brokenList").append(tag)
						}
					});
				}
			}
		});
	})	
	//모달 생성
	// $('#custom_modal').modal('show');
	function search(searchWord){
		var data = {searchWord: searchWord}
		$.ajax({
			data:data,
			url:"refundSearch",
			dataType:"json",
			type:"post",
			success:function(result){
				if(result.length!=0){
					var tag="";
					console.log(result);
					// tag += '<div class="modal-dialog"><div class="modal-content"><div class="modal-header "><button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button></div><div class="modal-body chk1" id="chk1"> bod1</div><div class="modal-body chk2" id="chk2"> bod2</div><div class="modal-body chk3" id="chk3"> bod3</div><div class="modal-body chk5" id="chk5"> bod5</div><div class="modal-footer">footer</div></div></div>';
					$(result).each(function(idx,data){
						//d-flex flex-column
						tag +='<div class="modelList d-flex justify-content-around">';
						tag +='<div class="modal_model" id="'+data.model+'">'+data.model+'<input type="hidden" value="'+data.goodNo+'"></div>';
						tag +='<div class="dodal_name">'+data.sellername+'</div><hr/></div>';
					});	
					$('.modal-body').html(tag);
					$('#findmodal').modal('show');
				}
			},error:function(e){
				console.log(e.responseText);
			}
		});	
	}
</script>
<main id='main_Frm' class="container-fluid">
	<div id='body'>
		<div id='btn_box' class='d-flex justify-content-end'>
			<div><input class='form-control btn-primary btn' type="button" id="find" value="등록"/></div>
		</div>
		<div id="input">
		</div>	
		<div id="brokenList" class='list flex-column container'>
			<div class='title line d-flex justify-content-between container bg-secondary text-white h3'>
				<div class="no">번호</div>
				<div class="model">상품명</div>
				<div class="qtt">수량</div>
				<div class="date">등록일</div>
			</div>
			<c:forEach var='data' items='${refundlist }'>
				<div class="d-flex line list justify-content-between container h5">
					<div class="no">${data.refundNo}</div>
					<div class="model">${data.model }</div>
					<div class="qtt">${data.qtt }</div>
					<div class="date">${data.registdate }</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
<div class="modal" id="findmodal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">반품등록</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="modal_form">
          <div class="input-group">
      		<span class="input-group-text">모델명</span>
      		<input type="text" class="form-control" name="keyword" id="keyword">
      		<input type="button" id="modal_btn" class="btn btn-success"/>
      	  </div>
      	</form>
        <div id="list">
        </div>
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