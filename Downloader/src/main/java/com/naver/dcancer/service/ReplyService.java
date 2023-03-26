package com.naver.dcancer.service;

import java.util.List;

import com.naver.dcancer.dto.ReplyDTO;

public interface ReplyService {
	public int replyInsert(ReplyDTO dto);
	public List<ReplyDTO> replyListsel(int no);
	public int replyUpdate(ReplyDTO dto);
	public int replyDel(int no,String id);
}
