package com.naver.dcancer.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
// Controller : veiw 언어 사용 불가-jsp생성 및 구현/ RestController : view 언어 사용 가능, 반환형 String = 컨텐츠
@RestController
public class Boardcontroller {
	@GetMapping("/board/list")
	public ModelAndView boardlist() {
		//db 조회
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/board/list");
		return mav;
	}
}
