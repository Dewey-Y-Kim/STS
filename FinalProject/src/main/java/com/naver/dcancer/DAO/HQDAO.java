package com.naver.dcancer.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.goodDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQDAO {
	public int pagingData(@Param("bbs") String bbs,@Param("data") String data);
	public int hitupdate(@Param("no")int no, @Param("bbs")String bbs);
	//notice
	public List<NoticeDTO> noticeList(pagingVO vo);
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(int no);
	//seller
	public List<SellerDTO> sellerList(pagingVO vo);
	public int sellerUpdate(SellerDTO dto);
	public int sellerInsert(SellerDTO dto);
	public int sellerDel(@Param("sellercode")String sellercode);
	//Brand
	public List<goodDTO> goodlist(pagingVO vo);
	public List<SellerDTO> sellerInfo();// 셀러 선택창
	public int lastGoodNo();
	public int lastBrandcode();
	public int goodinsert(List<goodDTO> list);
	public int goodDel(@Param("delno") List<String> delArray);
}
