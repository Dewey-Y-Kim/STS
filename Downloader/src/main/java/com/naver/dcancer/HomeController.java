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
	
}
