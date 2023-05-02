package com.naver.dcancer.DTO;

import org.springframework.lang.Nullable;

import lombok.Data;

public class OptDTO {
	private double RSph;
	private double RCyl;
	private int RAxis;
	private double RAdd;
	private double LSph;
	private double LCyl;
	private int LAxis;
	private double LAdd;
	private double pd;
	private int customNo;
	private String registDate;
	private String memo;
	//selldata Update
	private String sellNo;
	
	private String promiseDate;
	private String sellStatus="0";
	
	public double getRSph() {
		return RSph;
	}
	public void setRSph(double rSph) {
		RSph = rSph;
	}
	public double getRCyl() {
		return RCyl;
	}
	public void setRCyl(double rCyl) {
		RCyl = rCyl;
	}
	public int getRAxis() {
		return RAxis;
	}
	public void setRAxis(int rAxis) {
		RAxis = rAxis;
	}
	public double getRAdd() {
		return RAdd;
	}
	public void setRAdd(double rAdd) {
		RAdd = rAdd;
	}
	public double getLSph() {
		return LSph;
	}
	public void setLSph(double lSph) {
		LSph = lSph;
	}
	public double getLCyl() {
		return LCyl;
	}
	public void setLCyl(double lCyl) {
		LCyl = lCyl;
	}
	public int getLAxis() {
		return LAxis;
	}
	public void setLAxis(int lAxis) {
		LAxis = lAxis;
	}
	public double getLAdd() {
		return LAdd;
	}
	public void setLAdd(double lAdd) {
		LAdd = lAdd;
	}
	public double getPd() {
		return pd;
	}
	public void setPd(double pd) {
		this.pd = pd;
	}
	public int getCustomNo() {
		return customNo;
	}
	public void setCustomNo(int customNo) {
		this.customNo = customNo;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getSellNo() {
		return sellNo;
	}
	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}
	public String getPromiseDate() {
		return promiseDate;
	}
	public void setPromiseDate(String promiseDate) {
		this.promiseDate = promiseDate;
		sellStatus="1";
	}
	public String getSellStatus() {
		return sellStatus;
	}
	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}
	
	
}
