package com.naver.RandomPutter;

import lombok.Data;

@Data
public class itemDTO {
	int goodNo; //상품번호     
	String classifyNo;  //분류번호 1 frm 2 lens 3 cl 4 etc
	int sellprice; //판매가   
	int BRANDCODE;  //브랜드코드 원래는 제품바코드가 되었을 영역   
}
