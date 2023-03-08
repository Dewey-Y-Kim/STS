<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	.boardHead{
		padding : 1.5%;
		background-color : #ddd;
	}
	.phead div{
		width :10%;
		float : right;
		pedding : 1%;
	}
	.phead div:last-child{
	text-align : right
	}
	.boardlist li{
		float:left;
		width: 10%;
		height : 40px;
		line-height : 40px;
		border-bottom : 1px solid #eee;
	}
	.boardlist li:nth-child(5n+2){
		width : 60%;
		white-space : nowrap;
		overflow : hidden;
		text-overflow: ellipsis;
	}
	.paging_div li {
		float : left;
		padding : 1% 2%;
	}
	.paging_div li{
		float:left;
		padding : 10px 20px;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited{
		color : #000;
	}
	.search_div{
		clear:left;
		padding : 1%;
		text-align : conter;
		margin : 10%;
		right :clear;
	}
	#search_frm input:nth-child(2){
		width : 35%;
	}
	
</style>
<div class="container">
	<h1>게시판 목록</h1>
	
	<div class="boardHead"><a href="write">글쓰기</a> 
		<div class="phead">
			<div> 총 레코드 : ${vo.totalRec}</div><br/>
			<div> ${vo.nowPage}/${vo.totalPage}</div>
		</div>
	</div>
	
	
	<ul class="boardlist">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		<c:forEach var="bDTO" items="${list}">
			<li>${bDTO.no }</li>
			<li>${bDTO.title }</li>
			<li>${bDTO.name }</li>
			<li>${bDTO.hit }</li>
			<li>${bDTO.writedate}</li>
		</c:forEach>
	</ul>
	<div class="paging_div">
		<ul>
			<c:if test="${vo.idxPage==1 }">
			<li>prev</li>
			</c:if>
			<c:if test="${vo.idxPage!=1 }">
			<li><a href="list?nowPage=${vo.nowPage-5}">prev</a></li>
			</c:if>
			<!--<c:forEach var="num" begin="1" end="${onePageCnt}" step="1">
				<li>${vo.idxPage+num}</li>
			</c:forEach> -->
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li> 
			<c:if test="${vo.idxPage eq vo.lastIdxPage}">
			<li>next</li>
			</c:if>
			<c:if test="${vo.idxPage ne vo.lastIdxPage}">
			${vo.nowPage+vo.onePageCnt }
			<li><a href="list?nowPage=${vo.nowPage+5 }">next</a></li>
			</c:if>
		</ul>
	</div>
	<div class="search_div"> 
		<form method="get" id="search_frm">
			<select>
				<option value="제목">제목</option>
				<option value="작성자">작성자</option>
				<option value="내용">내용</option>
			</select>
			<input type="text" name=""/>
			<input type="submit" value="search"/>
		</form>
		<!--  <input type="select" name="onePageRec" value="5">5</input>
		<input type="select" name="onePageRec" value="10">10</input>
		<input type="select" name="onePageRec" value="20">20</input> -->
	</div>
</div>
