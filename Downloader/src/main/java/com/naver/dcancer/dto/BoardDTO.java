package com.naver.dcancer.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BoardDTO {
	private int no;
	private String title;
	private String content;
	private String name;
	private String id;
	private int hit;
	private String writedate;
	private String ip;
	private ArrayList nolist;
//	
	
	public int getNo() {
		return no;
	}
	public ArrayList getNolist() {
		return nolist;
	}
	public void setNolist(ArrayList nolist) {
		this.nolist = nolist;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
	
}
