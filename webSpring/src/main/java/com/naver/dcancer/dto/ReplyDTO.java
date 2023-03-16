package com.naver.dcancer.dto;

public class ReplyDTO {
	private int no;
	private String id;
	private String content;
	private String writedate;
	private String ip;
	private int replyNo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	@Override
	public String toString() {
		return "ReplyDTO [no=" + no + ", id=" + id + ", content=" + content + ", writedate=" + writedate + ", ip=" + ip
				+ ", replyNo=" + replyNo + "]";
	}
	
}
