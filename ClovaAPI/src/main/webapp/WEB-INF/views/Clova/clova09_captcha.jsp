<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	function imageChange(){
		let xhr = new XMLHttpRequest();
		xhr.responseType="blob"// 응답 바이너리코드
		xhr.onload = function(){
			var imgUrl = URL.createObjectURL(this.response);
			document.getElementById("imageCaptcha").src=imgUrl;
		}
		xhr.open("get", "captchImage");
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send();
	}
	function keyCheck(){
		if(document.getElementById("userin").value==""){
			alert("키값도!");
			return false;
		}
		document.getElementById("captachFrm").action="captcaImageCheck";
		return false;
	}
</script>
</head>
<body onload="imageChange()">
<div class="container">
	<h1>Captcha:</h1>
	<img src = "" id="imageCaptcha"/>
	<input type = "button" value = "새로고침" onclick="imageChange()"/>
	<hr/>
	<form method="post" id="captchaFrm" onsubmit="retrun keyCheck()">
		<input type="text" id = "userin" name="userin"/>
		<input type="submit" value="확인"/>
	</form>
</div>
</body>