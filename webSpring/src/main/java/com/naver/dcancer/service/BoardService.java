package com.naver.dcancer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.dto.PagingVO;


public interface BoardService {
	
	public int boardInsert(BoardDTO dto);
	public int boardCnt(PagingVO vo);
	public List<BoardDTO> pageSelect(PagingVO vo);
	public BoardDTO contentSelect(int no);
	public BoardDTO editSelect(int no);
	public int contentUpdate(BoardDTO dto);
	public int delRecord(int no, String logid);
	public void hitCount(int no);
	public int boardDel(BoardDTO dto);
	public int MultiDel(List nolist);
}
