package com.naver.dcancer.webSocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OutputMSGVO {
	private String from;
	private String to;
	private String text;
	private String time;
}
