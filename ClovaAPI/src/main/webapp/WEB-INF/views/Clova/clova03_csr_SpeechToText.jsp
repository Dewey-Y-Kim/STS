<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<script>
	$(function(){
		$("#csr_recognition").submit(function(){
			event.preventDefault();
			if($("#audioFile").val()==""){
				alert("음성파일 선택 후 사용해주세요");
				return false;
			}
			var formData= new FormData($('#csr_recognition')[0]);
			var url="csr_sttOk";
			$.ajax({
				type:'post',
				dataType:'text',
				url:url,
				data:formData,
				processData:false,
				async:false,
				contentType:false,
				success:function(result){
					console.log(result);
					var jsondata = JSON.parse(result);
					tag = "<div style='padding:5px; border:1px solid ligthblue;'>"+jsondata.text+"</div>";
					$("#textResult").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			})
		});
	});
</script>
<body>
<div class="csrFrm">
	<h1>Stt(Speech-To-Text)</h1>
	<p></p>
	<hr/>
	<form method="post" enctype="multipart/form-data" id="csr_recognition">
		언어선택
		<select name="language">
			<option value="Kor">한국어</option>
			<option value="Jpn">일본어</option>
			<option value="Eng">영어</option>
			<option value="Chn">중국어</option>
		</select>
		음성파일 선택 : <input type="file" id="audioFile" name="audioFile"/><br/>
		<button>텍스트 파일로 변환</button>
	</form>
</div>
<div id="textResult"></div>

</body>
</html>
