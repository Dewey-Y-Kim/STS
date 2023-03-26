package com.naver.dcancer.Service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.ImgDAO;
import com.naver.dcancer.DTO.ImgDTO;

@Service
public class ImgSImpl implements ImgService {
	@Inject
	ImgDAO dao;

	@Override
	public ImgDTO fileName(ImgDTO dto) {
		return dao.fileName(dto);
	}
	
}
