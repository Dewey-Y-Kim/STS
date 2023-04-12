<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
</script>
<section id="section">
        <div class="body">
            <div class="left_submenu">
                <div>
                <c:if test="${auth==2}">
                	<jsp:include page="/resources/include/SideMenu/CampSideL.jsp" />
                </c:if>
                <c:if test="${auth==3} || ${auth==4}">
                	<jsp:include page="/resources/include/SideMenu/HQSideL.jsp" />
                </c:if>
                </div>
               
            </div>
            <div class="main">
                <c:if test="${auth==2}">
                	<jsp:include page="/resources/include/BodyFrm/Camp/main.jsp" />
                </c:if>
                <c:if test="${auth==3} || ${auth==4}">
                	<jsp:include page="/resources/include/BodyFrm/HQ/SelectCustom.jsp" />
                </c:if>
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