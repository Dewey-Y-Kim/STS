<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.caro_body_line{
	flex-direction : column;
	display:flex;
	flex:1;
}
.caro_body{
	display:flex;
	flex:1;
	width : 94%;
	min-height : 834px;
	min-width:700px;
}
#caro_body{
	width :100%;
}
.caro_btn{
	min-height : 834px;
	border:none;
	color : none;
}
.caro_L_btn{
	flex:0 0 3%;
	order : -1;
	min-height : 834px;
}
.caro_R_btn{
	flex:0 0 3%;
	order : 2;
}
.list>.box{
	border : 1px solid blue;
}
</style>
<main id='main_Frm' class="d-flex container-fluid">
		<div class="caro_L_btn">
			<button type="button" class="caro_btn" data-bs-target="#caro_body" data-bs-slide="prev">
			    <img src="${pageContext.request.contextPath}/resources/img/arrowL.png" style="filter: opacity(20%);width:20px;height:90px"/>
			</button>
		</div>
	<!-- Indicators/dots -->
	
	<!-- Carousel -->
		<div class='caro_body'>
			<div id="caro_body" class="carousel slide" data-bs-ride="false">
			<!-- The slideshow/carousel -->
				<div class="carousel-inner">
					<div class="carousel-item active list d-flex justify-content-around">
						<div>
							<input type="date" class="form-contol" name="startDate"/>
							<input type="date" class="form-contol" name="endDate"/>
						</div>
						
						<!-- list Style -->
						<div class="container box">
							<div class="line">
								<div>
									매장
								</div>
							</div>
						</div>
				    </div>
					<div class="carousel-item canvas">
						<!-- graph Style -->
						good?
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
</main>
<jsp:include page="/resources/include/SideMenu/CampSide.jsp" />
