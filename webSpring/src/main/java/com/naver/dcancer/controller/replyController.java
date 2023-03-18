package com.naver.dcancer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dcancer.dto.ReplyDTO;
import com.naver.dcancer.service.ReplyService;

@RestController
public class replyController {
	@Autowired
	ReplyService service;
	
	@PostMapping("replySend")
	public String replySend(ReplyDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("logId"));
		int result = service.replyInsert(dto);
		String report="fail";
		if(result>0) {
			report="success";
		}
		return report;
	}
	@GetMapping("replyList")
	public List<ReplyDTO> replyList(int no) {
		List list= service.replyListsel(no);
		return list;
	}
	@PostMapping("replyEdit")
	public String replyEdit(ReplyDTO dto, HttpSession session) {
		System.out.println("[dto.edit]"+dto.toString());
		dto.setId((String)session.getAttribute("logId"));
		int result = service.replyUpdate(dto);
		return String.valueOf(result);
	}
	@GetMapping("/replyDelete")
	public String replyDelete(int replyno, HttpSession session) {
		int result= service.replyDel(replyno, (String)session.getAttribute("logId"));
		System.out.println(result);
		return String.valueOf(result);
	}
}
