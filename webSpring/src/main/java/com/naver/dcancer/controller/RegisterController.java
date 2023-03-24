package com.naver.dcancer.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.RegisterDTO;
import com.naver.dcancer.dto.ZipcodeDTO;
import com.naver.dcancer.service.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	RegisterService service;
	@Autowired
	JavaMailSenderImpl mailSender;
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
	@RequestMapping(value="joinOk",method=RequestMethod.POST)
	public ModelAndView joinOk(RegisterDTO dto) {
		int result = service.registInsert(dto);
		ModelAndView mav = new ModelAndView();
		if(result==1) {// 가입 성공 로그인폼 이동
			mav.setViewName("redirect:loginForm");
		}else { //가입실패 
			mav.addObject("msg","회원등록을 실패하였습니다.");
			mav.setViewName("register/joinOkResult");
		}
		return mav;
	}
	@GetMapping("joinedit")
	public ModelAndView joinEdit(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		RegisterDTO dto=service.registEdit((String)session.getAttribute("logId"));
		mav.addObject("dto",dto);
		mav.setViewName("register/joinedit");
		return mav;
	}
	@PostMapping("/joinEditOk")
	public ModelAndView joinEditOk(RegisterDTO dto,HttpSession session) {
		dto.setId((String)session.getAttribute("logId"));
		System.out.println(dto.getId());
		int result=service.registEditOk(dto);
		System.out.println("joinEditOk:result :"+result);
		ModelAndView mav= new ModelAndView();
		
		if(result>0) {
			mav.setViewName("redirect:joinedit");
		}else {
			mav.addObject("msg", "정보수정에 실패하였습니다.");
			mav.setViewName("/register/joinOkResult");
			
		}
		return mav;
	}
	//이메일 발송
	@GetMapping("/findId")
	public String findId() {
		return "/register/findId";
	}
	@PostMapping("/chkId")
	@ResponseBody
	public String chkId(RegisterDTO dto) {
		String id = service.findId(dto.getName(),dto.getEmail());
		
			//spring framework 설정
			String emailTitle="아이디찾기 결과";
			String emailContent= "<div style='bacground:lightblue; margin:50px;"
					+ "padding:50px; border:2px solid grey; font-size 2em; text-align:center'>";
			emailContent+= "검색한 아이디는 "+id+"입니다.</div>";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				 
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setTo("");
				messageHelper.setFrom("");
				messageHelper.setSubject(emailTitle);
				messageHelper.setText("text/html;charset=UTF-8",emailContent);
				mailSender.send(message);
				return "Y";
			} catch(Exception e) {
				e.printStackTrace();
				return "N";
			}
	} 
}
