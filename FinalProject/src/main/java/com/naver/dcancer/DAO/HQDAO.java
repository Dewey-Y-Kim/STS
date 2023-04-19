package com.naver.dcancer.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQDAO {
	public int pagingData();
	public int hitupdate(@Param("no")int no, @Param("bbs")String bbs);
	//notice
	public List<NoticeDTO> noticeList(pagingVO vo);
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int no);
	//seller
	public List<SellerDTO> sellerList(pagingVO vo);
}
