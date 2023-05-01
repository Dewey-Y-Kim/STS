<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main id='main_Frm'>
	<div class="line">
		<!-- Indicators/dots -->
		<div class="b-flex viewpart flex-row line caro_body_line ">
			<div class="caro_L_btn">
				<button type="button" class="caro_btn" data-bs-target="#caro_body" data-bs-slide="prev">
				    <span class="text-primary carousel-control-prev-icon"></span>
				    <img src="${pageContext.request.contextPath}/resources/img/arrowL.png" style="filter: opacity(20%);width:20px;height:90px"/>
				</button>
			</div>
			<!-- Carousel -->
			<div class='caro_body'>
				<div id="caro_body" class="carousel slide" data-bs-ride="false">
				<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active list">
							<!-- list Style -->
							
					    </div>
						<div class="carousel-item form">
							<!-- graph Style -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Right btn -->
			<div class="caro_R_btn">
				<button  type="button" class ="caro_btn btn-link" data-bs-target="#caro_body" data-bs-slide="next">
				    <img src="${pageContext.request.contextPath}/resources/img/arrowR.png" style="filter: opacity(20%);width:20px;height:90px"/>
				</button>
			</div>
		</div>
	</div>

</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />
