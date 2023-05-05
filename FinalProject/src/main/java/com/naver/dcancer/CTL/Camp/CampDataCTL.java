package com.naver.dcancer.CTL.Camp;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.naver.dcancer.DTO.soldDTO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class CampDataCTL{
	@Autowired
	CampService service;
	
	@GetMapping("CampSell")
	public ModelAndView CampSell(){
		ModelAndView mav = new ModelAndView();
		LocalDate now= LocalDate.now();
		DateTimeFormatter form = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date=now.format(form);
		List<soldDTO> list = service.soldDay(date);
		JsonArray jsonArr = new JsonArray();
		JsonObject camp = new JsonObject();
		JsonObject sum = new JsonObject();
		JsonObject sellno = new JsonObject();
		JsonObject avg = new JsonObject();
		for (soldDTO dto:list) {
			JsonObject json = new JsonObject();
			json.addProperty("camp", dto.getCampname());
			json.addProperty("sum", dto.getSum());
			json.addProperty("sellNo", dto.getSellNo());
			json.addProperty("avg", dto.getAvg());
			json.addProperty("sumStr", dto.getSumStr());
			json.addProperty("avgStr", dto.getAvgStr());
			jsonArr.add(json);
		}
		mav.addObject("date",date);
		mav.addObject("list",list);
		mav.addObject("json",jsonArr.toString());
		mav.setViewName("Camp/campSell");
		return mav;
	}
	@PostMapping(value="callsold", produces = "application/text;charset=UTF-8")
	public String callsold(String startDate, String endDate ){
		
		List<soldDTO> list;
		String result="";
		if( startDate !=null && startDate.equals("")) {
			list=service.soldDay(endDate);
		}else {
			list=service.soldBetween(startDate,endDate);
		}
		
		System.out.println("list:"+list);
		JsonArray jsonArr = new JsonArray();
		JsonObject camp = new JsonObject();
		JsonObject sum = new JsonObject();
		JsonObject sellno = new JsonObject();
		JsonObject avg = new JsonObject();
		for (soldDTO dto:list) {
			JsonObject json = new JsonObject();
			json.addProperty("camp", dto.getCampname());
			json.addProperty("sum", dto.getSum());
			json.addProperty("sellNo", dto.getSellNo());
			json.addProperty("avg", dto.getAvg());
			json.addProperty("sumStr", dto.getAvgStr());
			jsonArr.add(json);
		}
		result =jsonArr.toString();
		System.out.println(result);
		return result;
	}
}
