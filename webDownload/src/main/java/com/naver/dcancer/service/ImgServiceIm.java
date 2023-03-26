package com.naver.dcancer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.ImgDAO;
import com.naver.dcancer.DTO.CarImgDTO;

@Service
public class ImgServiceIm implements ImgService {
	@Autowired
	ImgDAO dao;

	@Override
	public int ImgFinder(CarImgDTO dto) {
		// TODO Auto-generated method stub
		return dao.ImgFinder(dto);
	}
	
}
