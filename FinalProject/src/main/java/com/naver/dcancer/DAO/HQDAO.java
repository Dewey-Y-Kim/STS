package com.naver.dcancer.DAO;

import java.util.List;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQDAO {
	public List<NoticeDTO> noticeList(pagingVO vo);
	public int pagingData();
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
}
