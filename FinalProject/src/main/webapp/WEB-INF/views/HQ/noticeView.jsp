<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.mainbody{
		width :80%;
		margin : 0 auto;
		hegith : 600px;
	}
	.top_btn{
		margin-bottom:1%;
	}
	.ctlbox{
		float:right;
	}
	.writerbox{
		margin-bottom:1%;
	}
	.writerbox>div{
			float:left;
	}
	.writerbox {
		clear:right;
		background-color: blue;
		margin-bottom:1%;
	}
	.textbox{
		clear:left;
		border-radius: 5px;
		border : 1px solid black;
		margin-top:1%;
	}
	
	.shortline{
		width :50%;
	}
	.edit{
	--bs-btn-border-radius: 0.375rem;
	}
	.bottom_btn{
		display:none;
		margin-top:1%;
		float : right;
	}
	.ck.ck-editor {
	display:none;
	}
	
</style>
<script type="text/javascript" src="/dcancer/config/MyCK.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/super-build/ckeditor.js"></script>
<link rel="stylesheet"  href="/dcancer/config/MyCK.css" type="text/css"/>
<script>
	$(function(){
		
		$('.editor').css('display','none');
		$('.edit').click(function(){
			console.log('click');
			$('#title').attr('readonly',false);
			$('.ck.ck-editor').css("display","block");
			$('.textbox').css("display","none");
			$('.top_btn').css('display','none')
			$(".bottom_btn").css('display','block');
		});
		$('.cancel_btn').click(function(){
			location.reload();
		});
		$('.del').click(function(){
			if(confirm('삭제하시겠습니까?')){
				location.href="noticeDel?no=${dto.no}&nowPage=${vo.nowPage}";
			};
		});
	});
</script>
<main class="main_frm">
	<div class="mainbody">
		<div class="top_btn" style="float:right;">
		  <button class='btn btn-warning edit'>수정</button>
		  <c:if test="${dto.empno==empno }">
		  <button class='btn btn-danger del'>삭제</button>
		  </c:if>
		</div>
		<div style="magin-top:1%;">
			<form method="post" action='noticeEdit'>
				<input type="hidden" name=no value="${dto.no}" >
				<div class="input-group mb-3">
				  <span class="input-group-text">제목</span>
				  <input type="text" class="form-control" name="title" id='title' value="${dto.title }" readonly>
				</div>
				<div class="writerbox">
					<div class="input-group shortline">
						<span class="input-group-text">작성자</span>
						<input type="text" class="form-control" name="writer" value="${dto.writer }">
						<input type="hidden" name=empno value="${dto.empno }"/>
					</div>
					<div class="input-group shortline">
						<span class="input-group-text">작성일</span>
						<input type="text" class="form-control" name="writeDate" class="form-control" readonly value="${dto.writeDate }"/>
					</div>
				</div>
				<div class="form-floating textbox" style="margin-top:1%;">
					<div>${dto.content } </div>
				</div>
				<textarea id="editor" name="content">${dto.content }</textarea>
				<script> EditorStart('editor'); </script>
				<div class='bottom_btn' style="float:left auto">
					<input type='button' class='cancel_btn btn btn-outline-danger' value='취소'/>
					<button class='submit btn btn-outline-success'>수정</button>
				</div>
			</form>
		</div>
	</div>
</main>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />