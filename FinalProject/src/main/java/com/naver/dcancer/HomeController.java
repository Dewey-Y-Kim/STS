package com.naver.dcancer;

import java.security.Provider.Service;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.LoginDTO;
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
