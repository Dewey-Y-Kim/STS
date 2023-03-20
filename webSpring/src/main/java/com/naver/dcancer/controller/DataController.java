package com.naver.dcancer.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
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
	private DataSourceTransactionManager transMNG;
	
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
		DefaultTransactionDefinition def= new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus state = transMNG.getTransaction(def);
		try {
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
								String newfilename=uploadName+" ("+renameNum+")."+uploadExt;
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
			
			//try {
			int result=service.dataInsert(dto);
			for (DataFileDTO fDTO: list) {
				fDTO.setNo(dto.getNo());
			}
			int fileResult = service.datafileInsert(list);
			transMNG.commit(state);
			
			mav.setViewName("redirect:list");
			//} catch(Exception e) {
			/*
			 * for(DataFileDTO fdto : list) {
			 
				fileDel(path,fdto.getFilename());
			service.dataDelete(dto.getNo());
			service.dataFileDelete(dto.getNo());
			
			e.printStackTrace();
			}
		}
			 */
		}catch(Exception e) {
			transMNG.rollback(state);
			mav.addObject("msg","글 올리기가 실패하였습니다.");
			mav.setViewName("data/result");
		}
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
	@GetMapping("data/edit/{num}")
	public ModelAndView dataEdit(@PathVariable("num")int no,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		DataDTO dto = service.editRec(no, (String)session.getAttribute("logId"));
		
		if(dto!=null) {
			List<DataFileDTO> list= service.viewFiles(no);
			mav.addObject("dto", dto);
			mav.addObject("fileDto",list);
			mav.setViewName("data/editFrm");
			mav.addObject("fileCnt",list.size());
		}else {
			mav.setViewName("redirect:data/list"+no);
		}
		return mav;
	}
	@PostMapping("/data/editOk")
	public ModelAndView dataEditOk(DataDTO dto,HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String path = session.getServletContext().getRealPath("/Upload");
		dto.setId((String)session.getAttribute("logId"));
		// DB파일과 삭제 정리- 남은파일
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transMNG.getTransaction(def);
		List<String> finalFileList = service.datafileList(dto.getNo()); //새로 업로드
		
		// 새로 파일 업로드
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)request;
		List<MultipartFile> mfList=mr.getFiles("filename");
		List<String> newFileList = new ArrayList<String>(); // 새로 업로드된 파일을 저장할 컬랙션
		if(mfList!=null) {
			//새로 업로드한 MultpartFile갯수 만큼 반복
			for(MultipartFile mf : mfList) {
				String fileName=mf.getOriginalFilename();
				if(fileName!=null && !fileName.equals("")) {
					File f= new File(path,fileName);
					if(f.exists()) {
						
						for(int fileNum=1;; fileNum++) {
							int point = fileName.lastIndexOf(".");
							String filenameNoExt = fileName.substring(0, point);
							String ext = fileName.substring(point+1);
							
							String newFile = filenameNoExt+ " ("+fileNum+")."+ext;
							File file = new File(path, newFile);
							if(!file.exists()) {
								fileName=newFile;
								break;
							}
						}
					}
					try {
						mf.transferTo(new File(path, fileName));
					}catch(Exception e) {
						e.printStackTrace();
					}
					newFileList.add(fileName);
				}
			}
		}
		// finalFileList dto.getDel() newFileList
		try {
		/* 정상구현
		 * 1.원글 업데이트
		 * 2. db - 삭제파일 + 새로 업데이트된파일 레코드 업데이트
		 * 3. 삭제 파일 제거
		 * 4. list로 이동
		*/
			int result=service.dataEditUpdate(dto);
			
			if(dto.getDel()!=null) {
				for(int i=0;i<dto.getDel().size();i++) {
					finalFileList.remove(dto.getDel().get(i));
				}
			}
			//DB에 새로 uploadfile 추가
			finalFileList.addAll(newFileList);
			System.out.println("[editOk]addAll"+finalFileList.toString());
			service.dataFileDelete(dto.getNo());
			List<DataFileDTO> fileDTOList = new ArrayList<DataFileDTO>();
			for(String fname : finalFileList) {
				DataFileDTO fDTO = new DataFileDTO();
				fDTO.setFilename(fname);
				fDTO.setNo(dto.getNo());
				fileDTOList.add(fDTO);
			}
			
			System.out.println("fdl"+fileDTOList.size());
			int fResult= service.datafileInsert(fileDTOList);
			if(dto.getDel()!=null) {
				for(int i=0; i<dto.getDel().size();i++) {
					fileDel(path,dto.getDel().get(i));
				}
			}
			mav.setViewName("redirect:view/"+dto.getNo());
		transMNG.commit(status);	
		}catch(Exception e) {
		// 실패
		/*
		 * 1. 새로 업로드된 파일 삭제
		 * 2. 수정페이지로
		 */
			/*
			 * for(int i=0;i<newFileList.size();i++) {
			 * 	fileDel(path,newFileList.get(i));
			 * }
			 */
			mav.setViewName("data/result");
			transMNG.rollback(status);
		}
		return mav;
	}
	@GetMapping("data/del/{no}")
	public ModelAndView del(@PathVariable int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<String> fileNameList= service.datafileList(no);
				
		String path=session.getServletContext().getRealPath("/Upload");
		service.dataFileDelete(no);
		
		int result = service.dataDel(no, (String)session.getAttribute("logId"));
		if(result>0) {
			for(String filename:fileNameList) {
				fileDel(path, filename);
			}
			mav.setViewName("redirect:/data/list");
		}else {
			mav.setViewName("redirect:/data/view/"+no);
		}
		return mav;
	}
}
