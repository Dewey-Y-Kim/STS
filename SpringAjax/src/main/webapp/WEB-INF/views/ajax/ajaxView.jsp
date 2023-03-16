<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax in Spring</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	#resultLine {
		border: 10px solid lightblue;
		width: 90%;
	}
</style>
<script>
	$(function(){
		//비동기식 문자열 받아오기
		$("#ajaxString").click(function(){
			var address = "ajaxString";
			var params = "num=1234&name=울트라맨2022";
			$.ajax({
				url : address,
				data : params,
				type : "GET",
				success:function(result){
					console.log(result);
					$("#resultLine").append("<div>"+result+"</div>")
				},error:function(e){
					console.log(e.responceText);
				}
			});
		});
		
		$("#ajaxObject").click(function(){
			var url = "ajaxObject";
			var params ={
				no:18,
				title:'테스팅',
				content:'되네;;;'
			};
			$.ajax({
				url: url,
				data : params,
				dataType : 'json',
				type : 'Get',
				success:function(Result){
					console.log(Result);
					var tag = "<ul>";
					tag += "<li> 번호 : "+Result.no+"</li>";
					tag += "<li> 제목 : "+Result.title+"</li>";
					tag += "<li> 내용 : "+Result.content+"</li>";
					tag += "<li> 이름 : "+Result.name+"</li>";
					tag += "</ul>"
					$("#resultLine").append(tag);
				}, error:function(e){
					console.log(e.responseText);
				}
			});
		});
		$("#ajaxList").on('click',function(){
			
			$.ajax({
				url:'ajaxList',
				data:{
					no : 4321,
					name:'잠탱군'
				},
				type:'POST',
				success:function(result){
					console.log(result);
					var tag="<ol>";
					$(result).each(function(i,data){
						tag += "<li>("+i+")no : "+data.no;
						tag += ", title : "+data.title;
						tag += ", content : "+data.content;
						tag += ", name : "+data.name;
					});
					tag+="</ol>";
					$("#resultLine").append(tag);
				}, error(e){
					console.log(e.responseText);
				}
			
			});
		});
		$("#ajaxMap").click(function(){
			
			$.ajax({
				url : "ajaxMap",
				data: "num=1312&name=듀렌달&tel=291-123",
				success:function(result){
					console.log(result);
					var tag="<ul>";
					tag+="<li>comment"+result.comment+"</li>";
					tag+="<li>totalNum"+result.totalnum+"</li>";
					
					//DTO
					tag+="<li>DTO</li><li>no"+result.dto.no+", title"+result.dto.title+", content"+result.dto.content+",  name"+result.dto.name+"</li>";
					$(result.list).each(function(idx, data){
						tag+="<li>"+data.no+"</li><li>"+data.name+"  //  "+data.title+"</li><li>"+data.content+"</li>";
					});
					tag+="<hr>";
					$(result.list2).each(function(idx, data){
						tag+="<li>"+data.no+"</li><li>"+data.name+"  //  "+data.title+"</li><li>"+data.content+"</li>";
					});
					tag+="</ul>";
					$("#resultLine").append(tag);
				}, error: function(e){
					console.log(e.responseText);
				}
			});
		});
		$("#ajaxJson").click(function(){
			$.ajax({
				url : 'ajaxJson',
				success:function(result){
					console.log(result);
					var jsonData=JSON.parse(result);
					console.log(jsonData);
					
					var tag="<ul>";
					tag +="<li>부정 : "+jsonData.Denial+"</li>";
					tag +="<li>분노 : "+jsonData.Anger+"</li>";
					tag +="<li>협상 : "+jsonData.Bargaining+"</li>";
					tag +="<li>우울 : "+jsonData.Depression+"</li>";
					tag +="<li>수용 : "+jsonData.Acceptance+"</li>";
					tag +="</ul>";
					$("#resultLine").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
		$("#ajaxRestObject").click(function(){
			$.ajax({
				url : 'ajaxRestObject',
				data : {
					name:"만성피로",
					age:"40"
				},
				success:function(result){
					console.log(result);
					var tag="<ul>";
					tag +="<li>번호:"+result.no+"</li>";
					tag +="<li>이름 : "+result.name+"</li>";
					tag +="<li>주제 : "+result.title+"</li>";
					tag +="<li>내용 : "+result.content+"</li>";
					tag +="</ul>";
					$("#resultLine").append(tag);
				},error:function(e){
					console.log(e.responseText);
				}
			});
		});
		$("#ajaxRestList").click(function(){
			$.ajax({
				url : "ajaxRestList",
				type: "Post",
				data: "num=1312&name=샤오미&tel=291-123",
				success:function(result){
					console.log(result);
					var tag="<ul>";
					$(result.list).each(function(idx, data){
						tag+="<li>"+data.no+"</li><li>"+data.name+"  //  "+data.title+"</li><li>"+data.content+"</li>";
					});
					tag+="</ul>";
					$("#resultLine").append(tag);
				}, error: function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
</head>
<body>
<h4> 비동기식컨트롤러 접속 정보 리턴</h4>
<input type="button" id="ajaxString" value="aJax 문자열"/>
<input type="button" id="ajaxObject" value="aJax Object"/>
<input type="button" id="ajaxList" value="aJax List"/>
<input type="button" id="ajaxMap" value="aJax Map"/>
<input type="button" id="ajaxJson" value="aJax Json"/>
<div id="resultLine">
	
</div>
</body>