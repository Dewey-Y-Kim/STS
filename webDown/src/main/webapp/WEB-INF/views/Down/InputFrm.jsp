<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InPutFrm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<Body>
<div class="inputFrm" >
	<form method="post" action="<%=request.getContextPath()%>/down/startDown">
		<input type="text" name="model" placeholder="모델명"/>
		<input type="text" name="color" placeholder="색상"/>
		<input type="text" name="ImgUrl" placeholder="이미지 주소"/>
		<input type="submit" value="submit"/>
	</form>
</div>
</Body>