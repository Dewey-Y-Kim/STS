package com.naver.dcancer.CTL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("HQ")
public class HQBtnCTL {
	@GetMapping("noticelist")
	public ModelAndView noticelist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Content/HQ/noticelist");
		return mav;
	}
	
}
