package com.naver.dcancer.Modelling.CTL;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ModellingCTL {
	@GetMapping("/ModelIn")
	public ModelAndView getFile(File file) {
		ModelAndView mav= new ModelAndView();
		return mav;
	}
}
