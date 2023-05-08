package com.naver.RandomPutter;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class service {
	@Autowired
	dao dao;
	public List<itemDTO> itemList(int no) {
		// 특정분류의 아이템 리스트를 가져옴
		return dao.itemList(no);
	}
	public List<empDTO> empList(){
		//판매자데이터 리턴
		return dao.empList();
	}
	public int lastNo() {
		return dao.lastNo();
	}
	public int selled(List<sellVo> list) {
		return dao.selled(list);
	}
	public int selledList(List<sellVo> list) {
		return dao.selledList(list);
	}
	public int selledData(List<sellVo> list) {
		return dao.selledData(list);
	}
	public int[] getCustomNo() {
		return dao.getCustomNo();
	}
	public int[] getSellNo(String date) {
		return dao.getSellNo(date);
	}
	public int setSelldate(@Param("no")int customno, @Param("sellno")int sellno, String date ) {
		return dao.setSelldate(customno, sellno, date);
	}
}
