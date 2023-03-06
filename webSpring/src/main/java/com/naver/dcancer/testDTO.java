package com.naver.dcancer;

public class testDTO {
	private String name;
	private int num;
	@Override
	public String toString() {
		return "testDTO [name=" + name + ", num=" + num + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
