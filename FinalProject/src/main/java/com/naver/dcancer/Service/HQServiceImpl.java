package com.naver.dcancer.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.HQDAO;
import com.naver.dcancer.DTO.noticeDTO;

@Service
public class HQServiceImpl implements HQService{
	@Autowired
	HQDAO dao;
	public List<noticeDTO> noticeList(){
		return dao.noticeList();
	}
	@Override
	public noticeDTO noticeView(int no) {
		// TODO Auto-generated method stub
		return dao.noticeView(no);
	}
}
