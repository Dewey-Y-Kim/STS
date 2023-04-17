package com.naver.dcancer.CTL;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.Service.HQService;

@RestController
public class NoticeCTL {
	HQService service;
	@PostMapping("HQ/noticeinsert")
	public String noticeInsert(NoticeDTO dto,HttpSession session) {
		String respon = "";
		LoginDTO logdto = (LoginDTO) session.getAttribute("LoginResult");
		dto.setEmpno(logdto.getEmpno());
		System.out.println("[noticeInsert]"+dto.toString());
		int insertresult = service.noticeInsert(dto.getEmpno(),dto.getTitle(),dto.getContent());
		System.out.println("[noticeInsert]insertresult : "+insertresult);
		
		return respon;
	}
}
