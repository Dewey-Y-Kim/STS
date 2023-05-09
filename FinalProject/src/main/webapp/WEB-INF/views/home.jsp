<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
.mainfrm{
}

#loginFrm {
	float : right;
	width : 20%;
	position : absolute;
	top :80%;
	right :10%;
}
#filterBox{
position:absolute;
	left: 40%;
	top : 15%;
	width : 350px;
	height:500px;
	background: linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(70,100,251,0) 5%, rgba(111,134,252,0) 95%, rgba(255,255,255,1) 100%), linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(70,100,251,0) 5%, rgba(111,134,252,0) 95%, rgba(255,255,255,1) 100%);
	
}
#imgBox{
	position:absolute;
	left: 40%;
	top : 15%;
	width : 350px;
	height:500px;
	margin :0 auto;
	border-radius : 20px;
}
</style>
    
<main class="main_frm container">
	<form id='loginFrm' method='post' action="<%=request.getContextPath() %>/LoginOk">
			 <ul>
			 <li><div class="input-group">
				<span class="input-group-text">ID</span>
				<input type='text' class="form-control" id='empno' name='empno' placeHolder="ID" value="46"/>
			</div></li>
			 <li><div class="input-group">
				<span class="input-group-text"><img src='resources/img/lock.svg' width="15px"></span>
				<input type='password' class="form-control" id='pwd' name='pwd' placeHolder="PassWord" value="12345"/>
			</div></li>
			<li><div class="input-group d-flex flex-row-reverse submit">
				<button class="btn-info btn-lg" >login</button>
			</div></li>
			</ul>
	</form>
	<div id="imgBox"> 
		<div id="demo" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
		  <!-- Indicators/dots -->
		  <div class="carousel-indicators" Style="display:none;">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="6"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="7"></button>
		  </div>
		
		  <!-- The slideshow/carousel -->
		  <div class="carousel-inner">
		    <div class="carousel-item active  justify-content-center">
		      <img src="resources/img/opt/optimg_10.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_11.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_12.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_13.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_2.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_5.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_7.jpg" class="d-block h-100">
		    </div>
		    <div class="carousel-item justify-content-center">
		      <img src="resources/img/opt/optimg_8.jpg" class="d-block h-100">
		    </div>
		  </div>
		</div>
	</div>
	<div id="filterBox" >
	</div>
</main>