package com.naver.dcancer.DTO;

public class CarImgDTO {
	private String imgUrl;
	private String model;
	private String color;
	private String path;
	private String filename;
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "CarImgDTO [imgUrl=" + imgUrl + ", model=" + model + ", color=" + color + ", path=" + path
				+ ", filename=" + filename + "]";
	}
	
}
