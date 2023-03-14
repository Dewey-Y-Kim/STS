<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.list {
	overflow :auto;
}

.list li{
	float: left;
	width : 15%;
	height : 5%;
	border-bottom :1px solid black;
}
.list li:nth-child(5n+2){
	width : 50%;
	white-space : nowrap;
	overflow : hidden;
	text-overflow : ellipsis;
}
.list li:nth-child(5n+1), .list li:nth-child(5n+4){
	width : 8%;
}
.list li:nth-child(5n+3), .list li:nth-child(5n){
	width :15%;
}
.first {
	text-align : center;
}
</style>
<script>

</script>
<div class="container">
	<h4> 자료실 목록</h4>
	<div>
		<a href="dataWrite"><button>글쓰기</button></a>
	</div>
	<div>
		<ul class="list">
			<li class="first">번호</li>
			<li class="first">제목</li>
			<li class="first">글쓴이</li>
			<li class="first">조회수</li>
			<li class="first">등록일</li>
			
			<c:forEach var="data" items="${list}">
				<li>${data.no}</li>
				<li><a href="<%=request.getContextPath() %>/data/view/${data.no}">${data.title}</a></li>
				<li>${data.name}</li>
				<li>${data.hit}</li>
				<li>${data.writedate}</li>
			</c:forEach>
		</ul>
	</div>
</div>