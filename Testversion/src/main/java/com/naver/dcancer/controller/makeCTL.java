package com.naver.dcancer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.ImgDTO;
import com.naver.dcancer.Service.ImgService;

@RestController
@RequestMapping("make")
public class makeCTL {
	ImgService service;
	@PostMapping("makeit")
	public ModelAndView fider(ImgDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.fileName(dto);
		mav.setViewName("redirect:/");
		return mav;
	}
}
