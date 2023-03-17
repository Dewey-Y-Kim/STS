package com.naver.dcancer.dto;

public class ReplyDTO {
	private int no;
	private String id;
	private String reply;
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "ReplyDTO [no=" + no + ", id=" + id + ", reply=" + reply + ", writedate=" + writedate + ", ip=" + ip
				+ ", replyNo=" + replyNo + "]";
	}
	
	
}
