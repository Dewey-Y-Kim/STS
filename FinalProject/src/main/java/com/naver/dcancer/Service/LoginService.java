package com.naver.dcancer.Service;

import com.naver.dcancer.DTO.LogDTO;

public interface LoginService {
	public LogDTO Login(String empno,String pwd);
}
