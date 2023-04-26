package com.naver.dcancer.CTL.Camp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.json.JsonMapper;
import com.google.gson.JsonObject;
import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.addressDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.Service.CampService;

@RestController
@RequestMapping("Camp")
public class customCTL {
	String confmKey ="devU01TX0FVVEgyMDIzMDQyNTE2NDUzODExMzcyMzM=";
	@Autowired
	CampService service;
	
	@PostMapping("customSearch")
	public List<customDTO> customSearch(pagingVO vo, @RequestParam("searchKey")String key, @RequestParam("searchWord") String word) {
		System.out.println("[customSearch]"+key+"\t"+word);
		vo.setSearchKey(key);
		vo.setSearchWord(word);
		List<customDTO> list = service.customSelect(vo);
		System.out.println(list);
		return list;
	}
	@PostMapping(value="addressFind",produces = "Application/text;charset=UTF-8")
	public String addressFind(@RequestParam("keyword")String keyword,pagingVO addrpaging){
		String currentPage = String.valueOf(addrpaging.getNowPage()); 
		String countPerPage = String.valueOf(addrpaging.getLinePerPage()); 
		String resultType = "json"; 
		System.out.println(currentPage+"\t"+countPerPage+"\t"+resultType+"\t"+keyword);
		//API 호출 URL 정보 설정 
		StringBuffer sb = new StringBuffer();
		try {
			String apiUrl = "http://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?currentPage="+currentPage+"&countPerPage="+countPerPage+ "&keyword="+URLEncoder.encode(keyword,"UTF-8")+ "&confmKey="+confmKey+"&resultType="+resultType; 
			URL url = new URL(apiUrl); 
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8")); 
			
			String tempStr = null;
			while(true){
				tempStr = br.readLine();
				if(tempStr == null) break; 
				sb.append(tempStr); // 응답결과 JSON 저장
			}
			br.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(sb.toString());
		String result = sb.toString();
		result=result.substring(1,result.length()-1);
		System.out.println(result);
		 // response.setCharacterEncoding("UTF-8");
		 // response.setContentType("text/xml");
		 // response.getWriter().write(sb.toString());
		return result;
	}
	@PostMapping("optData")
	public List<OptDTO> optDatacall(int customNo){
		List<OptDTO> list = service.optDataSelect(customNo);
		
		return list;
	}
	@PostMapping("addcustomInfo")
	public String register(HttpSession session, customDTO dto) {
		int result=-1;
		
		dto.setCode((String)session.getAttribute("code"));
		System.out.println(dto.toString());
		service.addCustomData(dto);
		customDTO resDTO = service.customfinder(dto.getName(),dto.getTel(),dto.getCampname());
		String res;
		if(result==0) {
			res="failed";
		}else {
			//본래는 고객번호만 넣어줘도 되나, 차후 업데이트를 위해 dto를 json화 해서 보냄
			JsonObject json = new JsonObject();
			json.addProperty("customNo", resDTO.getCustomNo());
			json.addProperty("name", resDTO.getName());
			json.addProperty("birth", resDTO.getBirth());
			json.addProperty("email", resDTO.getEmail());
			json.addProperty("addr1", resDTO.getAddr1());
			json.addProperty("addr2", resDTO.getAddr2());
			json.addProperty("gender", resDTO.getGender());
			json.addProperty("code", resDTO.getCode());
			json.addProperty("tel1", resDTO.getTel1());
			json.addProperty("tel2", resDTO.getTel2());
			json.addProperty("tel3", resDTO.getTel3());
			res=json.toString();
		}
		return res;
	}
}
