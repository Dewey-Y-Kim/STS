package com.naver.dcancer.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.goodDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQService {
	public int pagingData(String bbs, String data);
	public int hitupdate(int no, String bbs);
	//Notice
	public List<NoticeDTO> noticeList(pagingVO vo);
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int no);
	
	//Seller
	public List<SellerDTO> sellerList(pagingVO vo);
	public int sellerUpdate(SellerDTO dto);
	public int sellerInsert(SellerDTO dto);
	public int sellerDel(@Param("sellercode")String sellercode);
	
	//Brand
	public List<goodDTO> goodlist(pagingVO vo);
	public List<SellerDTO> sellerInfo();
	public int lastGoodNo();
	public int lastBrandcode();
	public int goodinsert(List<goodDTO> list);
	public int goodDel(int[] delArray);
}
