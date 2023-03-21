package com.naver.dcancer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.AnswerDTO;
import com.naver.dcancer.service.AnsService;

@RestController
@RequestMapping("/answer")
public class answerCotroller {
	@Autowired
	AnsService service;
	@GetMapping("/list")
	public ModelAndView ansList() {
		ModelAndView mav = new ModelAndView();
		//레코드 선택
		List<AnswerDTO> list = service.answerList();
		mav.addObject("list",list);
		//총 레코드 수
		int totalRec=service.totalRec();
		mav.addObject("totalRec", totalRec);
		mav.setViewName("answer/list");
		return mav;
	}
	@GetMapping("/write")
	public ModelAndView ansWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("answer/write");
		return mav;
	}
	@PostMapping("/writeOk")
	public ResponseEntity<String> ansWriteOk(AnswerDTO dto,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)session.getAttribute("logId"));
		dto.setIp(request.getRemoteAddr());
		ResponseEntity<String> entity=null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		try {
		service.answerInsert(dto);
		String body="<script>location.href='/dcancer/answer/list';</script>";
		entity = new ResponseEntity<String>(body,headers,HttpStatus.OK);
				
		}catch(Exception e) {
			e.printStackTrace();
			String body ="<Script>";
			body +="alert('글 등록 실패하였습니다.');";
			body +="history.back;";
			body +="</script>";
			entity= new ResponseEntity<String>(body,headers,HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	@GetMapping("View")
	public ModelAndView ansView(int no,AnswerDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("answer/view");
		dto=service.ansView(no);
		mav.addObject("dto", dto);
		return mav;
	}
}
