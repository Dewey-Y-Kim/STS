package com.naver.dcancer.Service;

import java.util.List;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQService {
	public int pagingData();
	public int hitupdate(int no, String bbs);
	//Notice
	public List<NoticeDTO> noticeList(pagingVO vo);
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int no);
	
	//Seller
	public List<SellerDTO> sellerList(pagingVO vo);
}
