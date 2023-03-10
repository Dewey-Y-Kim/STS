package com.naver.dcancer.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.DataDTO;
import com.naver.dcancer.service.DataService;

@Controller
public class DataController {
	@Inject
	DataService service;
	@RequestMapping("/data/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		List<DataDTO> list= service.datalist();
		mav.addObject("list",list);
		mav.setViewName("data/list");
		return mav;
	}
}
