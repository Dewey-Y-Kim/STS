package com.naver.dcancer.Service;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.SellDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.DTO.promiseDTO;
import com.naver.dcancer.DTO.refundDTO;
import com.naver.dcancer.DTO.soldDTO;
import com.naver.dcancer.DTO.brokenDTO;

public interface CampService {
	public int pagingData(String bbs, String data);
	//검안등록
	public List<customDTO> customSelect(pagingVO vo);
	public List<OptDTO> optDataSelect(int customNo);
	public int addCustomData(customDTO custom);
	public int addOptData(OptDTO opt);
	public int addOpt(OptDTO opt);
	public customDTO customfinder(@Param("name")String name, @Param("tel") String tel, @Param("code") String code);
	public customDTO customfind(@Param("no")int no);
	
	//매출등록 판매내역을 전산화 update 위주
	public List<SellDTO> selledList(String code, String date);
	public List<SellDTO> selledData(String code, String date);
	public int selldataUpdate(OptDTO dto);
	
	//soldDay
	public List<soldDTO> soldDay(@Param("date") String date);
	public List<soldDTO> soldBetween(@Param("startDate") String startDate,@Param("endDate") String endDate);

	//bokenList
	public List<brokenDTO> brokenList();
	public List<brokenDTO> brokenFind(String searchWord);
	public int brokenInsert(brokenDTO dto);

	// refund
	public List<refundDTO> refundList();
	public List<refundDTO> refundFind(@Param("searchWord") String searchWord);
	public int refundInsert(refundDTO dto);
	
	// promise
	public List<promiseDTO> promisedBuyer(String date);
	public List<promiseDTO> promisedData(String date);
	public List<promiseDTO> promiseToday(int code, String now);
}
