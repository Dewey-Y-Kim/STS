package com.naver.dcancer.DAO;

import java.util.List;

import com.naver.dcancer.DTO.noticeDTO;

public interface HQDAO {
	public List<noticeDTO> noticeList();
	public noticeDTO noticeView(int no);
}
