<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeList</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
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
	}
	.noticelist>ul>li:nth-child(2){
	width : 75%;
	}
</style>
</head>
<body>
<div class="noticelist rounded">
	<ul>
		<li>번호</li>
		<li>제목</li>
		<li>날짜</li>
		<li>게시자</li>
	</ul>
	<hr>
	<c:forEach var="notice" items="${noticelist}">
	<a href="HQ/noticeView/${notice.no}">
	<ul>
		<li>${notice.no } </li>
		<li>${notice.title }</li>
		<li>${notice.writeDate }</li>
		<li>${notice.writer }</li>
	</ul>
	</a>
	</c:forEach>
	<div>
		<button>이전</button>
		<button>다음</button>
	</div>
</div>
</body>