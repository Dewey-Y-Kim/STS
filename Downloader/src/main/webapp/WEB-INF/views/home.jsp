<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
ul li {
	width :100%;
	height : 2em;
	font-size:2em;
}
</style>
<div class="container">
	<img src="img/whyItworks.png"/>
	<form type="Post" action="/downloader">
		<ul>
		<li><input type="text" placehoder="첫 페이지의 이메일 주소를 입력해주세요"/></li>
		<li><button>제작</button></li>
		</ul>
	</form>
</div>