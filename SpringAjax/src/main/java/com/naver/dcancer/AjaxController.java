package com.naver.dcancer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	@RequestMapping("/ajaxStart")
	public String ajaxStart() {
		return "ajax/ajaxView";
	}
	//return Type : Sting - 한글 인식 produces="application/text;charset=UTF-8"
	@RequestMapping(value="ajaxString", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody //return = content
	public String ajaxString(int num, String name) {
		System.out.println("Num : "+num);
		System.out.println("Name : "+name);
		
		return "num is "+num+", name is "+name;
	}
}
