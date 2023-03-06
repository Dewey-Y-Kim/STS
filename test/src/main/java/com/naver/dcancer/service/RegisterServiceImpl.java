package com.naver.dcancer.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.naver.dcancer.dao.RegisterDAO;
import com.naver.dcancer.dto.RegisterDTO;

@Service
public class RegisterServiceImpl implements RegisterService {
	// 객체생성 : @AutoWired @Inject :interface 객체 생 
	@Inject
	RegisterDAO dao;
	@Override
	public RegisterDTO loginOk(String usrid, String usrpwd) {
		return dao.loginOk(usrid, usrpwd);
	}
}
