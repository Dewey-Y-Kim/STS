package com.naver.dcancer.DTO;

public class brokenDTO {
	private String brokenNo;
	private String goodNo;
	private String model;
	private int qtt;
	private String registdate;
	private String sellername;
	public String getBrokenNo() {
		return brokenNo;
	}
	public void setBrokenNo(String brokenNo) {
		this.brokenNo = brokenNo;
	}
	public String getGoodNo() {
		return goodNo;
	}
	public void setGoodNo(String goodNo) {
		this.goodNo = goodNo;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getQtt() {
		return qtt;
	}
	public void setQtt(int qtt) {
		this.qtt = qtt;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	@Override
	public String toString() {
		return "brokenDTO [brokenNo=" + brokenNo + ", goodNo=" + goodNo + ", model=" + model + ", qtt=" + qtt
				+ ", registdate=" + registdate + ", sellername=" + sellername + "]";
	}
	
	
	
	
}
