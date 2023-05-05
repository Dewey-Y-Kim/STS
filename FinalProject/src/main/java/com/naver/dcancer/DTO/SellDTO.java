package com.naver.dcancer.DTO;

import java.text.DecimalFormat;

import lombok.ToString;

@ToString
public class SellDTO {
	private String customNo;
	private String sellNo; //동시 판매내역 idx
	private String SellDate;
	private String promiseDate;
	private int qtt;
	private String empNo;
	private String ename;
	private String sellStatus; //0 : 판매완료  1: 출고예정 2:반품
	private String goodNo; //상품고유번호
	private String code; // 판매매장
	private int realPrice; //판매가
	private String model; //모델명
	private int optResult; // 검안결과 저장여부 0: 등록 x 1:검안완료
	private String realpriceStr;
	private String totalStr;
	
	DecimalFormat form = new DecimalFormat("###,###");
	
	public String getCustomNo() {
		return customNo;
	}
	public void setCustomNo(String customNo) {
		this.customNo = customNo;
	}
	public String getSellNo() {
		return sellNo;
	}
	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}
	public String getSellDate() {
		return SellDate;
	}
	public void setSellDate(String sellDate) {
		SellDate = sellDate;
	}
	public String getPromiseDate() {
		return promiseDate;
	}
	public void setPromiseDate(String promiseDate) {
		this.promiseDate = promiseDate;
		sellStatus="1";
	}
	public int getQtt() {
		return qtt;
	}
	public void setQtt(int qtt) {
		this.qtt = qtt;
		totalStr = form.format(qtt*realPrice);
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getSellStatus() {
		return sellStatus;
	}
	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}
	public String getGoodNo() {
		return goodNo;
	}
	public void setGoodNo(String goodNo) {
		this.goodNo = goodNo;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getRealPrice() {
		return realPrice;
	}
	public void setRealPrice(int realPrice) {
		this.realPrice = realPrice;
		realpriceStr = form.format(realPrice);
		totalStr = form.format(qtt*realPrice);
	}
	public String getRealPriceStr() {
		return realpriceStr;
	}
	public void setRealPriceStr(String realpriceStr) {
		this.realpriceStr = realpriceStr;
		realPrice = Integer.parseInt(realpriceStr);
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getOptResult() {
		return optResult;
	}
	public void setOptResult(int optResult) {
		this.optResult = optResult;
	}
	public int getTotalprice() {
		return qtt*realPrice;
	}
	public String getRealpriceStr() {
		return realpriceStr;
	}
	public void setRealpriceStr(String realpriceStr) {
		this.realpriceStr = realpriceStr;
	}
	public String getTotalStr() {
		return form.format(qtt*realPrice);
	}
}
