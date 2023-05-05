package com.naver.dcancer.DTO;

import java.text.DecimalFormat;

import lombok.ToString;

@ToString
public class goodDTO {
	private int goodno;
	private String Sellercode;
	private String classifyno;
	private String classifyname;
	private String model;
	private int buyprice;
	private int sellprice;
	private String Sellername;
	private String name;
	private int brandcode;
	private double sphStart;
	private double sphEnd;
	private double cylStart=0;
	private double cylEnd;
	private String buyStr;
	private String sellStr;
	
	DecimalFormat price = new DecimalFormat("###,###");
	
	public String getBuyStr() {
		return buyStr;
	}
	public void setBuyStr(String buyStr) {
		this.buyStr = buyStr;
		buyprice=Integer.parseInt(buyStr.replaceAll(",", ""));
	}
	public String getSellStr() {
		return sellStr;
	}
	public void setSellStr(String sellStr) {
		this.sellStr = sellStr;
		sellprice = Integer.parseInt(sellStr.replaceAll(",", ""));
	}
	public int getGoodno() {
		return goodno;
	}
	public void setGoodno(int goodno) {
		this.goodno = goodno;
	}
	public String getSellercode() {
		return Sellercode;
	}
	public void setSellercode(String sellercode) {
		Sellercode = sellercode;
	}
	public String getClassifyno() {
		return classifyno;
	}
	public void setClassifyno(String classifyno) {
		this.classifyno = classifyno;
		switch(Integer.valueOf(classifyno)) {
		case 1 : classifyname = "안경테";break;
		case 2 : classifyname = "렌즈";break;
		case 3 : classifyname = "CL";break;
		case 4 : classifyname = "기타";
		}
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(int buyprice) {
		this.buyprice = buyprice;
		buyStr= price.format(buyprice);
	}
	public int getSellprice() {
		return sellprice;
	}
	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
		sellStr = price.format(sellprice);
	}
	public String getClassifyname() {
		return classifyname;
	}
	public void setClassifyname(String classifyname) {
		this.classifyname = classifyname;
		if (classifyname.equals("안경테")){ 
			classifyno="1";
		} else if (classifyname.equals("렌즈")){ 
			classifyno="2";
		} else if(classifyname.equals("CL")){ 
			classifyno="3";
		}else if (classifyname.equals("기타")){ 
			classifyno="4";
		};
	}
	
	public String getSellername() {
		return Sellername;
	}
	public void setSellername(String sellername) {
		Sellername = sellername;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBrandcode() {
		return brandcode;
	}
	public void setBrandcode(int brandcode) {
		this.brandcode = brandcode;
	}
	public double getSphStart() {
		
		return sphStart;
	}
	public void setSphStart(double sphStart) {
		System.out.println("startin"+this.sphStart+"sph"+sphStart+"\t"+this.sphEnd+"\t"+sphEnd);
		if(sphStart*this.sphEnd>0) {
			this.sphEnd = sphEnd*(-1);
		} 
		this.sphStart = sphStart;
	}
	public double getSphEnd() {
		return sphEnd;
	}
	public void setSphEnd(double sphEnd) {
		System.out.println("endin"+sphStart+"\t"+this.sphEnd+"\t"+sphEnd);
		if(sphStart*this.sphEnd>0) {
			this.sphEnd = sphEnd*(-1);
		} else {
			this.sphEnd= sphEnd;
		}
	}
	public double getCylStart() {
		return cylStart;
	}
	public void setCylStart(double cylStart) {
		this.cylStart = cylStart;
	}
	public double getCylEnd() {
		return cylEnd;
	}
	public void setCylEnd(double cylEnd) {
		if(cylEnd>0) {
			this.cylEnd = cylEnd*-1;
		}else {
			this.cylEnd = cylEnd;
		}
	}
	
}
