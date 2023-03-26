package com.naver.dcancer.Service;

import org.springframework.stereotype.Service;

import com.naver.dcancer.DTO.ImgDTO;

@Service
public interface ImgService {
	public ImgDTO fileName(ImgDTO dto);
}
