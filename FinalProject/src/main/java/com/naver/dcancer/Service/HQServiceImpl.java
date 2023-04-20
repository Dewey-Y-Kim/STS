package com.naver.dcancer.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.HQDAO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.goodDTO;
import com.naver.dcancer.DTO.pagingVO;

@Service
public class HQServiceImpl implements HQService{
	@Inject
	HQDAO dao;
	
	@Override
	public int pagingData(String bbs,String data) {
		return dao.pagingData(bbs, data);
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
	@Override
	public int sellerUpdate(SellerDTO dto) {
		// TODO Auto-generated method stub
		return dao.sellerUpdate(dto);
	}
	@Override
	public int sellerInsert(SellerDTO dto) {
		// TODO Auto-generated method stub
		return dao.sellerInsert(dto);
	}
	@Override
	public int sellerDel(String sellercode) {
		// TODO Auto-generated method stub
		return dao.sellerDel(sellercode);
	}
	@Override
	public List<SellerDTO> sellerInfo() {
		// TODO Auto-generated method stub
		return dao.sellerInfo();
	}
	@Override
	public int goodinsert(goodDTO dto) {
		// TODO Auto-generated method stub
		return dao.goodinsert(dto);
	}
	
	
}
