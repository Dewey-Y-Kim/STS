package com.naver.dcancer.dao;

import java.util.List;

import com.naver.dcancer.dto.AnswerDTO;

public interface AnswerDAO {
	public int totalRec();
	public List<AnswerDTO> answerList();
	public int answerInsert(AnswerDTO dto);
	public AnswerDTO ansView(int no);
}
