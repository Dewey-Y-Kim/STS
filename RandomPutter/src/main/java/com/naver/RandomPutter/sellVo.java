package com.naver.RandomPutter;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class sellVo {
	private int sellno;

	private int empno;
	private String code;
	
	private int qtt;
	private int goodno;
	private int realprice;
	private String date;
	public sellVo(int sellno, int empno, String code, int qtt, int goodno, int realprice) {
	}
}
