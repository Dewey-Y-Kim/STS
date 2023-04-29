<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice Viewer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
	<button id="수정"></button><button id="삭제"></button>
	<form method="post" name="boardEdit">
		<input type="text" name=no value="${dto.no}" hidden>
		<div class="input-group mb-3">
		  <span class="input-group-text">제목</span>
		  <input type="text" class="form-control" name="title" value="${dto.title }">
		</div>
		<div class="input-group">
		<span class="input-group-text">작성자</span>
		<input type="text" class="form-control" name="ename" value="${dto.writer }">
		</div>
		<div class="input-group">
		<span class="input-group-text">작성일</span>
		<input type="text" class="form-control" name="writedate" class="form-control" readonly value="${dto.writedate }"/>
		</div>
		<div class="form-floating">
		<textarea class="form-control" name="content">${dto.content }</textarea>
		</div>
	</form>
</div>
</body>