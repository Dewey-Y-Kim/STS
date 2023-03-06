package com.naver.dcancer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.RegisterDTO;
import com.naver.dcancer.dto.ZipcodeDTO;
import com.naver.dcancer.service.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	RegisterService service;
	
	@GetMapping("/loginForm")
	public String login() {
		return "register/loginForm"; // /WEB-INF/views/register/loginForm.jsp
	}
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String usrid,String usrpwd,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		RegisterDTO dto = service.loginOk(usrid,usrpwd);
		// dto ==null : 레코드 X -> 로그인 실패 : 레코드 O 로그인 성공;
		// 매개변수 HttpServletRequest request ->session
		// 매개변수로 HttpSession session
		System.out.println("usrId"+usrid);
		if(dto!=null ) {
			session.setAttribute("logId", dto.getId());
			session.setAttribute("logName", dto.getName());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("redirect:loginForm");
			
		}
		return mav;
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}
	@GetMapping("join")
	public String join() {
		return "register/join";
	}
	@GetMapping("idCheck")
	public String idChk(String id, Model model) {
		// ModelAndView mav = new ModelAndView();
		// mav.setViewName("redirect:idChk");
		int cnt=service.idChkCount(id);
		model.addAttribute("id", id);
		model.addAttribute("result", cnt);
		return "register/idChk";
	}
	@RequestMapping(value="/zipcodeSearch", method=RequestMethod.GET)
	public ModelAndView zipcodesearch(String doroname) {
		ModelAndView mav=new ModelAndView();
		List<ZipcodeDTO> zipList= null;
		if(doroname!=null) {
			zipList=service.zipSearch(doroname);
		}
		mav.addObject("zipList",zipList);
		mav.setViewName("register/zipcodeSearch");
		return mav;
	}

}
