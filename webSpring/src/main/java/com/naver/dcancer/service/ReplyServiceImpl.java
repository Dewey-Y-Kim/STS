package com.naver.dcancer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.ReplyDAO;
import com.naver.dcancer.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	ReplyDAO dao;

	@Override
	public int replyInsert(ReplyDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("[dao.replyInsert]"+dto.toString());
		return dao.replyInsert(dto);
	}
	public List<ReplyDTO> replyListsel(int no){
		return dao.replyListsel(no);
	}
	@Override
	public int replyUpdate(ReplyDTO dto) {
		// TODO Auto-generated method stub
		return dao.replyUpdate(dto);
	}
	@Override
	public int replyDel(int no, String id) {
		// TODO Auto-generated method stub
		return dao.replyDel(no, id);
	}
	
}
