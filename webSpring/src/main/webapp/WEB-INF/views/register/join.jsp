<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style> 
	#joinform ul{
		overflow : auto;
		width : 80%;
	}
	
	#joinform li{
		float : left;
		width : 20%;
		padding : 10px 0;
		border-bottom: 1px solid gray;
		line-height:40px;
	}
	
	#joinform li:nth-child(2n){
		width: 80%;
	}
	#joinform li:last-child{
		width: 100%;
	}
	#addr{
		width : 80%;
	}

</style>
<script>
	
	$(function(){
		$("input[value=중복검사]").click(function(){
			if($("#id").val()!=""){
			//url,title,option	
			window.open("idCheck?id="+$("#id").val(),"Chk","width=400,height=300");
			} else{
				alert("아이디를 입력해주세요.");
			}
		});
		$("#id").keyup(function(){ 
			//아이디 입력란에 키보드입력 = 중복검사 초기화
			$("#idstatus").val("n");
		}); 
		$("#zipsearch").on('click',function(){
			window.open("zipcodeSearch","zipcode","width=500, height=600")
		});
		$("#joinform").submit(function(){
			//id 첫글자 영어 대소문자 영어대소문자,숫자,_가능 길이 8~15
			//var reg= /^[A-Za-z]{1}[A-Za-z_0-9]{5,14}$/
			var reg= /^[A-Za-z]{1}\w{4,14}$/
			if($("#id").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			
			if($("#idstatus").val()=="n"){
				alert("아이디 중복검사를 해주세요.");
				return false;
			}
			if(!reg.test($("#id").val())){ //유효값 true 무효 false
				 alert("아이디는 첫번째문자는 영어 대소문자로 시작해야하며, \n영어대소문자,숫자,_가능, 아이디길이는 5~15자까지가능합니다.");
				return false;
			}
			if($("#pw").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			if($("#pw").val()!=$("#pw2").val()){
				alert("비밀번호를 확인해주세요");
				return false;
			}
			var reg= /^[가-힣]{2,10}$/	
			if(!reg.test($("#name").val())){
				alert("이름은 2~10글자까지 한글만 가능합니다.");
				return false;
			}
				
		});
	});
	
	
</script>
<div class="container">
	<form method = "post" id="joinform">
		<ul>
			<li>아이디id</li>
			<li>
				<input type="text" name="id" id="id" minlength="5" maxlength="20"/>
				<input type="button" value="중복검사"/>
				<input type="hidden" id="idstatus" value="n"/>
			</li>
			<li>pw</li>
			<li><input type="password" name="pw" id="pw" minlength="4" maxlenth="15"/></li>
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
			<input type="text" name="tel3" id="tel3" Maxlength="4" minlength="4"/>
			</li>
			<li>email</li>
			<li><input type="text" name="email" id="email"/></li>
			<li>post</li>
			<li>
				<input type="text" name="zipcode" id="zipcode"/>
				<input type="button" id="zipsearch" value="우편번호찾기" />
			</li>
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
			</li>
			<li><input type="submit" value="가입하기"/>
		</ul>	
	</form>
</div>
<script>


</script>