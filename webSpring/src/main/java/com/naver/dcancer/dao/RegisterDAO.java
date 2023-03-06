package com.naver.dcancer.dao;

import com.naver.dcancer.dto.RegisterDTO;

public interface RegisterDAO {
	public RegisterDTO loginOk(String usrid, String usrpwd);
	public int idChkCount(String id); // 아이디 갯수 확인
}
