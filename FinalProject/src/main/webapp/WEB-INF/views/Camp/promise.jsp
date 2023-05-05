<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	#main_frm{
		min-width:80%;
		max-height:800px;
		overflow: scroll;
	}
	#main_body{
		width : 80%;
		margin : 0 auto;
		margin-top : 1%;
	}
	#dateIn{
		width : 30%;
	}
	main div{
		text-align: center;
	}
	#list_title{
		margin-top : 1%;
		border-radius : 5px;
	}
	.title_name{
		width : 20%;
	}
	.title_tel{
		width : 20%;
	}
	.title_selldate{
		width : 20%;
	}
	.title_item{
		width : 20%
	}
	.title_qtt{
		width : 10%;
	}
	.title_price{
		width : 10%;
	}
	.detail_list{
		width : 40%;
	}
	.item{
		width : 50%;
	}
	.qtt{
		width : 25%;
	}
	.price{
		width : 25%;
	}
	.line{
		border : 1px solid lightblue;
		border-radius: 5px;
	}
	.line:nth-child(2n){
		background: #eee;
	}
</style>
<script>
	$(function(){
		$('#sel_Date').change(function(){
			$.ajax({
				url:'promise',
				data:{date:$('#sel_Date').val()},
				type:'post',
				success:function(result){
					var jdata= JSON.parse(result);
					console.log(jdata);
					var tag="";
					jdata.map(function(line,idx){
						tag += '<div class="line d-flex"><div class="title_name">'+line.name;
						tag += '<input type="hidden" name="customNo" value="'+line.customNo+'"></div>';
						tag += '<div class="title_tel">'+line.tel+'</div>';
						tag += '<div class="title_selldate">'+line.selldate+'</div>';
						tag += '<div class="d-flex flex-column detail_list">' 
						line.detail.map(function(data,idx){
							tag += '<div class="d-flex">'
							tag += '<div class="item">'+data.model+'</div>';
							tag += '<div class="qtt">'+data.qtt+'</div>';
							tag += '<div class="price">'+data.priceStr+'</div></div>';
						});
						tag+= '</div></div>';
					});
					$("#list").html(tag);
				},error:function(e){
					console.log(e.responseText);
					}
				});
			});	
		});
</script>
<main id='main_frm'>
	<div id="main_body">
		<div class="d-flex justify-content-end">
			<div id="dateIn" class="input-group">
				<span class="input-group-text">예약일</span>
				<input type ="date" class="form-control" id="sel_Date" value="${date }">
			</div> 
		</div>
		
		<div id="list_title" class="title list d-flex bg-secondary text-white h3">
			<div class="title_name">고객명</div>
			<div class="title_tel">전화번호</div>
			<div class="title_selldate">판매일</div>
			<div class="title_item">판매내역</div>
			<div class="title_qtt">수량</div>
			<div class="title_price">가격</div>
		</div>
		<div id="list" class="list d-flex flex-column">
			<c:forEach var="list" items="${list }">
			<div class="line d-flex">
				<div class="title_name">
					${list.name }
					<input type="hidden" name="customNo" value="${list.customNo }">
				</div>
				<div class="title_tel">${list.tel }</div>
				<div class="title_selldate">${list.selldate }</div>
				<div class="d-flex flex-column detail_list"> 
					<c:forEach var="data" items="${data }">
						<c:if test="${data.sellNo eq list.sellNo }">
						<div class="d-flex">
							<div class="item">${data.model }</div>
							<div class="qtt">${data.qtt }</div>
							<div class="price">${data.realpriceStr }</div>
						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>


</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />