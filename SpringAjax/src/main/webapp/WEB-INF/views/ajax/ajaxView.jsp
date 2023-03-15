<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax in Spring</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	#result{
		border:5px solid #lightblue;
		width: 90%;
	}
</style>
<script>
	$(function(){
		//비동기식 문자열 받아오기
		$("#ajaxString").click(function(){
			var address = "ajaxString";
			var params = "num=1234&name=울트라맨2022";
			$.ajax({
				url : address,
				data : params,
				type : "GET",
				success:function(result){
					console.log(result);
					$("#result").append("<div>"+result+"</div>")
				},error:function(e){
					console.log(e.responceText);
				}
			});
		});
	});
</script>
</head>
<body>
<h4> 비동기식컨트롤러 접속 정보 리턴</h4>
<input type="button" id="ajaxString" value="aJax 문자열"/>
<div id="result">
	
</div>
</body>