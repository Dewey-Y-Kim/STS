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

import com.naver.dcancer.DTO.LogDTO;
import com.naver.dcancer.Service.LoginService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {
	@Autowired
	LoginService service;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@PostMapping("logresult")
	public ModelAndView Login(String empno, String pwd,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		LogDTO result = service.Login(empno, pwd);
		session.setAttribute("LogId", result.getCampName());
		mav.addObject("result",result);
		if(result.getAuth()==4||result.getAuth()==3) {
			//본사
			mav.setViewName("");
		}else if(result.getAuth()==1){
			mav.setViewName("");
		}
		return mav;
	}
	
}
