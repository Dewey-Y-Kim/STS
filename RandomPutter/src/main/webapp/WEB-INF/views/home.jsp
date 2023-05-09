<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<Script>
	$(function(){
		$("#datePut").click(function(){
			url="dateSell";
			var date = $("#dateform").serialize();
			$.ajax({
				url:url,
				data:date,
				type:'Get',
				success:function(result){
					$("dateput").html("success");
				},error:function(e){
					console.log(e.responseText());
				}
			});
		});
		
		$("#selldata").click(function(){
			console.log(1);
			$.ajax({
				url:'sellDate',
				data:$("#sell").serialize(),
				success:function(result){
					console.log("success");
					
				},error:function(e){
					console.log(e.responseText)	
				}
			});
		});	
	});
	
</Script>
<body>

	<form id="dateform">
		<div>start:<input type="date" name="start"></div>
		<div>end : <input type="date" name="end"></div>
		<div><input type="button" id="datePut" value="시작"></div>
	</form>
	DatePut<div id="dateput"> </div>
	
	<form id="sell">
	<input type="date" name="date">
	<input type="button" value="판매등록" id="selldata">
	</form>
</body>
</html>
