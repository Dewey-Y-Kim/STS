package com.naver.dcancer.DTO;

public class ImgDTO {
	private String model;
	private String imgUrl;
	private String path;
	private int number;
	private String prifix;
	private String ext;
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getPrifix() {
		return prifix;
	}
	public void setPrifix(String prifix) {
		this.prifix = prifix;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "ImgDTO [model=" + model + ", imgUrl=" + imgUrl + ", path=" + path + ", number=" + number + ", prifix="
				+ prifix + ", ext=" + ext + "]";
	}
	
	
}
