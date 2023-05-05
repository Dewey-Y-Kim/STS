package com.naver.dcancer.Service;

import com.naver.dcancer.DTO.LoginDTO;

public interface LoginService {
	public LoginDTO login(int empno,String pwd);
	public String getNoticeContent(String no);
}
