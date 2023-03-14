<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.choose{
 	float:right;
 	margin-right: 3%;
 	margin-top :1%;
}
.choose li{
	display: inline-block;
}

.view li{
	border : 1px solid black;
	width : 80%;
	
}

.view{
	width: 90%;
}
</style>
<script>
	function dataDelChk(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "../del/${dto.no}";
		}
	};
</script>
<div class="choose" > 
<ul>
<li><a href="list"><input type="button" value="목록"></button></a></li>
<c:if test="${logId==dto.id}">
<li><a href="../edit/${dto.no}"><input type="button" value="수정"/></a></li>
<li><input type="button" value="삭제" onclick="dataDelChk()"/></li>
</c:if>
</ul>
</div>
<div class="View">
<ul>
<li> 글번호 </li>
<li>${dto.no }</li>
<li> 작성자 </li>
<li>${dto.id }</li>
<li> 작성일 </li>
<li> ${dto.writedate}</li>
<li> 조회수 </li>
<li> ${dto.hit }</li>
<li> 제목 </li>
<li> ${dto.title }</li>
<li> 내용</li>
<li class="content"> ${dto.content }</li>
</ul>
<div>
	<c:forEach var="list" items="${list}">
		<a href="/dcancer/Upload/${list.filename}" download="${list.filename}"> ${list.filename }</a>
	</c:forEach>
</div>
</div>