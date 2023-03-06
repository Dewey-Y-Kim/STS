<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header,footer{
		display:none;
	}
</style>
<script>
	function setId(id){
		//회원가입폼에 체크한 id를 표기
		opener.document.getElementById("id").value = id;
		opener.document.getElementById("idstatus").value = 'y';
		//현재 아이디 검색창 닫기
		window.close(); //self.close();
	}
</script>
<div class="container">
	<div>
		<!-- 사용 가능 -->
		<c:if test="${result==0}">
		<b>${id}</b>는 사용 가능합니다.
		<!-- 사용하기 클릭 ->  -->
		<input type="button" value="사용" onclick="setId('${id}')"/>
		</c:if> 
		<!-- 사용 불가능 -->
		<c:if test="${result>0 }">
		<b>${id}</b>는 사용 불가능한 아이디입니다.
		</c:if>
	</div>
	<hr/>
	<div>
		<form>
			아이디 입력 : <input type="text" name="id" id="id" />
			<input type="submit" value="중복검사"/> 
		</form>
	</div>	
</div>