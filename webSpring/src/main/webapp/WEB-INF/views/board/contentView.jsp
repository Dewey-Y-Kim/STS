<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	.choose{
	 	margin-right: 3%;
	 	margin-top :1%;
	 	float:right;
	}
	.choose li{
		display: inline-block;
	}
	
	#content>li{
		float:left;
		border-bottom:1px solid lightblue;
		text-align : center;
	}
	#content>li:nth-child(2n+1){
	width:20%;
	
	}
	#content>li:nth-child(2n){
	width :70%;
	}
	#content>li:last-child{
	width:100%;
	}
	.content.parent{
		width: 100%;
	}
	#reply{
		clear : left;
		width :100%;
		height:30px;
		
	}
	#reply textarea {
    width: 80%;
    height: 6.25em;
    border: 1px solid #eee;
    resize: none;
  	}
	#reply_frm li:first-child{
	width:10%;
	padding :10px 0;
	}
</style>
<script>
	
	function del(){
		if(confirm("삭제하시겠습니까?")){
			location.href="boardDel?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>";
		};
	};
	$(function(){
		function replyList(){
			$.ajax({
				url:"/dcancer/replyList",
				data:{
					no:${dto.no}	
				},
				type:"GET",
				dataType:"json",
					success:function(reply){
					var tag="";
					$(reply).each(function(i,rdto){
						tag+="<li><div><b>"+rdto.id+" ("+rdto.writedate+")</b>";
						console.log("logId : "+"${logId}");
						if(rdto.id=='${logId}'){
							//tag+="<input type='button' value='수정'/>";
							//tag+="<input type='button' value='삭제' id='"+rdto.replyNo+"'/>";
							tag+="<p>"+rdto.reply+"</p></div>";
							
							//tag+="<div class='edit_box' style='display:none;'>";
							//tag+="<form method='post'>";
							//tag+="<input type='hidden' name='replyNo' value='"+rdto.replyNo+"'/>";
							//tag+="<textarea name='reply' style='width:400px;height:80px;'>"+rdto.reply+"</textarea>";
							//tag+="<input type='submit' value='댓글수정'/></form><div>";
						}else{
							console.log('login안됨');
							tag+="<p>"+rdto.reply+"</p></div>";
						}
						tag+="</li>";
					});
					console.log(tag);
					$("#replyList").html(tag);
				},error(e){
					console.log(e.responseText);
				}
			});
		}
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
					replyList();			
				},error:function(e){
					console.log("error");
				}
			});
			return false;
		});
		$(document).on('click','#replyList input[value=수정]',function(){
			var dom = $(document).children("li");
			dom.children("div").eq(0).css('display','block');
			dom.children("div").eq(1).css('display','none');
			console.log("수정이벤트");

			$(this).parent().css("display",'none');
			$(this).parent().next().css("display","block");
		});
		$(document).on('click','#replyList input[value="댓글수정"]',function(){
			var params = $(this).parent().serialize();
			console.log(params);
			$.ajax({
				url:'/dcancer/replyEdit',
				data:params,
				type:"POST",
				success:function(result){
					/* $('#replyList>div>div:nth-first').css('display',block);
					$('#replyList>div>div:nth-last').css('display',none);
					*/
					$(this).parent().css('display','none');
					$(this).parent().next().css('display','block');
					replyList();
				},error(e){
					console.log(e.responseText);
				}
			});
			return false;
		});
		$(document).on('click','#replyList input[value=삭제]',function(){
			if(confirm("이 댓글을 삭제할까요?")){
				var params="replyno="+$(this).attr("id");
				console.log(params);
				$.ajax({
					url:"/dcancer/replyDelete",
					data:params,
					success:function(result){
						console.log(result);
						replyList();
						
					},error(e){
						console.log(e.responseText);
					}
				});
			}		
				
		})
		replyList();
		
	});
	
</script>
<div class="choose" > 
	<ul>
	<li><a href="list?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>목록</button></a></li>
	<c:if test="${logId==dto.id}">
		<li><a href="edit?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>수정</button></a></li>
		<li><button onclick="del()">삭제</button></li>
		<!-- <li><a href="delete?no=${dto.no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>"><button>삭제2</button></a></li> -->
	</c:if>
	</ul>
</div>
<div class="container">
	<ul id="content">
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
		<li class="content"> 내용</li>
		<li class="content"> ${dto.content }</li>
	</ul>


<c:if test="${logStatus=='Y'}">
<div id="reply">
	<form id="replyFrm">
		<ul>
			<li>댓글</li><li><button>댓글등록</button></li>
			<li><textarea name="reply" id="reply"></textarea> </li>
			<li><input type="hidden" name="no" value="${dto.no }"></li>
		</ul>
	</form>
	<div id=replyList></div>
</div>

</c:if>
</div>