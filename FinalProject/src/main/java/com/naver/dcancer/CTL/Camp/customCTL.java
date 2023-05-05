package com.naver.dcancer.CTL.Camp;

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
	@PostMapping("customSetter")
	public customDTO customSetter(@RequestParam("no")int no) {
		customDTO dto = service.customfind(no);
		System.out.println(dto.toString());
		return dto;
	}
	//실패 제거
	/* [customDTO [customNo=2, name=손놈1호, birth=1900-01-01 00:00:00, email=sj@gmail.com, addr1=강변북로, addr2=2길, gender=M, code=0, tel=010-4243-4243, tel1=010, tel2=4243, tel3=4243, campname=본사]]
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
	*/
	
	@PostMapping("optData")
	public List<OptDTO> optDatacall(int customNo){
		System.out.println(customNo);
		List<OptDTO> list = service.optDataSelect(customNo);
		
		return list;
	}
	@PostMapping("addcustomInfo")
	public int register(HttpSession session, customDTO dto) {
		
		dto.setCode((String)session.getAttribute("code"));
		System.out.println(dto.toString());
		int result =service.addCustomData(dto);
		System.out.println(dto);
		return dto.getCustomNo();
	}
	@SuppressWarnings("null")
	@PostMapping("addOptData")
	public String addOptData (String RSph, String RCyl,	String RAxis, String RAdd, String LSph, String LCyl, String LAxis, String LAdd, String pd, int customNo, String memo ) {
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
		return json.toString();
	}
	@GetMapping("Optometry")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Camp/Optometry");
		return mav;
	}
	
	
}
