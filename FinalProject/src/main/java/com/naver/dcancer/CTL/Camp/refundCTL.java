package com.naver.dcancer.CTL.Camp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.refundDTO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class refundCTL {
	@Autowired
	CampService service;
	
	@GetMapping("refund")
	public ModelAndView borkenLens() {
		ModelAndView mav = new ModelAndView();
		List<refundDTO> list = new ArrayList<refundDTO>();
		list = service.refundList();
		mav.addObject("refundlist",list);
		mav.setViewName("Camp/refund");
		System.out.println(list);
		return mav;
	}
	
	@PostMapping("refundSearch")
	public List<refundDTO> refundFind(String searchWord){
		List<refundDTO> list = service.refundFind(searchWord);
		System.out.println(list);
		
		return list;
	}
	
	@PostMapping("refundInsert")
	public refundDTO refundInsert(refundDTO dto) {
		System.out.println(dto.toString());
		int result=service.refundInsert(dto);
		System.out.println(result);
		System.out.println(dto.toString());
		return dto;
	}
	
}
