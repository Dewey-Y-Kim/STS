package com.naver.dcancer.DTO;

import lombok.Data;
@Data
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
	private String sellStatus;
}
