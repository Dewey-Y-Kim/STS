package com.naver.dcancer.dto;

import java.util.Arrays;

public class RegisterDTO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	private String zipcode;
	private String addr;
	private String address;
	private String hobby;
	private String hobbys[];
	private String usrdate;
	
	@Override
	public String toString() {
		return "RegisterDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", tel1=" + tel1 + ", tel2="
				+ tel2 + ", tel3=" + tel3 + ", email=" + email + ", zipcode=" + zipcode + ", addr=" + addr
				+ ", address=" + address + ", hobby=" + hobby + ", hobbys=" + Arrays.toString(hobbys) + ", usrdate="
				+ usrdate + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		tel= tel1+"-"+tel2+"-"+tel3;//010-213-1234
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
		String[] telCut=tel.split("-");
		tel1=telCut[0];
		tel2=telCut[1];
		tel3=telCut[2];
	}
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getHobby() {
		
		String hobbystr=Arrays.toString(hobbys);
		/*
		hobbystr.replace("[","");
		hobbystr.replace("]","");
		hobbystr.replaceAll(" ","");
		*/
		hobbystr=hobbystr.substring(1,hobbystr.length()-1);
		hobbystr=hobbystr.replaceAll(", ","/");
		return hobbystr;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
		hobbys=hobby.split("/");
	}
	public String[] getHobbys() {
		
		return hobbys;
	}
	public void setHobbys(String[] hobbys) {
		
		this.hobbys = hobbys;
	}
	public String getUsrdate() {
		return usrdate;
	}
	public void setUsrdate(String usrdate) {
		this.usrdate = usrdate;
	}
	
}
