package com.naver.dcancer.DTO;

public class customDTO {
	private int customNo;
	private String name;
	private String birth;
	private String email;
	private String addr;
	private String address;
	private String gender;
	private String code;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String campname;
	
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
	public String getAddr() { //전체주소
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddress() { //상세주소
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
		String[] teldivide= tel.split(".");
		tel1=teldivide[0];
		tel2=teldivide[1];
		tel3=teldivide[2];
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
		tel = tel1+"."+tel2+"."+tel3;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
		tel = tel1+"."+tel2+"."+tel3;
	}
	public String getTel3() {
		return tel3;
		
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
		tel = tel1+"."+tel2+"."+tel3;
	}
	public String getCampname() {
		return campname;
	}
	public void setCampname(String campname) {
		this.campname = campname;
	}
}
