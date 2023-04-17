package com.naver.dcancer.DAO;

import java.util.List;

import com.naver.dcancer.DTO.NoticeDTO;

public interface HQDAO {
	public List<NoticeDTO> noticeList();
	public NoticeDTO noticeView(int no);
	public int noticeInsert(NoticeDTO dto);
}
