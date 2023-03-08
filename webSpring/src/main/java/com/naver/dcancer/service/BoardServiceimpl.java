package com.naver.dcancer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.naver.dcancer.dao.BoardDAO;
import com.naver.dcancer.dao.PagingVO;
import com.naver.dcancer.dto.BoardDTO;

@Service
public class BoardServiceimpl implements BoardService {
	@Inject
	BoardDAO dao;
	
	@Override
	public int boardInsert(BoardDTO dto) {
		return dao.boardInsert(dto);
	}

	@Override
	public int boardCnt() {
		return dao.boardCnt();
	}

	@Override
	public List<BoardDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}
	
}
