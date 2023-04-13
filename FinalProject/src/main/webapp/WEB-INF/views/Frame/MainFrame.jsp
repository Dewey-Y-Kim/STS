<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	const codedata="${codeData}";
	
	$(function(){
		$(document).ready(function(){
			if(${auth==2}){
				$(".main").load("Camp/main");
			}
			if(${auth==3 or auth==4}){
				$(".main").load("HQ/main");
			}
		});
		$('.btn').click(function(){
			var filename=$(this).attr('id');
			console.log(codedata);
			console.log(filename);
			$(".main").load(codedata+"/"+filename);
			// $(".main").html(tag);
		});	
	})
</script>
<style>
	.main{
	background-color: #ddd;
	}
</style>
<section id="section">
        <div class="body">
            <div class="left_submenu">
                <div>
                <c:if test="${auth==2}">
                	<jsp:include page="/resources/include/SideMenu/CampSideL.jsp" />
                </c:if>
                <c:if test="${auth==3}">
                	<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
                </c:if>
                <c:if test="${auth==4}">
                	<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
                </c:if>
                </div>
               
            </div>
            <div class="main">
            </div>
            <div class="right_submenu">
                <c:if test="${auth==2}">
                	<jsp:include page="/resources/include/SideMenu//CampSideR.jsp"></jsp:include>
                </c:if>
                <c:if test="${auth==4}">
                	<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
                </c:if>
            </div>
        </div>
    </section>