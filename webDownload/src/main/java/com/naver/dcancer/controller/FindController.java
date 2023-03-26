package com.naver.dcancer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.CarImgDTO;
import com.naver.dcancer.service.ImgService;

@Controller
@RequestMapping("Img")
public class FindController {
	ImgService service;
	@PostMapping("finderImg")
	public ModelAndView Downloader(CarImgDTO dto) {
		// "https://www.hyundai.com/contents/vr360/NE02/exterior/M9U/001.png" //60
		//https://www.kia.com/content/dam/kwp/kr/ko/configurator/niro-ev/trim/exterior/air/swp/swp_11.png //72
		//https://www.renaultkoream.com/upload/asset/xm3/vr/color//GXA/071.png //72
		System.out.println(dto.toString());
		if(dto.getColor()!=null||dto.getColor()!="") {
		} else {
			dto.setColor("불명");
		}
		try {
			int slash = dto.getImgUrl().lastIndexOf("/");
			dto.setPath(dto.getImgUrl().substring(0, slash+1));
			dto.setFilename(dto.getImgUrl().substring(slash+1));
			System.out.println("model:"+dto.getModel());
			System.out.println(dto.getPath()+"\n"+dto.getFilename());
			int result = service.ImgFinder(dto);
			
		}catch(Exception e){
			System.out.println("올바른 주소가 아니네요");
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
