<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<Style>
	#logFrm input{padding-bottom: 50px 0; width:90%;}
</Style>
<script>
	$(function(){
		$("input[value='아이디 찾기']").click(function(){
			window.open("/findId","width=500, height=600");
		});
	});
</script>


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
	<div style="background: gray;margin:20%">
		<a href="join"> 회원가입</a>
		<a href="findId" name="findInfo" value="ID">아이디 찾기'</a>
		<a href="findId" name="findInfo" value="PWD">비밀번호찾기</a>
		
	</div>
</div>
