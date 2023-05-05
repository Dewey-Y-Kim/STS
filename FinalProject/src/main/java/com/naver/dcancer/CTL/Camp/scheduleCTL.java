package com.naver.dcancer.CTL.Camp;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.naver.dcancer.DTO.promiseDTO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class scheduleCTL {
	@Autowired
	CampService service;
	
	@GetMapping("schedule")
	public ModelAndView promise() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Camp/promise");
		LocalDate now = LocalDate.now();
		DateTimeFormatter form = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String date=form.format(now);
		
		List<promiseDTO>list = service.promisedBuyer(date);
		List<promiseDTO>data = service.promisedData(date);
		mav.addObject("list",list);
		mav.addObject("data",data);
		mav.addObject("date", date);
		
		System.out.println(data);
		return mav;
	}
	
	@PostMapping(value="promise", produces="application/text;charset=UTF-8")
	public String promise(@RequestParam("date") String date) {
		List<promiseDTO>list = service.promisedBuyer(date);
		List<promiseDTO>data = service.promisedData(date);
		System.out.println("[promise.data]"+data);
		
		JsonArray json = new JsonArray();
		for(int i = 0; i<list.size(); i++) {
			JsonObject jlist = new JsonObject();
			jlist.addProperty("customNo", list.get(i).getCustomNo());
			jlist.addProperty("name", list.get(i).getName());
			jlist.addProperty("tel", list.get(i).getTel());
			jlist.addProperty("sellNo", list.get(0).getSellNo());
			jlist.addProperty("selldate", list.get(i).getSelldate());
			JsonArray jarr = new JsonArray();
			for(int j=0;j<data.size();j++) {
				JsonObject jdata = new JsonObject();
				if(data.get(j).getSellNo().equals(data.get(i).getSellNo())) {
					jdata.addProperty("sellno", data.get(j).getSellNo());
					jdata.addProperty("goodno", data.get(j).getGoodno());
					jdata.addProperty("model", data.get(j).getModel());
					jdata.addProperty("qtt", data.get(j).getQtt());
					jdata.addProperty("price", data.get(j).getRealprice());
					jdata.addProperty("priceStr", data.get(j).getRealpriceStr());
					jarr.add(jdata);
				}
				
			}
			jlist.add("detail", jarr);
			json.add(jlist);
		}
		System.out.println(json.toString());
	return json.toString();
	}
}
