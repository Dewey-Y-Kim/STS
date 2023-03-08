package com.naver.dcancer.dao;

import java.util.List;

import com.naver.dcancer.dto.BoardDTO;

public interface BoardDAO {
	public int boardInsert(BoardDTO dto);
	public int boardCnt();
	public List<BoardDTO> pageSelect(PagingVO vo);
}
