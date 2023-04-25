<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.noticelist{
	width : 100%;
	overflow : scroll;
	}
	.noticelist>ul{

	}
	.noticelist>ul>li{
		width : 7%;
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
		width :0.5%;
	}
	.noticelist>ul>li:nth-child(3){
		width : 64%;
	}
	.noticeline li:nth-child(2){
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
		width:30%;
	}
	.pagingbox ul{
	margin:0 auto;
	float :left;
	clear : both;
	}
	.writeForm{
	display:none;
	}
	.noticeLine:hover li { 
		background: gray;
	}
</style>
<script type="text/javascript" src="/dcancer/config/MyCK.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/super-build/ckeditor.js"></script>
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
});
</script>
<main class="main_frm container-fluid">
<div class="noticelist rounded">
		<c:if test="${auth>2}">
		<button class='writebtn'>write</button><br/>
		</c:if>
	<ul>
		<li>□</li>
		<li>번호</li>
		<li>제목</li>
		<li>날짜</li>
		<li>게시자</li>
		<li>확인</li>
	</ul>
	<c:forEach var="notice" items="${noticelist}">
	<ul class = "noticeLine">
		<li><input type=checkbox class="" value="${notice.no }"/></li>
		<li id="no">${notice.no } </li>
		<li id="subject"><a href="noticeView?no=${notice.no}&nowPage=${vo.nowPage}">${notice.title }</a></li>
		<li>${notice.writeDate }</li>
		<li>${notice.writer }</li>
		<li>${notice.hit }</li>
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
	<form id='writeFrm' method="post" action="noticeinsert">
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
        
        <input type="submit" value="저장하기"/>
</form>
</div>

</main>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
<c:if test="${auth==4}">
	<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
</c:if>
