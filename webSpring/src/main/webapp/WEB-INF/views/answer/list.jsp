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
	.boardlist{
		overflow:auto;
		min-height: 100%;
	}
	.boardlist li{
		float:left;
		width: 10%;
		height : 40px;
		line-height : 40px;
		border-bottom : 1px solid #eee;
	}
	.boardlist li:nth-child(5n+2){
		width : 55%;
		white-space : nowrap;
		overflow : hidden;
		text-overflow: ellipsis;
	}
	.boardlist li:nth-child(5n){
		width : 15%;
	}
	.paging_div li {
		float : left;
		padding : 1% 2%;
	}
	.paging_div li{
		float:left;
		padding : 10px 20px;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited .boardlist a:link, .boardlist a:hover, .boardlist a:visited{
		color : #000;
	}
	.search_div{
		clear:left;
		padding : 1%;
		text-align : conter;
		margin : 10%;
		right :clear;
	}
	
	
</style>
<script>
	$(function(){

	});
</script>

<div class="container">
	<h1>계층형 게시판</h1>
	
	<div class="boardHead"><a href="write"><button>글쓰기</button></a> 
		<div class="phead">
			<div> 총 레코드 : ${totalRec}</div><br/>
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
			<li><a href="View?no=${bDTO.no}">${bDTO.title }</a></li>
			<li>${bDTO.name }</li>
			<li>${bDTO.hit }</li>
			<li>${bDTO.writedate}</li>
		</c:forEach>
	</ul>
</div>

