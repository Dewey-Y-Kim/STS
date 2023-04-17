package com.naver.dcancer.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginDTO {
	private String code;
	private String campName;
	private int empno;
	private String tel;
	private String fax;
	private String bussinessNo;
	private int auth;
	private String ename; 
}
