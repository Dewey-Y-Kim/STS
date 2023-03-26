package com.naver.dcancer.dto;

public class DataFileDTO {
	private int no;
	private String filename;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Override
	public String toString() {
		return "DataFileDTO [no=" + no + ", filename=" + filename + "]";
	}
}
