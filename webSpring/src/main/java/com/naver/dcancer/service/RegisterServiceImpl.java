package com.naver.dcancer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.RegisterDAO;
import com.naver.dcancer.dto.RegisterDTO;
import com.naver.dcancer.dto.ZipcodeDTO;

@Service
public class RegisterServiceImpl implements RegisterService {
	// 객체생성 : @AutoWired @Inject :interface 객체 생 
	@Inject
	RegisterDAO dao;
	@Override
	public RegisterDTO loginOk(String usrid, String usrpwd) {
		return dao.loginOk(usrid, usrpwd);
	}
	@Override
	public int idChkCount(String id) {
		return dao.idChkCount(id);
	}
	@Override
	public List<ZipcodeDTO> zipSearch(String doroname){
		
		return dao.zipSearch(doroname);
	}
	@Override
	public int registInsert(RegisterDTO dto) {
		return dao.registInsert(dto);
	}
	@Override
	public RegisterDTO registEdit(String id) {
		return dao.registEdit(id);
	}
	@Override
	public int registEditOk(RegisterDTO dto) {
		// TODO Auto-generated method stub
		return dao.registEditOk(dto);
	}
	
}
