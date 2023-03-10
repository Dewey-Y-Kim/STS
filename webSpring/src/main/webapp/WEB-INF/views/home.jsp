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
	<div>
		<h2>파일업로드</h2>
		<pre>
			pom.xml 프레임워크 feat.mavenrepository
				1. commons -fileupload
				2. commons - io
			mvc-context MultipartResolver 객체 추가(bean)
			
			upload 위치 추가
				appServlet/servlet-context
		</pre>
	</div>
</div>