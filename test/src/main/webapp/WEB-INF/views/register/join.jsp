<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<form>
		<ul>
			<li>아이디id</li>
			<li><input type="text" name="id" id="id"/></li>
			<li>pw</li>
			<li><input type="password" name="pw" id="pw"/></li>
			<li>pw2
			<li><input type="password" name="pw2" id="pw2"/></li>
			<li>name</li>
			<li><input type="text" name="name" id="name"/></li>
			<li>tel</li>
			<li>
			<select name="tel1" id="tel1">
				<option value="010">010</option>
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="041">041</option>
				<option value="051">051</option>
			</select>
			-<input type="text" name="tel2" id="tel2" Maxlength="4" minlength="3"/>-
			<input type="text" name="tel3" id="tel3" Maxlength="4" minlength="3"/>
			</li>
			<li>email</li>
			<li><input type="text" name="email" id="email"/></li>
			<li>post</li>
			<li><input type="text" name="post" id="post"/></li>
			<li>addr</li>
			<li><input type="text" name="addr" id="addr"/></li>
			<li>address </li>
			<li><input type="text" name="addr" id="addr"/></li>
			<li>hobby</li>
			<li>
				<input type="checkbox" name="hobby" id="hobby" value="검도"/>검도
				<input type="checkbox" name="hobby" id="hobby" value="등산"/>등산
				<input type="checkbox" name="hobby" id="hobby" value="사이클"/>사이클
				<input type="checkbox" name="hobby" id="hobby" value="IT"/>IT
				<input type="checkbox" name="hobby" id="hobby" value="웨이트"/>웨이트
		</ul>	
	</form>
</div>