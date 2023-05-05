package com.naver.dcancer.CTL.Camp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.brokenDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class brokenItemCTL {
	@Autowired
	CampService service;
	
	@GetMapping("brokenlens")
	public ModelAndView borkenLens() {
		ModelAndView mav = new ModelAndView();
		List<brokenDTO> list = new ArrayList<brokenDTO>();
		list = service.brokenList();
		mav.addObject("list",list);
		mav.setViewName("Camp/broken");
		return mav;
	}
	
	@PostMapping("brokenSearch")
	public List<brokenDTO> brokenFind(String searchWord){
		List<brokenDTO> list = service.brokenFind(searchWord);
		System.out.println(list);
		
		return list;
	}
	
	@PostMapping("brokenInsert")
	public brokenDTO brokenInsert(brokenDTO dto) {
		System.out.println(dto.toString());
		int result=service.brokenInsert(dto);
		System.out.println(result);
		System.out.println(dto.toString());
		return dto;
	}
	
}
