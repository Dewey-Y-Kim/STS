package com.naver.dcancer.DAO;

import com.naver.dcancer.DTO.LoginDTO;

public interface LoginDAO {
	public LoginDTO login(int empno,String pwd);
	/*
	 * <select id="Login" resultType="LogDTO">
	 * select c.code, c.campName, c.tel, c.fax, e.auth from empInfo e join campinfo c on c.code=e.code where e.empno=${param1} and e.pwd=${param2}
	 * </select>
	 */
}
