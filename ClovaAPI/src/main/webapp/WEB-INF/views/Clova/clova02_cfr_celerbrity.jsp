<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function(){
		$("#selectfile").submit(function(){
			event.preventDefault();
			//이미지 없을 경우
			if($("#image").val()==""){
				alert("image 없음");
				return false;
			}
			
			var data= new FormData($("#selectfile")[0]);
			var url="cfr_celebrityOk";
			$.ajax({
				type:"post",
				dataType:"text",
				url:url,
				async:false,
				processData:false,
				contentType:false,
				data:data,
				success:function(result){
					$("#resultText").val(result);
					var jsonData=JSON.parse(result);
					var tag="";
					tag+= "<h4>Width:"+jsonData.info.size.width;
					tag+= ", Height:"+jsonData.info.size.height+"</h4>";
					tag+= "<h4>"+jsonData.info.faceCount+"</h4>";
					tag+= "<ul>"
					jsonData.faces.map(function(data,idx){
						tag+="<li>이름 : "+data.celebrity.value+"("+parseInt(data.celebrity.confidence*100)+"%)</li>"
					});
					tag+="</ul>";
					
					$("#result").html(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			})
		});
			
	});
</script>
</head>
<body>
	<h1> 유명인 얼굴인식 API</h1>
	<p></p>
	<ol>
		<li> 감지된 얼굴의 수</li>
		<li> 감지된 얼굴을 분석한 정보</li>
			<ul>
				<li>닮은 연예인이름</li>
				<li>해당 유명인을 닮은 정도</li>
			</ul>
	</ol>
	<hr/>
	<form id="selectfile" enctype="multipart/form-data">
		유명인 이미지 선택 : <input type="file" name="image" id="image"/><br/>
		<button>확인</button>
	</form>
	<img href=""/>
	<textarea id="resultText" rows="10" cols="100"></textarea>
	<div id="result"></div>
</body>