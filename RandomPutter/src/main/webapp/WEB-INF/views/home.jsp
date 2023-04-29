<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<Script>
	$(function(){
		$('#StartSell').click(function(){
			url='startSell';
			$.ajax({
				url:url,
				type:"get",
				success:function(){
					alert('Started');
				},error:function(){
					alert('실패');
				}
			});
		});	
	});
	
</Script>
<body>
<Input type='button' value='판매시작' id='StartSell'>
</body>
</html>
