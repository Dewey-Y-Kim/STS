package com.naver.dcancer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.naver.dcancer.dao.BoardDAO;
import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.dto.PagingVO;

@Service
public class BoardServiceimpl implements BoardService {
	@Inject
	BoardDAO dao;
	
	@Override
	public int boardInsert(BoardDTO dto) {
		return dao.boardInsert(dto);
	}

	@Override
	public int boardCnt(PagingVO vo) {
		return dao.boardCnt(vo);
	}

	@Override
	public List<BoardDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public BoardDTO contentSelect(int no) {
		return dao.contentSelect(no);
	}
	public BoardDTO editSelect(int no) {
		return dao.editSelect(no);
	}
	public int contentUpdate(BoardDTO dto) {
		return dao.contentUpdate(dto);
	}
	public int delRecord(int no, String logid) {
		return dao.delRecord(no, logid);
	}
	public void hitCount(int no) {
		dao.hitCount(no);
	}

	@Override
	public int boardDel(BoardDTO dto) {
		return dao.boardDel(dto);
	}
}
