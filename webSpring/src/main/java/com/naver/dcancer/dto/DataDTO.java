package com.naver.dcancer.dto;

import java.util.List;

public class DataDTO {
	private int no;
	private String title;
	private String content;
	private String id;
	private int hit;
	private String writedate;
	private String ip;
	private String name;
	private List<String> del; 
	
	

	@Override
	public String toString() {
		return "DataDTO [no=" + no + ", title=" + title + ", content=" + content + ", id=" + id + ", hit=" + hit
				+ ", writedate=" + writedate + ", ip=" + ip + ", name=" + name + "]";
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public List<String> getDel() {
		return del;
	}

	public void setDel(List<String> del) {
		this.del = del;
	}
}
