<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script> <!-- socktJS https://cdnjs.com/libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> <!-- stormJS https://cdnjs.com/libraries-->
<script>
	//
	var socket; //socket 객체
	var stompClient =null; //stomp 서버와 클라이언트간 대화객체
	var nickname;
	$(function(){
		// 과거 연결되었던 내용 초기화
		disableChat();
		chatStatusDisconnect()
		//chat server connect
		$('#btnConnect').click(function(){
			if($('#nickname').val()==""){
				alert("insert your nickname");
				return false;
			}
			connect();
		});
		$('#inputMsg').keypress(function(){
			if(event.keyCode==13){
				let msg= $("#inputMsg").val();
				let str = {
						from: nickname,
						to : 'all',
						text : msg
				}
				var jsonStr= JSON.stringify(str)
				stompClient.send('/app/chat',{}, jsonStr);
				var now = new Date();
				var time = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate() + " "+ now.getHours()+":"+now.getMinutes()+":"+ now.getSeconds();
				//내 채팅창 내용표시
				let meTag='<p Style="color:blue"><span class="badge bg-danger">'+str.from+'</span><br/>';
				meTag += msg+"<br/>";
				meTag += time+"<br/></p>"
				addToMessage('me',meTag);
				$("#inputMsg").val("");
			}
		});
		$('#btnDisconnect').click(function(){
			//퇴장알림
			let str ={
					from:nickname,
					to : 'all',
					text : nickname+'님이 퇴장하였습니다.'
			}
			var jsonStr = JSON.stringify(str);
			stompClient.send('/app/chat',{}, jsonStr);
			nickname = null;
			if(stompClient != null){
				stompClient.disconnect();
				stompClient = null;
				socket=null;
				disableChat();
				chatStatusDisconnect();
			}
		});
	});
	
	// messageInput taMsg 초기화
	function disableChat(){
		$('#inputMsg').val("");
		$('#taMsg').html("")
		$('#inputMsg').prop("readonly",true);
		$('#MsgArea').css("display","none");
		$('#taMsg').css("display","none");
	}
	function enableChat(){
		$('#inputMsg')
	}
	// 연결상태로 변환
	function chatStatusConnect(){
		$('#chatStatus>strong').html("채팅에 연결되었습니다.");
		$('#chatStatus>strong').css('color','blue');
	}
	// 비연결상태로 전환
	function chatStatusDisconnect(){
		$('#chatStatus>strong').html("채팅 연결후 사용해주세요.");
		$('#chatStatus>strong').css('color','red');
	}
	// server Connect with socktJs
	function connect(){
		
		socket = new SockJS('${pageContext.request.contextPath}/chat');
		// == request.getContextPath()
		stompClient = Stomp.over(socket);
		stompClient.connect({},function(Frm){
			console.log(Frm);
			console.log('StompClient : connected');
			// 연결시 채팅서버연결버튼 비활성화, 대화표시 비활성화
			setConnected();
			//-----listener ----
			//접속알림
			let str = {
					from:nickname,
					to:'all',
					text:nickname+'님이 접속하였습니다.'
			};
			//메세지 전송
			let jsonStr = JSON.stringify(str);
			stompClient.send('/app/chat',{}, jsonStr);
			// 서버에서 데이터 받을 메소드
			stompClient.subscribe('/topic/messages', function(msg){
				console.log(msg);
				let jsonData=JSON.parse(msg.body);
				showChatMessage(jsonData);
			});
			//-----listener ----
			
		});
	}
	//받은 메세지 출력
	function showChatMessage(data){
		if(nickname != data.from){
			let textTag='<p Style="color:blue"><span class="badge bg-success">'+data.from+'</span><br/>';
			textTag += data.text+"<br/>";
			textTag += data.time+"</p>"
			addToMessage('other',textTag);
		}
	}
	function addToMessage(who,msg){
		var divTag = "<div><div style='float:right'>";
		if(who == 'me'){
			divTag = "<div><div style='float:left'>";
		}
		divTag += msg+"</div></div>";
		console.log('divTag : '+msg);
		$('#taMsg').append(divTag);
		
	}
	
	function setConnected(){
		$('#btnConnect').prop("disabled",true);
		$('#inputMsg').prop("readonly",false);
		$('#MsgArea').css("display","block");
		$('#taMsg').css("display","block");
		nickname=$('#nickname').val();
		chatStatusConnect();
		
	}
</script>
</head>
<body>
<div class="container">
	<div class="mt-4 p-5 bg-warning text-white rounded">
		<h1>chatting</h1>
		<form action="/action_page.php">
	    <!-- connect -->
	    <div class="form-floating mb-3 mt-3" style="color:#666">
	    	<input type="text" class="form-control" id="nickname" placeholder="nickname" name="nickname">
	    	<label for="nickname">nickname</label>
	    </div>
	    <button type="button" class="btn btn-success" id="btnConnect">채팅접속</button>
	    <button type="button" class="btn btn-secondary" id="btnDisconnect">채팅접속종료</button>
		</form>
		<!-- Status -->
	  	<div id="chatStatus" class="alert alert-success">
	  		<Strong style="color:red">채팅 연결후 사용해주세요</Strong>
	  	</div>
	  	<!-- message Input -->
	  	<div id="MsgArea" class="input-group mb-3" style="width:80%;margin:0 auto;">
			<input id="inputMsg" type="text" class="form-control" style="width:80%;float:left" placeholder="Message">
			<button id="sendMsg" class="btn btn-success">send</button>
		</div>
		<div id="taMsg" class="container" style="width:90%;border:1px blue solid;background:#fff;height:600px;">
		</div>
	</div>
	
</div>
</body>