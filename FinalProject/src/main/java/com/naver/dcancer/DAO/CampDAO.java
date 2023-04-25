package com.naver.dcancer.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface CampDAO {
	public List<customDTO> customSelect(pagingVO vo);
}
