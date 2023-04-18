package com.naver.dcancer.Service;

import java.util.List;

import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.pagingVO;

public interface HQService {
	public int pagingData();
	public List<NoticeDTO> noticeList(pagingVO vo);
	public NoticeDTO noticeView(int no);
	public int noticeInsert(int empno, String title, String content);
}
