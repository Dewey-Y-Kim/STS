package com.naver.dcancer.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.CampDAO;
import com.naver.dcancer.DTO.OptDTO;
import com.naver.dcancer.DTO.customDTO;
import com.naver.dcancer.DTO.pagingVO;

@Service
public class CampServiceImpl implements CampService {
	@Inject
	CampDAO dao;

	@Override
	public List<customDTO> customSelect(pagingVO vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.toString());
		return dao.customSelect(vo);
	}

	@Override
	public List<OptDTO> optDataSelect(int customNo) {
		// TODO Auto-generated method stub
		return dao.optDataSelect(customNo);
	}

	@Override
	public int addCustomData(customDTO custom) {
		// TODO Auto-generated method stub
		return dao.addCustomData(custom);
	}

	@Override
	public int addOptData(OptDTO opt) {
		// TODO Auto-generated method stub
		return dao.addOptData(opt);
	}

	@Override
	public customDTO customfinder(String name, String tel, String code) {
		// 고객이름 , 전화번호, 등록매장으로 고객검색
		return dao.customfinder(name, tel, code);
	}

}
