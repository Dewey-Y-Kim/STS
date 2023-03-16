package com.naver.dcancer;

public class AjaxDTO {
	private int no;
	private String title;
	private String content;
	private String name;
	public AjaxDTO() {
		
	}
	public AjaxDTO(int no, String title, String content, String name) {
		this.no=no;
		this.title=title;
		this.content=content;
		this.name=name;
	}
	
	@Override
	public String toString() {
		return "DTO [no=" + no + ", title=" + title + ", content=" + content + ", name=" + name + "]";
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
