package com.naver.dcancer.service;

import java.util.List;

import com.naver.dcancer.dto.RegisterDTO;
import com.naver.dcancer.dto.ZipcodeDTO;

public interface RegisterService {
	public RegisterDTO loginOk(String usrid, String usrpwd);
	public int idChkCount(String id);
	public List<ZipcodeDTO> zipSearch(String doroname);
	public int registInsert(RegisterDTO dto);
	public RegisterDTO registEdit(String id);
	public int registEditOk(RegisterDTO dto);
	public String findId(String name, String email);
}
