package com.naver.dcancer.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface CampService {
	public List<customDTO> customSelect(pagingVO vo);
}
