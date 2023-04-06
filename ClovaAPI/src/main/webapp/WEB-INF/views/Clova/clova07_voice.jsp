<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voice</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function(){
		$("#voiceFrm").submit(function(){
			event.preventDefault();
			//javascript Ajax 비동기처리객체
			let xhr = new XMLHttpRequest();
			xhr.responseType ="blob";
			//응답 받았을때
			xhr.onload = function(){
				var audioUrl= URL.createObjectURL(this.response);
				
				var audio = new Audio();
				audio.src=audioUrl;
			}
			//접속 오픈
			xhr.open("post","voiceOk");
			//header setting
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			
			//서버 접속 data 전송
			let para= $("#voiceFrm").serialize();
			console.log(para);
			xhr.send(para);
			
			
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>Voice</h1>
		<p>음성으로 변환할 텍스트와 음색, 속도, 감정 등을 파라미터로 입력받은 후 음성을 합성하여 그 결과를 반환하는 HTTP 기반의 REST API입니다.</p>
		<form method="post" id="voiceFrm">
		목소리종류 : <select name="speaker">
			<option value="nara_call">아라(상담원): 한국어, 여성 음색</option>
			<option value="ndain">다인: 한국어, 아동 음색 (여)</option>
			<option value="ngaram">가람: 한국어, 아동 음색 (여)</option>
			<option value="nsiyoon">시윤: 한국어, 남성 음색</option>
			<option value="vhyeri">혜리: 한국어, 여성 음색</option>
			<option value="dara-danna">아라 And 안나: 한국어+영어(미국), 여성 음색</option>
		</select>
		볼륨 <select name="volume">
			<script>
				for(var i=-5;i<=5;i++){
					document.write("<option value='"+i+"'");
					if(i==0){
						document.write(" selected");
					}
					document.write(">"+i+"</option>");
				}
			</script>
		</select>
		속도 :<select name="speed">
			<script>
				for(var i=-5;i<=5;i++){
					document.write("<option value='"+i+"'");
					if(i==0){
						document.write(" selected");
					}
					document.write(">"+i+"</option>");
				}
			</script>
		</select>
		피치:<select name="pitch">
			<script>
				for(var i=-5;i<=5;i++){
					document.write("<option value='"+i+"'");
					if(i==0){
						document.write(" selected");
					}
					document.write(">"+i+"</option>");
				}
			</script>
		</select>
		감정:<select name="emotion">
			<option value="0">중립</option>
			<option value="1">슬픔</option>
			<option value="2">기쁨</option>
			<option value="3">분노</option>
		</select>
		<hr/>
		<textarea name="text" rows="10" cols="100">
제10조의4(무기의 사용) ① 경찰관은 범인의 체포, 범인의 도주 방지, 자신이나 다른 사람의 생명ㆍ신체의 방어 및 보호, 공무집행에 대한 항거의 제지를 위하여 필요하다고 인정되는 상당한 이유가 있을 때에는 그 사태를 합리적으로 판단하여 필요한 한도에서 무기를 사용할 수 있다. 다만, 다음 각 호의 어느 하나에 해당할 때를 제외하고는 사람에게 위해를 끼쳐서는 아니 된다.1. 「형법」에 규정된 정당방위와 긴급피난에 해당할 때2. 다음 각 목의 어느 하나에 해당하는 때에 그 행위를 방지하거나 그 행위자를 체포하기 위하여 무기를 사용하지 아니하고는 다른 수단이 없다고 인정되는 상당한 이유가 있을 때가. 사형ㆍ무기 또는 장기 3년 이상의 징역이나 금고에 해당하는 죄를 범하거나 범하였다고 의심할 만한 충분한 이유가 있는 사람이 경찰관의 직무집행에 항거하거나 도주하려고 할 때나. 체포ㆍ구속영장과 압수ㆍ수색영장을 집행하는 과정에서 경찰관의 직무집행에 항거하거나 도주하려고 할 때다. 제3자가 가목 또는 나목에 해당하는 사람을 도주시키려고 경찰관에게 항거할 때라. 범인이나 소요를 일으킨 사람이 무기ㆍ흉기 등 위험한 물건을 지니고 경찰관으로부터 3회 이상 물건을 버리라는 명령이나 항복하라는 명령을 받고도 따르지 아니하면서 계속 항거할 때3. 대간첩 작전 수행 과정에서 무장간첩이 항복하라는 경찰관의 명령을 받고도 따르지 아니할 때② 제1항에서 “무기”란 사람의 생명이나 신체에 위해를 끼칠 수 있도록 제작된 권총ㆍ소총ㆍ도검 등을 말한다.③ 대간첩ㆍ대테러 작전 등 국가안전에 관련되는 작전을 수행할 때에는 개인화기(個人火器) 외에 공용화기(共用火器)를 사용할 수 있다.
		</textarea>
		<input type="submit" value="Speaker"/>
		</form>
		
	</div>
</body>