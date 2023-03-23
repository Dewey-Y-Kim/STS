<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	/*
	$.Ajax(function(){
		if(${findInfo=='PWD'}){
			$('#findId').append("성공");
		}
	});
	*/
	$(function(){
		$("#findIdfrm").submit(function(){
			event.preventDefault();
			if($("#name").val()==""){
				alert("이름이 없");
				return false;
			}
			if($("#email").val()==""){
				alert("이메일이이 없");
				return false;
			}
			var url='chkId';
			var param=$("#findIdfrm").serialize();
			$.ajax({
				url:url,
				type:'Post',
				data:param,
				success:function(result){
								
				},error(e){
					
				}
			});
		});
	});
</script>
<div id='findId'>
<form  method="Post" action='<%=request.getContextPath() %>/chkId' id='findIdfrm'>
	<ul>
	<li> 이름 : </li>
	<li><input type="text" name='name' placeholder="성함을 알려주세요"/></li>
	<li> 이메일 : </li>
	<li><input type="text" name='email' placeholder="이메일을 알려주세요"/></li>
	<li><input type='submit' value='확인'/></li>
	</ul>	
</form>
</div>