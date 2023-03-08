package com.naver.dcancer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.PagingVO;
import com.naver.dcancer.dto.BoardDTO;


public interface BoardService {
	
	public int boardInsert(BoardDTO dto);
	public int boardCnt();
	public List<BoardDTO> pageSelect(PagingVO vo);
}
