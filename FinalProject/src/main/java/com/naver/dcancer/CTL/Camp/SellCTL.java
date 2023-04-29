package com.naver.dcancer.CTL.Camp;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class SellCTL {
	@Autowired
	CampService service;
	@GetMapping("Selldata")
	public ModelAndView sellInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Camp/SellData");
		//로그인한 매장의 코드 구하기
		String code=(String)session.getAttribute("code");
		
		//localdate 사용
		LocalDate now = LocalDate.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // 포맷 적용
		
        String formatedNow = now.format(formatter);
		List<SellDTO> selledlist = service.selledList(code, now.toString());
		List<SellDTO> selledData = service.selledData(code, now.toString());
		System.out.println(code+"   "+now.toString());
		System.out.println("[sellInfo] list:"+selledlist);
		System.out.println("[sellInfo] data:"+selledData);
		mav.addObject("selledList",selledlist);
		mav.addObject("selledData",selledData);
		
		return mav;
	}
}
