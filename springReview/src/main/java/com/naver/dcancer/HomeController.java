package com.naver.dcancer;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping("/")
	public ModelAndView main(Locale lacale) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	//RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("TestServer now loaded");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		// model.addAttribute("serverTime", formattedDate );
		mav.addObject("serverTime", formattedDate);
		mav.setViewName("index");
		return mav;
	}
	*/
}
