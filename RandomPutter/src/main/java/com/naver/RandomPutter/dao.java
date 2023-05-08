package com.naver.RandomPutter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface dao {
	public List<itemDTO> itemList(@Param("no")int no);
	public List<empDTO> empList();
	public int lastNo();
	public int selled(List<sellVo> list);
	public int selledList(List<sellVo> list);
	public int selledData(List<sellVo> list);
	public int[] getCustomNo();
	public int[] getSellNo(@Param("date")String date);
	public int setSelldate(@Param("no")int customno, @Param("sellno")int sellno, @Param("date")String date);
}
