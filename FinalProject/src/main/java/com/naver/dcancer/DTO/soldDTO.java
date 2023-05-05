package com.naver.dcancer.DTO;

import java.text.DecimalFormat;

import lombok.ToString;

@ToString
public class soldDTO {
	private String campname;
	private int sum;
	private String sumStr;
	private int sellNo;
	private int avg;
	private String avgStr;
	private String startDate;
	private String endDate;
	
	DecimalFormat price = new DecimalFormat("###,###");

	public String getCampname() {
		return campname;
	}

	public void setCampname(String campname) {
		this.campname = campname;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
		sumStr = price.format(sum);
	}

	public String getSumStr() {
		return sumStr;
	}

	public void setSumStr(String sumStr) {
		this.sumStr = sumStr;
		sum = Integer.parseInt( sumStr.replaceAll(",", "") );
	}

	public int getSellNo() {
		return sellNo;
	}

	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
		avgStr = price.format(avg); 
	}

	public String getAvgStr() {
		return avgStr;
	}

	public void setAvgStr(String avgStr) {
		this.avgStr = avgStr;
		avg=Integer.parseInt(avgStr.replaceAll(",", ""));
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	
}
