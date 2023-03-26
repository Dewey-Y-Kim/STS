package com.naver.dcancer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.dao.TransActionDAO;

@Service
public class TransActionServiceImpl implements TransActionService {
	@Autowired
	TransActionDAO dao;
	@Override
	public int transBoardInsert(BoardDTO dto) {
		return dao.transBoardInsert(dto);
	}
}
