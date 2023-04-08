<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChatBot</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<Style>
	#content p{
		margin :5px;
		padding : 5px;
		border:1px solid lightblue;
		border-radius :5px;
	}
	#content {
		overflow : scroll;
	}
	.txt-right{
		text-align : right;
	}
</Style>
<script>
	$(function(){
		$("#submit").click(function(){
			event.preventDefault();
			if($("#queryin").val()==""){
				alert("질문을 입력하세요");
				return false;
			}
			$.ajax({
				type:'post',
				dataType:'text',
				data:{
					queryin:$("#queryin").val()
				},
				url: "chatBot",
				success:function(result){
					$("#JsonCode").val(result);
					var jsonData = JSON.parse(result);
					console.log(jsonData);
					var type= jsonData.bubbles[0].type;
					var que = "<p class='txt-right'>"+$("#queryin").val()+'</p>';
					$('#content').append(que);
					$('#queryin').val("");
					if(type == 'text'){
						var textQue = jsonData.bubbles[0].data.description;
						textQue = textQue.replaceAll("\n","<br/>");
						var textMsg = "<p>"+textQue+"</p>";
						// \n -> <br> 
						
						$('#content').append(textMsg);
					}else if(type == 'template'){
						var buttonInfo = jsonData.bubbles[0].data;
						console.log(buttonInfo);

						var tag = "<p>"+buttonInfo.cover.data.description+"<br/>";
						
						buttonInfo.contentTable.map(function(btn, idx){
							tag += "<input type='button' value='"+btn[0].data.title+"' onclick='location.href=\""+btn[0].data.data.action.data.url+"\"'/>";	
						});
						tag +='</p>';
						$("#content").append(tag);
					}else if(type == 'carousel'){
						var imgQue = jsonData.bubbles[0].data;
						console.log(imgQue);
						
						var imgView ='<div id="myCarousel" class="carousel slide" data-ride="carousel">';
						imgView += '<div class="carousel-inner">';
						
						imgQue.cards.map(function(card,idx){
							imgView += '<div class="item'; 
							if(idx==0){ imgView += ' active ' ;}
							imgView += '">';
							imgView += "<img src='"+card.data.cover.data.imageUrl+ "' style='width:100%'/>";
							console.log(card.data.cover.data.imageUrl);
							imgView += "<br/>"+card.data.cover.title+"<br/>"+card.data.cover.data.description;
							imgView += "</div>";
						});
						imgView += '</div>'
						imgView += '<a class="left carousel-control" href="#myCarousel" data-slide="prev">';
						imgView += '<span class="glyphicon glyphicon-chevron-left"></span>';
						imgView += '<span class="sr-only">Previous</span></a>';
						imgView += '<a class="right carousel-control" href="#myCarousel" data-slide="next">';
						imgView += '<span class="glyphicon glyphicon-chevron-right"></span>';
						imgView += '<span class="sr-only">Next</span>';
						imgView +='</a></div>';
						$("#content").append(imgView);
					}
					// 스크롤바 제일아래로.
					var div = document.getElementById("content");
					div.scrollTop = div.scrollHeight;
					
				},error:function(error){
					console.log(error.responseText)
				}
			})
		});
	});
</script>
</head>

<body>
<div class="container">
<h1>챗봇</h1>
<div id="content" style="width:100%; height:400px; border:1px solid lightblue;"></div>
<div>
<input type="text" name="queryin" id="queryin" style="width:70%"/>
<input id="submit" type="button" value="전송"/>
<hr/>
Json<textarea id="JsonCode" style="width:100%;height:100px;"></textarea>
</div>
</div>
</body>