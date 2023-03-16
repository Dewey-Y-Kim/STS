package com.naver.dcancer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.ReplyDAO;
import com.naver.dcancer.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO dao;

	@Override
	public int replyInsert(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return dao.replyInsert(dto);
	}
	
}
