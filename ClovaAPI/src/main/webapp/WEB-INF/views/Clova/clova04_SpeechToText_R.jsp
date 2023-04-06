<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clova04_Speech To Text Version Record </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>

	function mediaStart(){
		var record = document.getElementById("record");
		var stop = document.getElementById("stop");
		var resultView = document.getElementById("resultView");
		console.log(navigator.mediaDevices);
		if(navigator.mediaDevices){
			console.log("있음");	
			const contraints = {audio:true};
			let chunks = []; // 녹음된 내용을 저장할 변수
			navigator.mediaDevices.getUserMedia(contraints).then(stream=>{
				const mediaRecorder = new MediaRecorder(stream);	
				//녹음시작
				record.onclick = ()=>{
					chunks = []; // 초기화
					mediaRecorder.start(); //녹음 시작
					record.style.background ="red"; //비활성화
					record.style.color = "#fff";
					record.disabled = true;
				}
				//녹음 저장 함수
				mediaRecorder.ondataavailable = e=>{
					chunks.push(e.data);
				}
				//녹음종료
				stop.onclick = ()=>{
					mediaRecorder.stop();
					//button 활성화
					record.style.backgroundColor="";
					record.style.color="";
					record.disabled = false;
				}
				
				//서버로 녹음 내용 전송 및 결과받기
				mediaRecorder.onstop = ()=>{
					//chunks 음성데이터를 바이너리코드로 변환
					
					const blob = new Blob(chunks,{'type':'audio/ogg codecs=opus'});
					let formdata = new FormData();
					
					formdata.append("audioFile",blob);//== <input type="file" name="audioFile"/>
					// 비동기식으로 ajax 실행
					
					let xhr = new XMLHttpRequest();
					//1. 서버에서 결과를 받으면 처리할 이벤트
					xhr.onload = ()=>{
						if(xhr.status==200){ 
							//정상전송 : code : 200
							//xhr.response : 받은 결과값이 들어있는 변수
							console.log(123);
							let jsonData = JSON.parse(xhr.response);
							resultView.innerHTML = resultView.innerHTML +"<div>"+jsonData.text+"</div>";
						}
					}
					//2. 서버열기
					xhr.open("Post","csr_stt_record_Ok",true);
					//3. 서버전송하기
					xhr.send(formdata);
					
				}// onstop()
			}//stream
			).catch(err=>{
				console.log("Err");	
			})
		}else{
			console.log("없음");
		}
	}
</script>
</head>

<body onload="mediaStart()">
<h1> CSR - STT Record</h1>
<div class="body">
	<input type="button" id="record" value="녹음시작"/>
	<input type="button" id="stop" value="녹음정지"/>
</div>
<hr/>
<div id="resultView"></div>
</body>