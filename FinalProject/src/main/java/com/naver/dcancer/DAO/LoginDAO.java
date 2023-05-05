package com.naver.dcancer.DAO;

import org.apache.ibatis.annotations.Param;

import com.naver.dcancer.DTO.LoginDTO;

public interface LoginDAO {
	public LoginDTO login(int empno,String pwd);
	
	public String getNoticeContent(@Param("no") String no);
	
}
