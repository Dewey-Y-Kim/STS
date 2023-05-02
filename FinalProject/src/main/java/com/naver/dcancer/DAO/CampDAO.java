package com.naver.dcancer.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.DTO.soldDTO;

public interface CampDAO {
	public List<customDTO> customSelect(pagingVO vo);
	public List<OptDTO> optDataSelect(@Param("no")int customNo);
	public int addCustomData(customDTO custom);
	public int addOptData(OptDTO opt);
	public customDTO customfinder(@Param("name")String name, @Param("tel") String tel, @Param("code") String code);
	public customDTO customfind(@Param("customNo")int no);
	
	//매출등록 -> 판매내역 update
		// 판매자 리스트
	public List<SellDTO> selledList(@Param("code") String code, @Param("date") String date);
		// 판매내역 리스트
	public List<SellDTO> selledData(@Param("code") String code, @Param("date") String date);
		// sellInfo 업데이트
	public int selldataUpdate(OptDTO dto);
	//전체매장 매출확인
	public List<soldDTO> soldDay(@Param("date") String date);
	public List<soldDTO> soldBetween(@Param("startDate") String startDate,@Param("endDate") String endDate);
}
