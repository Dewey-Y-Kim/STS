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
	#reply{
		width :100%;
		height:30px;
		float:none;
	}
	#reply ul{
	
	}
	#reply textarea {
	
    width: 80%;
    height: 6.25em;
    border: none;
    resize: none;
  	}
	#reply li:eq(1){
	
	padding :10px 0;
	
	border:1px solid gray;
	
	}
</style>
<script>
	
	function del(){
		if(confirm("삭제하시겠습니까?")){
			location.href="boardDel?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>";
		};
	};
	$(function(){
		$("#replyFrm").submit(function(){
			if($("#coment").val()==""){
				alert("글을 입력해주세요.");
				return false;
			};
			
			//쿼리문 no=424&comment=34214 => form의 component data name속성 $("#commentFrm").serialize()
			var query = $(this).serialize();
			$.ajax({
				url:"/dcancer/replySend",
				data:query,
				type:"POST",
				success: function(result){
					console.log(result);
					$("#reply").val("");
					//댓글목록 가져오기
					
				},error:function(e){
					
				}
			});
			return false;
		});
	});
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
<c:if test="${logStatus=='Y'}">
<div id="reply">
	<form id="replyFrm">
	<ul>
		<h1>댓글</h1>
		<li><textarea name="content" id="comment"></textarea> </li>
		<li><button>댓글등록</button></li>
		<li><input type="hidden" name="no" value="${dto.no }"></li>
	</ul>
	</form>
</div>
</c:if>
</div>