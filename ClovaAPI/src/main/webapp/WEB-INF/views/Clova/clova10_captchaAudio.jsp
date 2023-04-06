<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	function audioChange(){
		let xhr = new XMLHttpRequest();
		xhr.responseType="blob"// 응답 바이너리코드
		xhr.onload = function(){
			var audioUrl = URL.createObjectURL(this.response);
			document.getElementById("audioCaptcha").src=audioUrl;
			document.getElementById("audioCaptcha").play;
		}
		xhr.open("get", "captchAudio");
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send();
	}
	function keyCheck(){
		if(document.getElementById("userin").value==""){
			alert("키값도!");
			return false;
		}
		document.getElementById("captachFrm").action="captcaAudioCheck";
		return true;
	}
</script>
</head>
<!-- <body onload="audioChange()"> -->
<body>
<div class="container">
	<h1>Captcha:</h1>
	<h5>자동입력방지</h5>
	<audio src = "" id="audioCaptcha" controls> </audio>
	<input type = "button" value = "새로고침" onclick="audioChange()"/>
	<hr/>
	<form method="post" id="captchaFrm" onsubmit="retrun keyCheck()">
		<input type="text" id = "userin" name="userin"/>
		<input type="submit" value="확인"/>
	</form>
</div>
</body>