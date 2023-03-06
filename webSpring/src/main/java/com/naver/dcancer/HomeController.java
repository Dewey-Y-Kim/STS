package com.naver.dcancer;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller//annotation  Controller RestController
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		//매개변수에 변수 선언, 모델에 필요한 데이터를 세팅하면 뷰페이지에서 사용 가능
		model.addAttribute("num", 1234);
		model.addAttribute("name", "Jine");
		return "home";
	}
	///campus/test?name=홍
	@RequestMapping("/test") 
	public ModelAndView test(HttpServletRequest request) {
		String name = request.getParameter("name");
		System.out.println("test(이름)"+name);
		ModelAndView mav= new ModelAndView(); //Data & View  정보를 가질수 있는 클래스.
		mav.addObject("num", 1241);
		mav.addObject("name", name);
		// View Setting
		mav.setViewName("home");
		return mav;
	}
	@RequestMapping("/test2")
	public ModelAndView test2(String addr) {
		System.out.println("test2 :"+addr);
		// test2 처리후 test3맵핑주소로 이동
		ModelAndView mav=new ModelAndView();
		mav.addObject("num", 99124);
		mav.addObject("name","쟝");
		// 다른 컨트롤러 매핑주소 기술
		
		mav.setViewName("redirect:test3");
		return mav;
	}
	// /campus/test3?num=1234412&name=졸려용
	//dto의 변수가 정수형이면 문자열을 request 정수형 형변환해준다.
	@RequestMapping("/test3")
	public String test3(testDTO dto, Model model) {
		dto.getName();
		
		System.out.println(dto.getNum()+1000);
		System.out.println(dto.toString());
		
		model.addAttribute("num", 666);
		model.addAttribute("name", "정미");
		return "home";
	}
	@GetMapping("/test4")
	public String test4(String tel) {
		System.out.println("test4 :"+tel);
		return "home";
		
	}
}
