<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<form id='loginFrm' method='post' action="<%=request.getContextPath() %>/LoginOk">
		 <ul>
		 <li><div class="input-group">
			<span class="input-group-text">ID</span>
			<input type='text' class="form-control" id='empno' name='empno' placeHolder="ID" value="24"/>
		</div></li>
		 <li><div class="input-group">
			<span class="input-group-text"></span>
			<input type='password' class="form-control" id='pwd' name='pwd' placeHolder="PassWord" value="12345"/>
		</div></li>
		<li><div class="input-group submit">
			<button class="btn-info btn-lg" >login</button>
		</div></li>
		</ul>
</form>
