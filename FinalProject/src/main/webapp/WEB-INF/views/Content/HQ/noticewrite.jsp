<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
	$("#noticefrm").submit(function(){
		event.preventDefault();
		if($("#title").val()==""||$("#title").val()==null{
			alert("제목이 없습니다.");
			return false;
		}
		if($("#title").val()==""||$("#title").val()==null{
			alert("제목이 없습니다.");
			return false;
		}
		return true;
	})
</script>
</head>
<body>
<div class="container">
<div class="mt-4 p-5 bg-primary text-white rounded">
	<form id="noticefrm"method='post'>
		<input id='title' name='title' maxlength="200"/>
		<textarea id='content' name='content' rows="100" cols="200"></textarea>
		<button></button>
	</form>
</div>
</div>
</body>