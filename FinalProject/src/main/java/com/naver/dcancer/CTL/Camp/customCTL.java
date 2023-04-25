package com.naver.dcancer.CTL.Camp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	public List<customDTO> customSearch(pagingVO vo, @Param("searchKey")String key, @Param("searchWord") String word) {
		vo.setSearchKey(key);
		vo.setSearchWord(word);
		List<customDTO> list = service.customSelect(vo);
		return list;
	}
	@PostMapping("addressFind")
	public String addressFind(pagingVO addrpaging, @RequestParam("address_find")String findvalue){
		String currentPage = String.valueOf(addrpaging.getNowPage()); 
		String countPerPage = String.valueOf(addrpaging.getLinePerPage()); 
		String resultType = "json"; 
		String keyword = findvalue;
		System.out.println(currentPage+"\t"+countPerPage+"\t"+resultType+"\t"+keyword);
		//API 호출 URL 정보 설정 
		StringBuffer sb = new StringBuffer();
		try {
			System.out.println("chk0");
			String apiUrl = "http://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?currentPage="+currentPage+"&countPerPage="+countPerPage+ "&keyword="+URLEncoder.encode(keyword,"UTF-8")+ "&confmKey="+confmKey+"&resultType="+resultType; 
			System.out.println("chk1");
			URL url = new URL(apiUrl); 
			System.out.println("chk2");
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
		/*
		 * response.setCharacterEncoding("UTF-8");
		 * response.setContentType("text/xml");
		 * response.getWriter().write(sb.toString());
		 */
		
		return sb.toString();
	}
}
