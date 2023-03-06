package com.naver.dcancer.dao;

import com.naver.dcancer.dto.RegisterDTO;

public interface RegisterDAO {
	public RegisterDTO loginOk(String usrid, String usrpwd);
}
