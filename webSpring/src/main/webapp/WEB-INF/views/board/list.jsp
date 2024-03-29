<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	.boardHead{
		padding : 1.5%;
		background-color : #ddd;
	}
	.phead div{
		width :10%;
		float : right;
		pedding : 1%;
	}
	.phead div:last-child{
	text-align : right
	}
	.boardlist li{
		float:left;
		width: 10%;
		height : 40px;
		line-height : 40px;
		border-bottom : 1px solid #eee;
	}
	.boardlist li:first-child{
		width : 3%;	
	}
	.boardlist li:nth-child(6n+2){
		width : 50%;
		white-space : nowrap;
		overflow : hidden;
		text-overflow: ellipsis;
	}
	.boardlist li:nth-child(6n){
		width : 10%;
	}
	.paging_div li {
		float : left;
		padding : 1% 2%;
	}
	.paging_div li{
		float:left;
		padding : 10px 20px;
	}
	.paging_div a:link, .paging_div a:hover, .paging_div a:visited .boardlist a:link, .boardlist a:hover, .boardlist a:visited{
		color : #000;
	}
	.search_div{
		clear:left;
		padding : 1%;
		text-align : conter;
		margin : 10%;
		right :clear;
	}
	#search_frm input:nth-child(2){
		width : 35%;
	}
	
</style>
<script>
	$(function(){
		$("#search_frm").submit(function(){
			if($("#searchWord").val()=""){
				alert("검색어를 입력하세요");
				return false;
			}
		return true;
		});
		//전체선택 
		$('#allchooser').click(function(){
			$(".boardlist input[name=nolist]").prop('checked',$('#allchooser').prop('checked'));
		});
		$('#choiseDel').click(function(){
			var checkCnt=0;
			console.log(checkCnt);
			$(".boardlist input[name='nolist']").each(function(idx,obj){
				if($(obj)){ //obj.checked
					checkCnt++;
				}
			});
			if(checkCnt >0 ){
				if(confirm('정말 지울래?')){
					$('#delList').submit();
					
				}else{
					alert('선택된 글이 없습니다.');
				}
			}
		});
	});
</script>

<div class="container">
	<h1>게시판 목록</h1>
	
	<div class="boardHead"><a href="write"><button>글쓰기</button></a> 
	<div>
		<input type="button" id='choiseDel' value='선택삭제'/>
	</div>
		<div class="phead">
			<div> 총 레코드 : ${vo.totalRec}</div><br/>
			<div> ${vo.nowPage}/${vo.totalPage}</div>
		</div>
	</div>
	
	<form method='POST' action='MultiDel' id='delList'>
	<ul class="boardlist">
		<input id='nowPage' type='hidden' value='${vo.nowPage }'/>
		<c:if test="${$vo.searchword!=null }">
		<input id='searchWord' value='${vo.searchWord }' type='hidden'/>
		<input id='searchKey' value='${vo.searchKey }' type='hidden'/>
		</c:if>
		<li><input id='allchooser' type='checkbox'/></li>
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>등록일</li>
		<c:forEach var="bDTO" items="${list}">
			<c:if test="${logId == bDTO.id }"><li><input type='checkbox' name='nolist' value='${bDTO.no}'/></li>	</c:if>
			<c:if test="${logId!=bDTO.id }"><li><input type='checkbox' value='${bdto.id}' disabled/>		</li></c:if>
			<li>${bDTO.no }</li>
			<li><a href="contentView?no=${bDTO.no}&nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${bDTO.title }</a></li>
			<li>${bDTO.name }</li>
			<li>${bDTO.hit }</li>
			<li>${bDTO.writedate}</li>
		</c:forEach>
	</ul>
	</form>
	<div class="paging_div">
		<ul>
			<c:if test="${vo.idxPage==1 }">
			<li>prev</li>
			</c:if>
			<c:if test="${vo.idxPage!=1 }">
			<li><a href="list?nowPage=${vo.idxPage-vo.pagingCnt}">prev</a></li>
			</c:if>
			<!-- 페이지이동 -->
			<c:forEach var="page" begin="${vo.idxPage}" end="${vo.idxPage + vo.onePageCnt-1}">
				<c:if test="${page<=vo.totalPage}">
					<c:if test="${page == vo.nowPage }">
						<li style="background:#eee;">
					</c:if>
					<c:if test="${page != vo.nowPage }">
						<li>
					</c:if>
					<a href="list?nowPage=${page}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${page }</a> </li>
				</c:if>
			</c:forEach>
			 
			<c:if test="${vo.idxPage eq vo.lastIdxPage}">
			<li>next</li>
			</c:if>
			<c:if test="${vo.idxPage ne vo.lastIdxPage}">
			<li><a href="list?nowPage=${vo.idxPage+vo.onePageCnt }<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>

	<div class="search_div"> 
		<form method="get" id="search_frm" action="list">
			<select name="searchKey">
				<option value="title">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="search"/>
		</form>
		<!--  <input type="select" name="onePageRec" value="5">5</input>
		<input type="select" name="onePageRec" value="10">10</input>
		<input type="select" name="onePageRec" value="20">20</input> -->
	</div>
</div>
