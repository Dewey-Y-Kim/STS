package com.naver.dcancer.DAO;

import com.naver.dcancer.DTO.ImgDTO;

public class ImgDAO {
	public ImgDTO fileName(ImgDTO dto) {
		String url = dto.getImgUrl();
		int slash = url.lastIndexOf("/");
		int point = url.lastIndexOf(".");
		dto.setExt(url.substring(point));
		dto.setPath(url.substring(0,slash)+1);
		dto.setPrifix(url.substring(slash+1, point));
		System.out.println(dto.toString());
		return dto;
	}
}
