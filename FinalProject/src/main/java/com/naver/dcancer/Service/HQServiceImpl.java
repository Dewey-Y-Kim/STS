package com.naver.dcancer.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.HQDAO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.pagingVO;

@Service
public class HQServiceImpl implements HQService{
	@Inject
	HQDAO dao;
	
	@Override
	public int pagingData() {
		return dao.pagingData();
	}
	@Override
	public int hitupdate(int no, String bbs) {
		// TODO Auto-generated method stub
		return dao.hitupdate(no, bbs);
	}
	// Notice
	@Override
	public List<NoticeDTO> noticeList(pagingVO vo){
		return dao.noticeList(vo);
	}
	
	@Override
	public NoticeDTO noticeView(int no) {
		// TODO Auto-generated method stub
		return dao.noticeView(no);
	}
	@Override
	public int noticeInsert(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.noticeInsert(dto);
	}
	@Override
	public int noticeUpdate(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return dao.noticeUpdate(dto);
	}
	@Override
	public int noticeDelete(int no) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(no);
	}
	
	
	// Seller
	@Override
	public List<SellerDTO> sellerList(pagingVO vo) {
		// TODO Auto-generated method stub
		return dao.sellerList(vo);
	}

	
}
