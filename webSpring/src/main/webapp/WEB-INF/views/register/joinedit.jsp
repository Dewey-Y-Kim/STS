<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style> 
	#joineditform ul{
		overflow : auto;
		width : 80%;
	}
	
	#joineditform li{
		float : left;
		width : 20%;
		padding : 10px 0;
		border-bottom: 1px solid gray;
		line-height:40px;
	}
	
	#joineditform li:nth-child(2n){
		width: 80%;
	}
	#joineditform li:last-child{
		width: 100%;
	}
	#addr{
		width : 80%;
	}

</style>
<script>
	$(function(){
		$("#zipsearch").on('click',function(){
			window.open("zipcodeSearch","zipcode","width=500, height=600")
		});
		$("#joineditform").submit(function(){
			//id 첫글자 영어 대소문자 영어대소문자,숫자,_가능 길이 8~15
			//var reg= /^[A-Za-z]{1}[A-Za-z_0-9]{5,14}$/
			var reg= /^[A-Za-z]{1}\w{4,14}$/
			
			if($("#pw").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			var tel = $("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val();
			var reg= /^(010|02|031|041|051)-[0-9]{3,4}-[0-9]{4}$/;
			if(!reg.test(tel)){
				alert("전화번호를 잘못입력하였습니다.");
				return false;
			}
			/*
			var reg= /^\w{6,15}[@][a-zA-Z]{2,9}[.][a-zA-Z]{2,5}([.][a-zA-Z]{2,5})?$/
			console.log($("#email").val())
			if(!reg.test($("#email").val())){
				alert("이메일을 확인 해주세요");
				return false;
			}
			*/
			var hobbyCount=0;
			$("input[name=hobbys]").each(function(){
				if(this.checked==true) hobbyCount++;
			});
			
			if(hobbyCount<2){
				alert("취미를 2개이상 선택해주세요.");
				return false;
			}
			$("#joineditform").attr("action","joinEditOk");
			return true;
			
		});
	});
	
	
</script>
<div class="container">
	<h1>정보수정</h1>
	<form method = "post" id="joineditform">
		<ul>
			<li>아이디id</li>
			<li>
				<input type="text" name="id" id="id" value="${dto.id }" readonly/>
			</li>
			<li>비밀번호를 입력해주세요</li>
			<li><input type="password" name="pw" id="pw" minlength="4" maxlenth="15"/></li>
			<li>성명</li>
			<li><input type="text" name="name" id="name" value="${dto.name }"readonly/></li>
			<li>전화번호</li>
			<li>
			<select name="tel1" id="tel1">
				<option value="010" <c:if test="{dto.tel1=='010'}">selected</c:if>>010</option>
				<option value="02" <c:if test="{dto.tel1=='02'}">selected</c:if>>02</option>
				<option value="031" <c:if test="{dto.tel1=='031'}">selected</c:if>>031</option>
				<option value="041" <c:if test="{dto.tel1=='041'}">selected</c:if>>041</option>
				<option value="051" <c:if test="{dto.tel1=='051'}">selected</c:if>>051</option>
			</select>
			-<input type="text" name="tel2" id="tel2" Maxlength="4" minlength="3" value="${dto.tel2 }"/>-
			<input type="text" name="tel3" id="tel3" Maxlength="4" minlength="4" value="${dto.tel3 }"/>
			</li>
			<li>email</li>
			<li><input type="text" name="email" id="email" value="${dto.email }"/></li>
			<li>주소</li>
			<li>
				<input type="text" name="zipcode" id="zipcode" value="${dto.zipcode }"/>
				<input type="button" id="zipsearch" value="우편번호찾기" />
			</li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr" readonly value="${dto.addr }"/></li>
			<li>상세주소 </li>
			<li><input type="text" name="address" id="address" value="${dto.address}"/></li>
			<li>취미</li>
			<li>
				<input type="checkbox" name="hobbys" class="hobby" value="검도" <c:forEach var="hob" items="${dto.hobbys}"><c:if test="hob=='검도'">checked</c:if></c:forEach>/>검도
				<input type="checkbox" name="hobbys" class="hobby" value="등산" <c:forEach var="hob" items="${dto.hobbys}"><c:if test="hob=='등산'">checked</c:if></c:forEach>/>등산
				<input type="checkbox" name="hobbys" class="hobby" value="사이클" <c:forEach var="hob" items="${dto.hobbys}"><c:if test="hob=='사이클'">checked</c:if></c:forEach>/>사이클
				<input type="checkbox" name="hobbys" class="hobby" value="IT" <c:forEach var="hob" items="${dto.hobbys}"><c:if test="hob=='IT'">checked</c:if></c:forEach>/>IT
				<input type="checkbox" name="hobbys" class="hobby" value="웨이트" <c:forEach var="hob" items="${dto.hobbys}"><c:if test="hob=='웨이트'">checked</c:if></c:forEach>/>웨이트
			</li>
			<li><input type="submit" value="수정"/>
		</ul>	
	</form>
</div>
<script>


</script>