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
		System.out.println(result.getEname());
		if(result!=null) {
			mav.setViewName("Frame/LoginResult");
			session.setAttribute("campName", result.getCampName());
			session.setAttribute("code", result.getCode());
			session.setAttribute("auth", result.getAuth());
			session.setAttribute("ename", result.getEname());
			session.setAttribute("LoginStatus", 'Y');
		}
		return mav;
	}
	@GetMapping("Frm")
	public ModelAndView Frm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("ChkPoint");
		int auth = (Integer)session.getAttribute("auth");
		System.out.println("[frm]auth:"+auth);
		switch(auth) {
			case 2 : mav.addObject("codeData","Camp");break;
			case 3: case 4: mav.addObject("codeData","HQ");break;
		}
		
		mav.setViewName("Frame/MainFrame");
		return mav;
	}
	@GetMapping("/{path}/main")
	public ModelAndView FrmStart(@PathVariable("path") String path) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Content/"+path+"/main");
		return mav;
	}
}
