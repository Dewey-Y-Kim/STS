package com.naver.dcancer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.AnswerDAO;
import com.naver.dcancer.dto.AnswerDTO;

@Service
public class AnsServiceImpl implements AnsService {
	@Autowired
	AnswerDAO dao;
	public int totalRec() {
		return dao.totalRec();
	}
	@Override
	public List<AnswerDTO> answerList() {
		// TODO Auto-generated method stub
		return dao.answerList();
	}
	@Override
	public int answerInsert(AnswerDTO dto) {
		// TODO Auto-generated method stub
		return dao.answerInsert(dto);
	}
	@Override
	public AnswerDTO ansView(int no) {
		// TODO Auto-generated method stub
		return dao.ansView(no);
	}
	@Override
	public int addhit(int no) {
		// TODO Auto-generated method stub
		return dao.addhit(no);
	}
	@Override
	public AnswerDTO replydataselect(int no) {
		// TODO Auto-generated method stub
		return dao.replydataselect(no);
	}
	@Override
	public int replyStepUp(AnswerDTO orignaDTO) {
		// TODO Auto-generated method stub
		return dao.replyStepUp(orignaDTO);
	}
	public int replyInsert(AnswerDTO dto) {
		return dao.replyInsert(dto);
	}
	
}
