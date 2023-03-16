package com.naver.dcancer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dcancer.dto.ReplyDTO;
import com.naver.dcancer.service.ReplyService;

@RestController
public class replyController {
	@Autowired
	ReplyService service;
	@PostMapping("/replySend")
	public int replySend(ReplyDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setWriter((String)request.getSession().getAttribute("logId"));
		int result = service.replyInsert(dto);
		return result;
	}
}
