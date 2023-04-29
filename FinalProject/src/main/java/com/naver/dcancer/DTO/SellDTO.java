package com.naver.dcancer.DTO;

import lombok.Data;

@Data
public class SellDTO {
	String customNo;
	String sellNo; //동시 판매내역 idx
	String SellDate;
	String PromiseDate;
	int qtt;
	String empNo;
	String ename;
	String sellStatus; //0 : 판매완료  1: 출고예정 2:반품
	String goodNo; //상품고유번호
	String code; // 판매매장
	int realPrice; //판매가
	String model; //모델명
}
