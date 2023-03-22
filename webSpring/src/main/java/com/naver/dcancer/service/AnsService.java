package com.naver.dcancer.service;

import java.util.List;

import com.naver.dcancer.dto.AnswerDTO;

public interface AnsService {
	public int totalRec();
	public List<AnswerDTO> answerList();
	public int answerInsert(AnswerDTO dto);
	public AnswerDTO ansView(int no);
	public int addhit(int no);
	public AnswerDTO replydataselect(int no);
	public int replyStepUp(AnswerDTO orignaDTO);
	public int replyInsert(AnswerDTO dto);
}
