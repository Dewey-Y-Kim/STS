<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script>
		$(function(){
			$('.submit').onclick(function(){
				event.preventDefault();
				if($('#id')==null || $('#id')==""){
					return false;
				}
				if($('#pwd')==null || $('#pwd')==""){
					return false;
				}
				return true;
			});
		})
	
	</script>
</head>
<body>
<form id='loginFrm' method='post' action="Login">
	<input type='text' id='empno' name='empno' placeHolder="ID"/>
	<input type='password'id='pwd' name='pwd' placeHolder="PassWord"/>
	<input type='button' class='submit' value="Login"/>
</form>
</body>
</html>
