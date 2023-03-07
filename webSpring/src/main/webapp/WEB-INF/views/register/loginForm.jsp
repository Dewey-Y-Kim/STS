<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<Style>
	#logFrm input{padding-bottom: 50px 0; width:90%;}
</Style>



<div class="container">
	<form method="post" action="loginOk" id="logFrm">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="usrid" id="usrid"/></li>
			<li>비밀번호</li>
			<li><input type="password" name="usrpwd" id="usrpwd"/></li>
			<li><input type="submit" value="Login" /></li>
		</ul>
	</form>
	<div style="background: gray;margin=20%;">
		<a href="join"> 회원가입</a>
		<a href="">아이디찾기</a>
		<a href="">비밀번호찾기</a>
		
	</div>
</div>
