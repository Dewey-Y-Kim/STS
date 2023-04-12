<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		$(function(){
			$('document').ready(function(){
				$("#customFindFrm input").attr("readonly",true);
			});
		});
	</script>
	<div>
		<form id="customFindFrm">
			고객번호:<input type="text" name="customNo" id="customNo">
			이름:<input type="text" name="name" id="name">
			생일:<input type="date" name="birth" id="birth"/>
			email:<input type="text" name="email" id="email"/>
			주소:<input type="text" name="address" id="address"/>
			전화번호:<input type="text" name="tel" id="tel"/>
			성별:<select name="gender" id="gener">
				<option value="M">남</option>
				<option value="F">여</option>
			</select> 
			가입일:<input type="date" name="registDate" id="registDate"/>
			가입매장:<input type="text" name="code" id="code"/>
		</form>
	</div>
