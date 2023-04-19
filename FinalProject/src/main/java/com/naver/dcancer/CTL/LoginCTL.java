package com.naver.dcancer.CTL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.Service.LoginService;

@Controller
public class LoginCTL {
	@Autowired
	LoginService service;
	
	@PostMapping("LoginOk")
	public ModelAndView Login(int empno, String pwd,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		LoginDTO result = service.login(empno, pwd);
		System.out.println(result.toString());
		if(result!=null) {
			mav.setViewName("LoginResult");
			session.setAttribute("empno", empno);
			session.setAttribute("campName", result.getCampName());
			session.setAttribute("ename",result.getEname());
			session.setAttribute("code", result.getCode());
			session.setAttribute("auth", result.getAuth());
			session.setAttribute("LoginStatus", 'Y');
			System.out.println(result.toString());
			switch((Integer)session.getAttribute("auth")) {
			case 2 : session.setAttribute("codeData", "Camp");mav.addObject("codeData","Camp");break;
			case 3: case 4: session.setAttribute("codeData", "HQ");mav.addObject("codeData","HQ");break;
			}
			System.out.println(session.getAttribute("empno"));
			
		}
		return mav;
	}
	@GetMapping("/{path}/main")
	public ModelAndView Frm(@PathVariable("path")String path,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("codeData",session.getAttribute("codeData"));
		mav.setViewName(path+"/main");
		return mav;
	}
}