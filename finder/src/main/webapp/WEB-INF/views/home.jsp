<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div>
	<form id = "URLInputFrm" method="POST" action="Img/finderImg">
		<input type="text" name="model" placeholder="모델명"/>
		<input type="text" name="color" placeholder="색상"/>
		<input type="text" name="imgUrl" placeholder="첫번째 이미지 주소"/>
		<button>확인</button>
	</form>
</div>
<div></div>
<div></div>
</body>
</html>
	