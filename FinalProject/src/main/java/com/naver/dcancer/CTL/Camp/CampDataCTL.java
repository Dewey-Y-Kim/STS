package com.naver.dcancer.CTL.Camp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class CampDataCTL{
	@Autowired
	CampService service;
	
	@GetMapping("CampSell")
	public ModelAndView CampSell(){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
