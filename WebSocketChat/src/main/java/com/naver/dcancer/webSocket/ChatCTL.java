package com.naver.dcancer.webSocket;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatCTL {
	
	@GetMapping("chatFrm")
	public String chatfrm() {
		return "webChat/chatUI";
	}
	
	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public OutputMSGVO send(MsgVO vo) {
		System.out.println(vo.toString());
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		return new OutputMSGVO(vo.getFrom(),vo.getTo(),vo.getText(),time);
	}
}
