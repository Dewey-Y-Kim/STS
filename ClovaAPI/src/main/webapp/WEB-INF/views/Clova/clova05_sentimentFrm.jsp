<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
	let sentiment = {
			negative : "부정",
			positive : "긍정",
			neutral : "중립"
	}
	$(function(){
		$("#sentiTest").click(function(){
			$.ajax({
				type:"post",
				dataType:"text",
				async:false,
				url:"sentiment",
				data:{
					"content":$('#content').val()			
				},
				success:function(result){
					console.log(result);
					let jsonData = JSON.parse(result);
					console.log(jsonData);
					let tag="";
					tag += "<h1> 감정분석 결과 : " + sentiment[jsonData.docVO.sentiment]+"<h1>";
					tag += "<h3> 신뢰도 : 긍정("+jsonData.docVO.positive+"%), 중립("+ jsonData.docVO.neutral+"%), 부정("+jsonData.docVO.negative+"%)</h3>"
					tag +="<hr/><h5>문장별 감정분석 결과<h5>";
					tag +="<table>";
					tag +="<tr><th>번호</th><th>문장</th><th>감정분석</th><th>긍정(%)</th><th>중립</th><th>부정(%)</th><th>글자수</th></tr>";
					jsonData.list.map(function(vo,i){
						tag +="<tr>";
						tag +="<td>"+(i+1)+"</td>";
						tag +="<td>"+vo.content+"</td>";
						tag +="<td>"+sentiment[vo.sentiment]+"</td>";
						tag +="<td>"+vo.positive+"</td>";
						tag +="<td>"+vo.neutral+"</td>";
						tag +="<td>"+vo.negative+"</td>";
						tag +="<td>"+vo.length+"</td>";
						tag +="</tr>";
					});
					tag += "<table>";
					$("#sentimentResult").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
</head>
<body>
<div id="container">
<h1> Centiment</h1>
<p>감정분석 API
텍스트 데이터를 분석해서 해당 단어, 문장, 문구 내용의 감정을 분석하는 서비스로 그 결과를 반환하는 HTTP 기반의 REST API입니다.</p>
	<textarea name="inputdata" rows="10" cols="100" id="content">
프랑스 파리뇌연구소(PBI) 연구팀은 왜 정신노동이 피로를 유발하는지 알아보고자 실험 참여자 40명을 모집해, 6시간에 걸쳐 머리를 많이 쓰게 하는 과제를 해결하게 하고 자기공명 분광법(MRS)으로 뇌의 변화를 확인했다. 
연구팀은 참여자들 40명을 어려운 과제를 푸는 집단과 쉬운 과제를 푸는 집단으로 나눴다. 
과제는 뇌 측정 스캐너에 누워서 풀어야 했고 그 내용은 다음과 같았다. 
1.6초 간격으로 다른 숫자를 화면에 보여주면서 지금 보여주는 문자가 이전 것과 같은지 여부를 말하도록 한 것이다.
 26명에겐 이전에 보여준 3개 문자를 기억한 뒤 일치 여부를 판단하는 어려운 문제를 줬고 14명에겐 이보다 쉬운 문제를 줬다.
 과면증은 밤에 7시간 이상 잠을 자고서도 낮에 졸음을 호소하는 경우 의심해볼 수 있다. 
 
	</textarea><br/>
	<input type="button" id="sentiTest" value="감정평가 (neutral / positve/ negative)"/>
	<hr/>
	<div id="sentimentResult"></div>
	 
</body>
</div>