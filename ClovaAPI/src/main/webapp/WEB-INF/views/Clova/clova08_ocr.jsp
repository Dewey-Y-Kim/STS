<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OCR</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function(){
		$("#ocrFrm").submit(function(){
			event.preventDefault();
			if($("#image").val()==""){
				alert("이미지 내나");
				return false;
			}
			var ocrfrm = new FormData($("#ocrFrm")[0]);
			var url="ocr";
			$.ajax({
				type:"POST",
				dataType:"text",
				data:ocrfrm,
				url:url,
				async:false,
				processData:false,
				contentType: false,
				success:function(success){
					$("#result").val(success);
				},error:function(e){
					console.log(e.responseText)
				}
			})
		});
	});
</script>
</head>
<body>
<div class="container">
	<form id="ocrFrm" method="Post" enctype="multipart/form-data">
		택스트가 있는 이미지선택:<input type="file" id="image" name="image"/>
		<input type="submit" value="작업시작"/>
	</form>
<div id="resultBox">
<textarea id="result" rows="10" cols="30" style="width:100%; height:300px;"></textarea>
</div>
</div>
</body>