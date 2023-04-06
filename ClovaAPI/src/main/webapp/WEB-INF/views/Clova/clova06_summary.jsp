<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summary</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function(){
		$("#summaryfrm").submit(function(){
			event.preventDefault();
			
			let params= $("#summaryfrm").serialize();
			let url="summary";
			
			$.ajax({
				type:'post',
				data:params,
				url:url,
				success:function(result){
					var jsonData = JSON.parse(result)
					console.log(result);
					var tag="<h5>"+jsonData.summary+"</h5>";
					$("#resultBox").append(tag);
				},error:function(error){
					console.log(error.responseText);
				}
			});
		});
	});
		
	
</script>

</head>
<body>
<div class="container">
	<h1>summary : 문서요약</h1>
	<form id = "summaryfrm" method="POST">
		언어선택 : <select name ="language">
			<option value="ko">한국어</option>
			<option value="ja">일본어</option>
		</select>
		문서종류 : <select name = "model">
			<option value="general">일반문서요약</option>
			<option value="news">뉴스요약</option>
		</select>
		톤(tone) : <select name = "tone">
			<option value ="0">원문어투유지</option>
			<option value ="1">해요체</option>
			<option value ="2">정중체</option>
			<option value ="3">명사체</option>
		</select>
		요약줄수 : <select name="summaryCount">
			<option value ="1">1줄요약</option>
			<option value = "2">2줄요약</option>
			<option value ="3" selected>3줄요약</option>
			<option value ="4">4줄요약</option>
			<option value ="5">5줄요약</option>
		</select><hr/>
		제목 : <input type="text" name="title" id="title" value="경찰관직무집행"/><br/>
		글내용 : <textarea name="content" id="content" rows ="7" style="width:100%;height:600">
제3조 (불심검문) ①경찰관은 수상한 거동 기타 주위의 사정을 합리적으로 판단하여 어떠한 죄를 범하였거나 범하려 하고 있다고 의심할 만한 상당한 이유가 있는 자 또는 이미 행하여진 범죄나 행하여지려고 하는 범죄행위에 관하여 그 사실을 안다고 인정되는 자를 정지시켜 질문할 수 있다.

②그 장소에서 제1항의 질문을 하는 것이 당해인에게 불리하거나 교통의 방해가 된다고 인정되는 때에는 질문하기 위하여 부근의 경찰서ㆍ지구대ㆍ파출소 또는 출장소(이하 “警察官署”라 하되, 地方海洋警察官署를 포함한다)에 동행할 것을 요구할 수 있다. 이 경우 당해인은 경찰관의 동행요구를 거절할 수 있다.

③경찰관은 제1항에 규정된 자에 대하여 질문을 할 때에 흉기의 소지여부를 조사할 수 있다.

④제1항 또는 제2항의 규정에 의하여 질문하거나 동행을 요구할 경우 경찰관은 당해인에게 자신의 신분을 표시하는 증표를 제시하면서 소속과 성명을 밝히고 그 목적과 이유를 설명하여야 하며, 동행의 경우에는 동행장소를 밝혀야 한다.

⑤제2항의 규정에 의하여 동행을 한 경우 경찰관은 당해인의 가족 또는 친지등에게 동행한 경찰관의 신분, 동행장소, 동행목적과 이유를 고지하거나 본인으로 하여금 즉시 연락할 수 있는 기회를 부여하여야 하며, 변호인의 조력을 받을 권리가 있음을 고지하여야 한다.

⑥제2항의 규정에 의하여 동행을 한 경우 경찰관은 당해인을 6시간을 초과하여 경찰관서에 머물게 할 수 없다. 

⑦제1항 내지 제3항의 경우에 당해인은 형사소송에 관한 법률에 의하지 아니하고는 신체를 구속당하지 아니하며, 그 의사에 반하여 답변을 강요당하지 아니한다.

 제4조 (보호조치등) ①경찰관은 수상한 거동 기타 주위의 사정을 합리적으로 판단하여 다음 각호의 1에 해당함이 명백하며 응급의 구호를 요한다고 믿을 만한 상당한 이유가 있는 자를 발견한 때에는 보건의료기관 또는 공공구호기관에 긴급구호를 요청하거나 경찰관서에 보호하는 등 적당한 조치를 할 수 있다.

1. 정신착란 또는 술취한 상태로 인하여 자기 또는 타인의 생명ㆍ신체와 재산에 위해를 미칠 우려가 있는 자와 자살을 기도하는 자

2. 미아ㆍ병자ㆍ부상자등으로서 적당한 보호자가 없으며 응급의 구호를 요한다고 인정되는 자. 다만, 당해인이 이를 거절하는 경우에는 예외로 한다.

②제1항의 긴급구호요청을 받은 보건의료기관이나 공공구호기관은 정당한 이유없이 긴급구호를 거절할 수 없다.

③제1항의 경우에 피구호자가 휴대하고 있는 무기ㆍ흉기등 위험을 야기할 수 있는 것으로 인정되는 물건은 경찰관서에 임시영치할 수 있다.

④경찰관이 제1항의 조치를 한 때에는 지체없이 이를 피구호자의 가족ㆍ친지 기타의 연고자에게 그 사실을 통지하여야 하며, 연고자가 발견되지 아니할 때에는 피보호자를 적당한 공중보건의료기관이나 공공구호기관에 즉시 인계하여야 한다.

⑤경찰관은 제4항의 규정에 의하여 피구호자를 공중보건의료기관 또는 공공구호기관에 인계한 때에는 즉시 그 사실을 소속 경찰서장 또는 지방해양경찰관서의 장에게 보고하여야 한다.

⑥제5항의 보고를 받은 소속 경찰서장 또는 지방해양경찰관서의 장은 대통령령이 정하는 바에 의하여 피구호자를 인계한 사실을 지체없이 당해 공중보건의료기관ㆍ공공구호기관의 장 및 그 감독행정청에 통보하여야 한다.

⑦제1항의 규정에 의한 경찰관서에서의 보호는 24시간을, 제3항의 임시영치는 10일을 초과할 수 없다.
		</textarea><br/>
		<input type="submit" value="문서요약하기"/>
	</form>
	<div class="mt-4 p-5 bg-warning text-success rounded" id="resultBox">
	
	</div>
</div>
</body>