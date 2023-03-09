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

.container li{
	border : 1px solid black;
	width : 80%;
	
}

.content{
	width: 90%;
}
</style>
<script>
	
	function del(){
		if(confirm("삭제하시겠습니까?")){
			location.href="boardDel?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>";
		};
	};
</script>
<div class="choose" > 
<ul>
<li><a href="list?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>목록</button></a></li>
<c:if test="${logId==dto.id}">
<li><a href="edit?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>수정</button></a></li>
<li><button onclick="del()">삭제</button></li>
<li><a href="delete?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>삭제2</button></a>
</c:if>
</ul>
</div>
<div class="container">
<ul>
<li> 글번호 </li>
<li>${dto.no }</li>
<li> 작성자 </li>
<li>${dto.name }</li>
<li> 작성일 </li>
<li> ${dto.writedate}</li>
<li> 조회수 </li>
<li> ${dto.hit }</li>
<li> 제목 </li>
<li> ${dto.title }</li>
<li> 내용</li>
<li class="content"> ${dto.content }</li>
</ul>
</div>