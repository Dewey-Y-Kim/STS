package com.campus.clova;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	public static String fileUpload(String path, MultipartFile file) {
		String org = file.getOriginalFilename();
		try {
			//중복검사+리네임
			file.transferTo(new File(path,org));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return org;
	}
}
