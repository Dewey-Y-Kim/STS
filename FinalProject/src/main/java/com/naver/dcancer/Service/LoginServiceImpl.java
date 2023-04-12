package com.naver.dcancer.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.dcancer.DAO.LoginDAO;
import com.naver.dcancer.DTO.LoginDTO;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginDAO dao;

	@Override
	public LoginDTO login(int empno, String pwd) {
		return dao.login(empno, pwd);
	}

	
}
