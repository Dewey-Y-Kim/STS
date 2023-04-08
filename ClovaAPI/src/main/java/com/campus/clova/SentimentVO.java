package com.campus.clova;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //== getter setter equals() toString()
@NoArgsConstructor //== public SentimentVo()
@AllArgsConstructor //==public SentimentVO(String content, int length ....,double neutral
public class SentimentVO {
	private String content;
    private int offset;
    private int length;
    private String sentiment;
    private double negative;
    private double positive;
    private double neutral;
}
