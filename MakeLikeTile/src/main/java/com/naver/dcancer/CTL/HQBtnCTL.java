package com.naver.dcancer.CTL;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.noticeDTO;
import com.naver.dcancer.Service.HQService;

@Controller
@RequestMapping("HQ")
public class HQBtnCTL {
	@Autowired
	HQService service;
	@GetMapping("noticelist")
	public ModelAndView noticelist() {
		ModelAndView mav = new ModelAndView();
		List<noticeDTO> list = new ArrayList<noticeDTO>();
		list=service.noticeList();
		mav.setViewName("Content/HQ/noticelist");
		return mav;
	}
	@GetMapping("noticeView/{no}")
	public ModelAndView noticeView(@PathVariable("no") int no) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("Content/HQ/noticeView");
		noticeDTO dto=service.noticeView(no);
		mav.addObject("dto", dto);
		return mav;
	}
	
}
