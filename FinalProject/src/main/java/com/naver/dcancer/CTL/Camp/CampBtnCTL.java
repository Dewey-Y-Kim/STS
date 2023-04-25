package com.naver.dcancer.CTL.Camp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Camp")
public class CampBtnCTL {
	@GetMapping("Optometry")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Camp/Optometry");
		return mav;
	}
}
