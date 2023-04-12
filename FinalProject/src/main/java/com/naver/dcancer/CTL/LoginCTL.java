package com.naver.dcancer.CTL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class LoginCTL {
	
	@GetMapping("Loginfrm")
	public ModelAndView Login() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
