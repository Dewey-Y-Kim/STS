package com.naver.dcancer.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class noticeDTO {
	private String no;
	private String title;
	private String writer;
	private String writeDate;
	private String content;
}
