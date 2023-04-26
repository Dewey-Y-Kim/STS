package com.naver.dcancer.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface CampDAO {
	public List<customDTO> customSelect(pagingVO vo);
	public List<OptDTO> optDataSelect(@Param("no")int customNo);
	public int addCustomData(customDTO custom);
	public int addOptData(OptDTO opt);
	public customDTO customfinder(@Param("name")String name, @Param("tel") String tel, @Param("code") String code);
}
