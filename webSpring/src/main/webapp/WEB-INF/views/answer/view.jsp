<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.ansview li{
		border-bottom: 1px solid #ddd;
		padding : 5px 0;
	}
</style>
<script>
</script>
<c:if test="${logStatus=='Y' }">
<div id="submenu">
	<a href="ansReplyWrite/${dto.no }"><input type='button' value='답글'/></a>
	<a href="replyUpdate/${dto.no }"><input type='button' value='수정'/></a>
	<input type='button' value='삭제'/>
</div>
</c:if>
<div class='ansview'>
	<ul>
		<li> 번호 : ${dto.no}</li>
		<li> 작성자 : ${dto.name} (작성자ID: ${dto.id })</li>
		<li> 등록일 : ${dto.writedate }</li>
		<li> 조회수 : ${dto.hit }</li>
		<li> <b>제목</b> : ${dto.title }</li>
		<li> 내용</li>
		<li> ${dto.content }</li>
	</ul>
</div>