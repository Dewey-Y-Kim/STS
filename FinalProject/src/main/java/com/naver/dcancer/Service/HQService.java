package com.naver.dcancer.Service;

import java.util.List;

import com.naver.dcancer.DTO.noticeDTO;

public interface HQService {
	public List<noticeDTO> noticeList();
	public noticeDTO noticeView(int no);
}
