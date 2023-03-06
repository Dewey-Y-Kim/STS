package com.naver.dcancer.service;

import com.naver.dcancer.dto.RegisterDTO;

public interface RegisterService {
	public RegisterDTO loginOk(String usrid, String usrpwd);
	public int idChkCount(String id);
}
