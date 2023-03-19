package com.naver.dcancer.dao;

import java.util.List;

import com.naver.dcancer.dto.RegisterDTO;
import com.naver.dcancer.dto.ZipcodeDTO;

public interface RegisterDAO {
	public RegisterDTO loginOk(String usrid, String usrpwd);
	public int idChkCount(String id); // 아이디 갯수 확인
	public List<ZipcodeDTO> zipSearch(String doroname);
	public int registInsert(RegisterDTO dto);
	public RegisterDTO registEdit(String id);
	public int registEditOk(RegisterDTO dto);
	public int findId(String name, String email);
}
