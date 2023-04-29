package com.naver.dcancer.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface CampService {
	//검안등록
	public List<customDTO> customSelect(pagingVO vo);
	public List<OptDTO> optDataSelect(int customNo);
	public int addCustomData(customDTO custom);
	public int addOptData(OptDTO opt);
	public customDTO customfinder(@Param("name")String name, @Param("tel") String tel, @Param("code") String code);
	public customDTO customfind(@Param("no")int no);
	
	//매출등록 판매내역을 전산화 update 위주
	public List<SellDTO> selledList(String code, String date);
	public List<SellDTO> selledData(String code, String date);
}
