<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	console.log(${codeData});
	$(function(){
		$('.btn').click(function(){
			console.log('/resources/include/BodyFrm/'+${'codedata'}+$(this).attr("id"));
			$('.main jsp:include').attr('page','/resources/include/BodyFrm/'+${'codedata'}+'/'+$(this).attr("id"));
		})	
	})
</script>
<div class="left_menu btn-group-vertical">
<button id='search' class="btn btn-outline-primary">고객조회</button>
<button id='Optometry' class="btn btn-outline-primary">검안입력</button>
<button id='Selldata' class="btn btn-outline-primary">매출등록</button>
<button id='Lens' class="btn btn-outline-primary">렌즈주문</button>
<button id='CampSell' class="btn btn-outline-primary">매장별<br/>매출</button>
<button id='management' class="btn btn-outline-primary">매장관리</button>
</div>
