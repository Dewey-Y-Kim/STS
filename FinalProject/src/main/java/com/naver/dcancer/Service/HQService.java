package com.naver.dcancer.Service;

import java.util.List;

import com.naver.dcancer.DTO.NoticeDTO;

public interface HQService {
	public List<NoticeDTO> noticeList();
	public NoticeDTO noticeView(int no);
	public int noticeInsert(int empno, String title, String content);
}
