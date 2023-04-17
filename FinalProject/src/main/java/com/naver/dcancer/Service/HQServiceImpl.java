package com.naver.dcancer.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.HQDAO;
import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.DTO.NoticeDTO;

@Service
public class HQServiceImpl implements HQService{
	@Autowired
	HQDAO dao;
	public List<NoticeDTO> noticeList(){
		return dao.noticeList();
	}
	@Override
	public NoticeDTO noticeView(int no) {
		// TODO Auto-generated method stub
		return dao.noticeView(no);
	}
	@Override
	public int noticeInsert(int empno, String title, String content) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
