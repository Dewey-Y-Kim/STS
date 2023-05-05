package com.naver.dcancer;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.Service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	LoginService service;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("home");
		return mav;
	}
	@GetMapping("logout")
	public ModelAndView logOut(HttpSession session) {
		session.invalidate();
		ModelAndView mav= new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
}
