<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<h1>
		Hello world!  
	</h1>

	<div class="desc">
		Javascript 외부파일 script.js<br/>
		css 외부파일 Style.css<br/>
		img<br/>
	</div>
	<div>
		번호 :${num }<br/>
		이름 :${name }<br/>
	</div>
	<img src="img/whyItworks.png" onclick="test()"/>
</div>