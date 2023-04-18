<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<main class="main_frm container-fluid ">
	<h5>HQ main</h5>
	<div>
		search
	</div>
	<div>
		graph
	</div>
	<div>
		today	
	</div>
	<div>
		notice
	</div>
</main>
<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
	<c:if test="${auth==4}">
		<jsp:include page="/resources/include/SideMenu//HQSideR.jsp"></jsp:include>
    </c:if> 
