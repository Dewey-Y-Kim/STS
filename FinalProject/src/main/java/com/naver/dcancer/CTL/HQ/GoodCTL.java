package com.naver.dcancer.CTL.HQ;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dcancer.DTO.goodDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.Service.HQService;

@RestController
@RequestMapping("HQ")
public class GoodCTL {
	@Autowired
	HQService service;
	
	@PostMapping("goodlist")
	public List<goodDTO> goodlist(pagingVO vo) {
		List<goodDTO> list = service.goodlist(vo);
		return list;
	}
	
	@PostMapping("goodInsert")
	public String goodInsert(goodDTO dto) {
		System.out.println(dto.toString());
		dto.setGoodno(service.lastGoodNo()+1);
		dto.setBrandcode(service.lastBrandcode()+1);
		System.out.println("[goodInsert]"+dto.toString());
		List<goodDTO> list = putter(dto);
		System.out.println(list);
		//System.out.println("[list]:"+list);
		int result= service.goodinsert(list);
		return "success";
	}
	
	public ArrayList<goodDTO> putter(goodDTO dto){
		List<goodDTO> list = new ArrayList<goodDTO>();
		if(dto.getClassifyno().equals("2") || dto.getClassifyno().equals("3")) {
			DecimalFormat form = new DecimalFormat("#0.00");
			String name;
			//classifyno=2, model=prohit, buyprice=60000, sellprice=120000, Sellername=null, name=null, sphStart=4.0, sphEnd=-12.0, cylStart=0.0, cylEnd=-4.0
			if (dto.getCylEnd()!=0) {
				for (double sph = dto.getSphStart() ; sph >= dto.getSphEnd(); sph-=0.25 ) {
					for(double cyl=0; cyl>=dto.getCylEnd(); cyl-=0.25) {
						goodDTO goodDTO= new goodDTO();
						if(sph*cyl==0) {
							if(cyl == 0 ) {
								name = dto.getName()+" S"+(sph>=0? "+":"")+form.format(sph);
							} else {
								name = dto.getName()+" C"+form.format(cyl);
							}
						}else{
							name = dto.getName()+" S"+(sph>0? "+":"")+form.format(sph)+" C"+form.format(cyl);
						}
						goodDTO.setModel(name);
						goodDTO.setGoodno(dto.getGoodno());
						goodDTO.setClassifyno(dto.getClassifyno());
						goodDTO.setSellercode(dto.getSellercode());
						goodDTO.setName(dto.getName());
						goodDTO.setBuyprice(dto.getBuyprice());
						goodDTO.setSellprice(dto.getSellprice());
						goodDTO.setBrandcode(dto.getBrandcode());
						list.add(goodDTO);
						dto.setGoodno(dto.getGoodno()+1);
					}
				}
			}else {
				//sph 만
				for (double sph = dto.getSphStart(); sph>=dto.getSphEnd(); sph-= 0.25) {
					goodDTO goodDTO = new goodDTO();
					name = dto.getName()+" S"+form.format(sph);
					goodDTO.setModel(name);
					goodDTO.setGoodno(dto.getGoodno());
					goodDTO.setName(dto.getName());
					goodDTO.setClassifyno(dto.getClassifyno());
					goodDTO.setSellercode(dto.getSellercode());
					goodDTO.setBuyprice(dto.getBuyprice());
					goodDTO.setSellprice(dto.getSellprice());
					goodDTO.setBrandcode(dto.getBrandcode());
					list.add(goodDTO);
					dto.setGoodno(dto.getGoodno()+1);
				}
			}
		}else {
			dto.setModel(dto.getName());
			list.add(dto);
		}
		return (ArrayList<goodDTO>) list;
	}
	@PostMapping(value="brandDel")
	//public String brandDel(@RequestBody String delarray) {
	public String brandDel(@RequestParam(value="brandcode[]") List<String> delarray) {
		System.out.println(delarray);
		System.out.println(delarray.get(1));
		int result = service.goodDel(delarray);
		String serviceResult;
		if( result == delarray.size()) {
			serviceResult = "successed";
		}else {
			serviceResult = "failed";
		}
		System.out.println("[brandDel]result:"+result);
		return "";
	}
}
