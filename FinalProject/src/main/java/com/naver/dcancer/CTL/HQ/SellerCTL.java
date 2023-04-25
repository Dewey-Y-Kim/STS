package com.naver.dcancer.CTL.HQ;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonFactoryBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dcancer.DAO.HQDAO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.Service.HQService;

@RestController
@RequestMapping("HQ")
public class SellerCTL {
	@Autowired
	HQService service;
	
	@PostMapping(value="updateSeller", produces = "application/text;charset=utf-8")
	public String sellerupdate(SellerDTO dto) {
		System.out.println(dto.toString());
		int updateResult = service.sellerUpdate(dto);
		/*
		JSONObject json = new JSONObject();
		json.put("sellercode", dto.getSellercode());
		json.put("sellername", dto.getSellername());
		json.put("sellerceo", dto.getSellerceo());
		json.put("sellertel", dto.getSellertel());
		json.put("sellerfax", dto.getSellerfax());
		System.out.println(json.toJSONString());
		*/
		String result = dto.getSellercode();
		return result;
	}
	@PostMapping(value="sellerInsert", produces = "application/text;charset=utf-8")
	public String sellerInsert(SellerDTO dto) {
		dto.setSellertel(dto.getTel1()+"."+dto.getTel2()+"."+dto.getTel3());
		dto.setSellerfax(dto.getFax1()+"."+dto.getFax2()+"."+dto.getFax3());
		int insertResult = service.sellerInsert(dto);
		System.out.println(dto.toString());
		return String.valueOf(insertResult);
	}
	@PostMapping("sellerDel")
	public String sellerDel(@Param("no")String sellercode) {
		service.sellerDel(sellercode);
		return sellercode;
	}
	
}
