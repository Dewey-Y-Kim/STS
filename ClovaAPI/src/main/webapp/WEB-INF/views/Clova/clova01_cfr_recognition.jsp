<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
  
<Style>
	#text{
		width: 60%;
	    height: 20em;
	    border: 1px solid lightblue;
	    resize: none;
	}
	#result{
		border:1px soild blue;
		width:100%;
	}
</Style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function(){
		$("#uploadFrm").submit(function(){
			event.preventDefault();
			if($("#image").val()==""){
				alert("image 없음");
				return false;
			}
			console.log("chkPoint1");
			var form = $("#uploadFrm")[0];
			var data= new FormData(form);
			var url="cfr_recognitionOk";
			console.log("chkPoint2");
			$.ajax({
				type:"POST",
				dataType:"text",
				data:data,
				url:url,
				async:false,
				processData:false,
				contentType:false,
				success:function(result){
					$('#text').val(result);
					var json=JSON.parse(result);
					console.log(json);
					var tag="<h3>이미지 폭 : "+json.info.size.width+"px , 높이 : "+json.info.size.height+"px </h3>";
					tag +="<h3> 인원수 : "+json.info.faceCount+"명 </h2>";
					
					tag += "<table class='table table-striped'>";
					tag += "<tr><td>번호</td><td>나이</td><td>성별</td><td>눈(좌)</td><td>눈(우)</td><td>코</td><td>입(좌)</td><td>입(우)</td><td>감정</td><td>포즈</td><tr>";
					json.faces.map(function(face,idx){
						tag+="<tr><td>"+(idx+1)+"</td><td>"+face.age.value+"("+face.age.confidence+"%)</td><td>";
						if(face.gender.value=='female') tag +='여'; else tag+='남';
						tag+="("+(face.gender.confidence*100)+") ";
						tag+="</td>";
						if(face.landmark==null){
							tag+="<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>";
						}
						if(face.landmark.leftEye==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>좌안 x : "+face.landmark.leftEye.x+", y : "+face.landmark.leftEye.y;+"</td>";}
						if(face.landmark.rightEye==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>x : "+face.landmark.rightEye.x+", y : "+face.landmark.rightEye.y;+"</td>";
						}
						if(face.landmark.nose==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>코 x : "+face.landmark.nose.x+", y : "+face.landmark.nose.y+"</td>";
						}
						if(face.landmark.leftmouth==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>입(좌)  x: "+face.landmark.leftMouth.x+", y:"+face.landmark.leftMouth.y+"</td>";}
						if(face.landmark.rightmouth==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>입(우) x: "+face.landmark.rightMouth.x+", y:"+face.landmark.rightMouth.y+"</td>";}
						if(face.emotion==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>감정 :"+face.emotion.value+"("+(face.emotion.confidence*100)+"%)"+"</td>";}
						if(face.pose==null){tag+="<td>&nbsp;</td>"}else{
						tag+="<td>포즈 :"+face.pose.value+"("+(face.pose.confidence*100)+"%)</td></tr>";}
					});
					$("#result").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
</head>
<body>
	
	<h1> CFR Recognition</h1>
	<p>얼굴과 관련된 다양한 정보를 제공하는 얼굴 감지 및 인식 API
이미지 속 얼굴의 윤곽, 눈, 코, 입, 표정 값을 얻어 다양하게 활용할 수 있습니다.
	</p>
	<form id="uploadFrm" enctype="multipart/form-data">
		이미지 선택 : <input type="file" name="image" id="image"/><br/>
		<input type="submit" value="확인"/>
	</form>
	<textarea id="text"></textarea>
	<div id="result"></div>
</body>