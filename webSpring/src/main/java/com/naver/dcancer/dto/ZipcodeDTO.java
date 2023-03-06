package com.naver.dcancer.dto;

public class ZipcodeDTO {
	private String zipcode;
	private String sido;
	private String doroname;
	private int buildnum1;        
	private int buildnum2;        
	private String buildname; 
	private String dong; 
	private int bungi1;       
	private int bungi2;
	
	
	@Override
	public String toString() {
		return "ZipcodeDTO [zipcode=" + zipcode + ", sido=" + sido + ", doroname=" + doroname + ", buildnum1="
				+ buildnum1 + ", buildnum2=" + buildnum2 + ", buildname=" + buildname + ", dong=" + dong + ", bungi1="
				+ bungi1 + ", bungi2=" + bungi2 + "]";
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getDoroname() {
		return doroname;
	}
	public void setDoroname(String doroname) {
		this.doroname = doroname;
	}
	public int getBuildnum1() {
		return buildnum1;
	}
	public void setBuildnum1(int buildnum1) {
		this.buildnum1 = buildnum1;
	}
	public int getBuildnum2() {
		return buildnum2;
	}
	public void setBuildnum2(int buildnum2) {
		this.buildnum2 = buildnum2;
	}
	public String getBuildname() {
		return buildname;
	}
	public void setBuildname(String buildname) {
		this.buildname = buildname;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getBungi1() {
		return bungi1;
	}
	public void setBungi1(int bungi1) {
		this.bungi1 = bungi1;
	}
	public int getBungi2() {
		return bungi2;
	}
	public void setBungi2(int bungi2) {
		this.bungi2 = bungi2;
	} 
}
