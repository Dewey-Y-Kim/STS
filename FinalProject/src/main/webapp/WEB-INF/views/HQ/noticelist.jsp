<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#main_body{
		width :80%;
		margin :0 auto;
	}
	#btn_box{
		margin-bottom:1%;
		margin-right : 1.9%;
	}
	.noticelist{
	width : 100%;
	overflow : scroll;
	}
	.noticelist>ul{

	}
	.noticelist>ul>li{
		width : 8%;
		float : left;
		text-align : center;
		height: 30px;
	}
	#no {
	}
	#subject {
		text-align: left;
	}
	.noficelist>ul>li:first-child{
	}
	.noticelist>ul>li:nth-child(2){
		width : 50%;
	}
	.noticelist>ul>li:nth-child(3){
		width : 24%;
	}
	.noticeline li:nth-child(1){
		text-align:left;
		background-color:red;
	}
	.pagingline {
		margin : auto;
		width :80%;
	}
	.pagingline li{
		margin : 1%;
		float : left;
		width : 10%;
		text-align : center;
		line-height : 20px;
	}
	.inputbox:ep(0){
		width:30%;
	}
	.inputbox:eq(1){
	}
	.pagingbox ul{
	margin:0 auto;
	float :left;
	clear : both;
	}
	.writeForm{
	display:none;
	}
	.noticeLine:hover li{ 
		background: black;
		color:white;
		border.
	}
	#submit_btn{
		margin-top : 1%;
		float : right;
	}
</style>
<script type="text/javascript" src="/dcancer/config/MyCK.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/super-build/ckeditor.js"></script>
<script>
	$(function(){
		$(document).on('click',".noticeLine",function(){
			console.log($(this).find(".no").attr("id"));
			location.href="noticeView?no="+$(this).find(".no").attr("id")+"&nowPage="+${vo.nowPage};
		});
	})
</script>
<link rel="stylesheet"  href="/dcancer/config/MyCK.css" type="text/css"/>
<script>
	$(function(){
		// $(noticeLine).hover{	}
		$('.writebtn').click(function(){
			console.log('click');
			$('.noticelist').css('display','none');
			$('.writeForm').css('display','block');
			EditorStart('editor');
		});
		var delnumber=[];
		
	});
</script>
<main class="main_frm container-fluid">
	<div id="main_body">
		<div class="noticelist rounded">
				<c:if test="${auth>2}">
				<div id='btn_box' class='d-flex justify-content-end'><button class='writebtn btn btn-success'>등록</button></div>
				</c:if>
			<ul class="title ">
				<li class="bg-secondary text-white h3">번호</li>
				<li class="bg-secondary text-white h3">제목</li>
				<li class="bg-secondary text-white h3">날짜</li>
				<li class="bg-secondary text-white h3">게시자</li>
				<li class="bg-secondary text-white h3">확인</li>
			</ul>
			<c:forEach var="notice" items="${noticelist}">
			<ul class = "noticeLine">
				<li id="${notice.no }" class='no h5'>${notice.no } </li>
				<li class="subject h5">${notice.title }</li>
				<li class="h5">${notice.writeDate }</li>
				<li class="h5">${notice.writer }</li>
				<li class="h5">${notice.hit }</li>
			</ul>
			
			</c:forEach>
			<div class='pagingbox'>
				<input id='nowPage' type='hidden' value='${vo.nowPage }'/>
				<ul class='pagingline'>
					<c:if test="${vo.idxPage==1 }">
					<li></li>
					</c:if>
					<c:if test="${vo.idxPage!=1 }">
					<li><a href="noticelist?nowPage=${vo.idxPage-vo.pagingCnt}">prev</a></li>
					</c:if>
					<!-- 페이지이동 -->
					
					<c:forEach var="page" begin="${vo.idxPage}" end="${vo.idxPage+vo.pagingCnt-1 }">
						<c:if test="${page<=vo.totalPage}">
							<c:if test="${page == vo.nowPage }">
								<li style="background:lightblue;">
							</c:if>
							<c:if test="${page != vo.nowPage }">
								<li>
							</c:if>
							<a href="noticelist?nowPage=${page}">${page }</a> </li>
						</c:if>
					</c:forEach>
					<c:if test="${vo.idxPage eq vo.lastIdxPage}">
					<li></li>
					</c:if>
					<c:if test="${vo.idxPage ne vo.lastIdxPage}">
					<li><a href="noticelist?nowPage=${vo.idxPage+vo.pagingCnt }">next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<div class='writeForm'>
			<form id='writeFrm' method="post" action="noticeinsert" >
				<div class="titlebox">
				<div class="input-group mb-3">
				  <span class="title input-group-text">제목</span>
				  <input type="text" class="inputbox form-control" name="title">
				</div>
				<div class="inputbox input-group mb-3">
				  <span class="input-group-text">작성자</span>
				  <input type="text" class="inputbox form-control" name="ename" value="${ename}" readonly>
				</div>
				</div>
		        <div >
		            <textarea id="editor" name="content"></textarea>
		        </div>
		        <div id="submit_btn">
		        	<input type="submit" class="btn btn-primary" value="저장하기"/>
		        </div>
			</form>
		</div>
	</div>
</main>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
<c:if test="${auth==4}">
	<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
</c:if>
