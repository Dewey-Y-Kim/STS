package com.naver.dcancer.CTL.Camp;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class SellCTL {
	@Autowired
	CampService service;
	@GetMapping("Selldata")
	public ModelAndView sellInfo(HttpSession session, String date) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Camp/SellData");
		//로그인한 매장의 코드 구하기
		String code=(String)session.getAttribute("code");
		
		LocalDate now = LocalDate.now();
		//localdate 사용
		if(date!=null) {
			now = LocalDate.parse(date);
		}
		
		System.out.println("[Now]:"+now);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // 포맷 적용
		
        String formattedNow = now.format(formatter);
		List<SellDTO> selledlist = service.selledList(code, now.toString());
		List<SellDTO> selledData = service.selledData(code, now.toString());
		System.out.println(code+"   "+now.toString());
		System.out.println("[sellInfo] list:"+selledlist);
		System.out.println("[sellInfo] data:"+selledData);
		mav.addObject("sellDate",formattedNow);
		mav.addObject("selledList",selledlist);
		mav.addObject("selledData",selledData);
		mav.setViewName("Camp/SellData");
		return mav;
	}
	
	@PostMapping("updateOptData")
	public String updateSellData(String RSph, String RCyl,	String RAxis, String RAdd, String LSph, String LCyl, String LAxis, String LAdd, String pd, int customNo, String memo, String sellNo, String promiseDate,String sellDate ) {
		//검안기록 추가 
		// customNo,promisedate,sellstatu 업데이트
		OptDTO dto = new OptDTO();
		if (RSph != null && !RSph.equals("")) {
			dto.setRSph(Double.parseDouble(RSph));
		}
		if (RCyl != null && !RCyl.equals("")) {
			dto.setRCyl(Double.parseDouble(RCyl));
		}
		if (RAxis != null && !RAxis.equals("")){
			dto.setRAxis(Integer.parseInt(RAxis));
		}
		if (RAdd !=null && !RAdd.equals("")) {
			dto.setRAdd(Double.parseDouble(RAdd));
		}
		if (LSph !=null && !LSph.equals("")) {
			dto.setLSph(Double.parseDouble(LSph));
		}
		if (LCyl != null && !LCyl.equals("")) {
			dto.setRCyl(Double.parseDouble(LCyl));
		}
		if (LAxis != null && !LAxis.equals("")){
			dto.setRAxis(Integer.parseInt(LAxis));
		}
		if (LAdd !=null && !LAdd.equals("")) {
			dto.setRAdd(Double.parseDouble(LAdd));
		}
		if (pd != null && !pd.equals("")) {
			dto.setPd(Double.parseDouble(pd));
		}
		if ( customNo !=0 ) {
			dto.setCustomNo(customNo);
		}
		if ( sellNo != null && !sellNo.equals("") ) {
			dto.setSellNo(sellNo);
		}
		
		System.out.println(sellDate);
		if ( promiseDate !=null && !promiseDate.equals("") ) {
			//DateTimeFormatter form = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			/*
			//LocalDate selledDate = LocalDate.parse(selldate);
			//LocalDate promiseDay= LocalDate.parse(promiseDate);
			*/
			if(sellDate.equals(promiseDate)) {
				dto.setSellStatus("0");
			}else {
				dto.setSellStatus("1");
			}
			
			System.out.println(promiseDate);
			System.out.println(sellDate);
			dto.setPromiseDate(promiseDate);
		}
		System.out.println("[promisedate]"+dto.getPromiseDate());
		System.out.println("[promise]"+promiseDate);
		int result = service.addOptData(dto);
		JsonObject json = new JsonObject();
		if(result > 0) {
			json.addProperty("memo", memo);
			json.addProperty("pd", pd);
			json.addProperty("LSph", LSph);
			json.addProperty("LCyl", LCyl);
			json.addProperty("LAxis", LAxis);
			json.addProperty("LAdd", LAdd);
			json.addProperty("RSph", RSph);
			json.addProperty("RCyl", RCyl);
			json.addProperty("RAxis", RAxis);
			json.addProperty("RAdd", RAdd);
			json.addProperty("customNo",customNo);
			json.addProperty("registDate", dto.getRegistDate());
		}
		result = service.selldataUpdate(dto);
		if(result >0) {
			json.addProperty("sellNo", sellNo);
			json.addProperty("promiseDate", promiseDate);
		}
		
		return json.toString();
	}
}
