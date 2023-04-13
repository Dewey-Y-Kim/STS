<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script>
		$(function(){
			$('#loginFrm').submit(function(){
				if($('#empno').val()==null || $('#empno').val()==""){
					return false;
				}
				if($('#pwd').val()==""){
					return false;
				}
				return true;
			});
		});
	
	</script>
</head>
<body>
<form id='loginFrm' method='post' action="<%=request.getContextPath() %>/LoginOk">
		 <div class="input-group">
			<input type='text' class="form-control" id='empno' name='empno' placeHolder="ID" value="24"/>
		</div>
		 <div class="input-group">
			<input type='password' class="form-control" id='pwd' name='pwd' placeHolder="PassWord" value="12345"/>
		</div>
		<div class="input-group submit">
			<button class="btn-info btn-lg" >login</button>
		</div>
</form>
</body>
</html>
