package com.naver.dcancer.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.DataDTO;
import com.naver.dcancer.dto.DataFileDTO;
import com.naver.dcancer.service.DataService;

@Controller
public class DataController {
	@Inject
	DataService service;
	@RequestMapping("/data/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		List<DataDTO> list= service.datalist();
		mav.addObject("list",list);
		mav.setViewName("data/list");
		return mav;
	}
	
	@RequestMapping("/data/dataWrite")
	public ModelAndView writefrm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("data/write");
		return mav;
				
	}
	@PostMapping("/data/dataWriteOk")
	public ModelAndView writeOk(HttpServletRequest request, DataDTO dto) {
		ModelAndView mav=new ModelAndView();
		dto.setId((String)request.getSession().getAttribute("logId"));
		
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest)request;
		List<MultipartFile> files = mhsr.getFiles("file");
		//Path
		dto.setIp(request.getRemoteAddr());
		String path = request.getSession().getServletContext().getRealPath("/Upload");
		List<DataFileDTO> list = new ArrayList();
		if(files != null) {
			for(int i=0;i<files.size();i++) {
			//for(MultipartFile file:files) {
			MultipartFile file = files.get(i);
			String originalFN=file.getOriginalFilename();
			System.out.println(originalFN);
			if(originalFN !=null && originalFN != "") {
				File upload= new File(path,originalFN);
				if(upload.exists()) {
					int point=originalFN.lastIndexOf(".");
					String uploadName=originalFN.substring(0, point);
					String uploadExt=originalFN.substring(point+1);
					
					for(int renameNum=1;;renameNum++) {
						//파일명 확장자 나누기
						String newfilename=uploadName+" ("+renameNum+")"+uploadExt;
						upload = new File(path, newfilename);
						if(!upload.exists()) {
							originalFN = newfilename;
							break; // 
						}
					}
				
				}
				try {
					file.transferTo(new File(path,originalFN));
				}catch (Exception e) {
						e.printStackTrace();
				}
				DataFileDTO dfDTO = new DataFileDTO();
				dfDTO.setFilename(originalFN);
				list.add(dfDTO);
				}
			}	
		}
		
		try {
			int result=service.dataInsert(dto);
			for (DataFileDTO fDTO: list) {
				fDTO.setNo(dto.getNo());
			}
			System.out.println("chk"+list.toString());
			int fileResult = service.datafileInsert(list);
			
			mav.setViewName("data/list");
			
			System.out.println(result+"////"+fileResult);
		} catch(Exception e) {
			for(DataFileDTO fdto : list) {
				fileDel(path,fdto.getFilename());
			service.dataDelete(dto.getNo());
			service.dataFileDelete(dto.getNo());
			mav.addObject("msg","글 올리기가 실패하였습니다.");
			mav.setViewName("data/result");
			e.printStackTrace();
			}
		}
		System.out.println(mav.toString());
		return mav;
	}
	public void fileDel(String path, String name) {
		File f= new File(path, name);
		f.delete();
	}
	
	@GetMapping("data/view/{no}")
	public ModelAndView dataView(@PathVariable("no") int no) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.view(no));
		mav.addObject("list",service.viewFiles(no));
		mav.setViewName("data/view");
		return mav;
		
	}
}
