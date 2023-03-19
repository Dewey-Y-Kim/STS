<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$.Ajax(function(){
		if(${findInfo=='PWD'}){
			$('#findId').append("성공");
		}
	});
</script>
<div id='findId'>
<form  method="Post" action='/chkId'>
<input type="text" name='name' placeholder="성함을 알려주세요"/>
<input type="text" name='email'placeholder="이메일을 알려주세요"/>
<input type="hidden" value="인증번호"/>
<input type='button' value='확인'/>	

</form>
</div>