package com.naver.dcancer.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.CampDAO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

@Service
public class CampServiceImpl implements CampService {
	@Inject
	CampDAO dao;

	@Override
	public List<customDTO> customSelect(pagingVO vo) {
		// TODO Auto-generated method stub
		return dao.customSelect(vo);
	}

	

}
