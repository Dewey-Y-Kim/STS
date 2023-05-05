package com.naver.dcancer.DTO;

import java.text.DecimalFormat;

import lombok.ToString;

@ToString
public class promiseDTO {
	//이름 전화번호 판매제품 가격
	private String customNo;
	private String name;
	private String tel;
	private String sellNo;
	private String selldate;
	private String goodno;
	private String model;
	private String qtt;
	private String realprice;
	private String realpriceStr;
	private String price; // 총가격
	private String priceStr;
	
	DecimalFormat form = new DecimalFormat("###,###"); 
	
	public String getCustomNo() {
		return customNo;
	}
	public void setCustomNo(String customNo) {
		this.customNo = customNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSellNo() {
		return sellNo;
	}
	public void setSellNo(String sellNo) {
		this.sellNo = sellNo;
	}
	public String getSelldate() {
		return selldate;
	}
	public void setSelldate(String selldate) {
		this.selldate = selldate;
	}
	public String getGoodno() {
		return goodno;
	}
	public void setGoodno(String goodno) {
		this.goodno = goodno;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getQtt() {
		return qtt;
	}
	public void setQtt(String qtt) {
		this.qtt = qtt;
	}
	public String getRealprice() {
		return realprice;
	}
	public void setRealprice(String realprice) {
		this.realprice = realprice;
		realpriceStr = form.format(Integer.parseInt(realprice));
		System.out.println(realpriceStr);
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
		priceStr = form.format(Integer.parseInt(price)); 
		System.out.println("[priceStr]:"+priceStr);
	}
	public String getPriceStr() {
		return priceStr;
	}
	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
		realprice=priceStr.replaceAll(",","");
	}
	public String getRealpriceStr() {
		return realpriceStr;
	}
	public void setRealpriceStr(String realpriceStr) {
		this.realpriceStr = realpriceStr;
		realprice = realpriceStr.replaceAll(",", ""); 
	}
	
	
}
