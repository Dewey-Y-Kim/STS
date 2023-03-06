package com.naver.dcancer.dto;

public class RegisterDTO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private String post;
	private String addr;
	private String address;
	private String hobby;
	private String usrdate;
	@Override
	public String toString() {
		return "RegisterDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", post=" + post + ", addr=" + addr + ", address=" + address + ", hobby=" + hobby + ", usrdate="
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
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
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
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getUsrdate() {
		return usrdate;
	}
	public void setUsrdate(String usrdate) {
		this.usrdate = usrdate;
	}
	
}
