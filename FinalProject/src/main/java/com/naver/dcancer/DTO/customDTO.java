package com.naver.dcancer.DTO;

import java.util.Arrays;

public class customDTO {
	private int customNo;
	private String name;
	private String birth;
	private String email;
	private String addr1;
	private String addr2;
	private String gender;
	private String code;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String campname;
	
	
	@Override
	public String toString() {
		return "customDTO [customNo=" + customNo + ", name=" + name + ", birth=" + birth + ", email=" + email
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", gender=" + gender + ", code=" + code + ", tel=" + tel
				+ ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", campname=" + campname + "]";
	}
	public int getCustomNo() {
		return customNo;
	}
	public void setCustomNo(int customNo) {
		this.customNo = customNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCode() { // 등록매장
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String[] teldivide = new String[3]; 
		teldivide= (this.tel).split("-");
		System.out.println(Arrays.toString(teldivide));
		tel1=teldivide[0];
		tel2=teldivide[1];
		tel3=teldivide[2];
		System.out.println("[dtoTel]"+this.tel+"\t"+teldivide[0]+"\t"+teldivide[1]+"\t"+teldivide[2]);
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
		tel = tel1+"-"+tel2+"-"+tel3;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
		tel = tel1+"-"+tel2+"-"+tel3;
	}
	public String getTel3() {
		return tel3;
		
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
		tel = tel1+"-"+tel2+"-"+tel3;
	}
	public String getCampname() {
		return campname;
	}
	public void setCampname(String campname) {
		this.campname = campname;
	}
}
