package com.naver.dcancer.webSocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
// WebSocketMessageBrokerConfigurer : websocket 설정인터페이스
//websocketMessagec처리 활성화
@Configuration
@EnableWebSocketMessageBroker 
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		// client에게 메세지 전달
		config.enableSimpleBroker("/topic","queue");
		// client가 보낸 메세지 받음 prefix
		config.setApplicationDestinationPrefixes("/app");
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		/*
		 * socketJs가 연결할 주소 -> socketjs 이용 웹통신 할 수 있도록 설정
		 * ws://localhost:9090:chat
		 */
		registry.addEndpoint("/chat").withSockJS();
	}
}