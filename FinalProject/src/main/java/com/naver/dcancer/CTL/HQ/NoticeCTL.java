package com.naver.dcancer.CTL.HQ;

import java.nio.charset.Charset;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.Service.HQService;

@RestController
public class NoticeCTL {
	@Autowired
	HQService service;
	
	@PostMapping(value="HQ/noticeinsert", produces="appication/text;charset=UTF-8")
	public ResponseEntity<String> noticeInsert(NoticeDTO dto,HttpSession session,pagingVO vo) {
		String respon = "";
		int empno = (Integer) session.getAttribute("empno");
		dto.setEmpno(empno);
		System.out.println(dto.toString());
		String htmltag="<script>";
		try {
			htmltag+="location.href='noticelist';";
			int resultnum=service.noticeInsert(dto);
		}catch(Exception e) {
			e.printStackTrace();
			htmltag += "alert('글이 등록되지 않았습니다.');";
			htmltag += "history.back();";
		}
		htmltag +="</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmltag,headers,HttpStatus.OK); 
		
	}
	@GetMapping("HQ/noticeView")
	public ModelAndView noticeView(HttpSession session,int no, pagingVO vo) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("HQ/noticeView");
		NoticeDTO dto=service.noticeView(no);
		int result =service.hitupdate(no, "noticeBBS");
		System.out.println(result);
		System.out.println("[noticeBBS]"+dto.toString());
		mav.addObject("dto", dto);
		mav.addObject("vo",vo);
		mav.addObject("empno",session.getAttribute("empno"));
		return mav;
	}
	@PostMapping("HQ/noticeEdit")
	@ResponseBody
	public ResponseEntity<String> noticeEdit(HttpSession session, NoticeDTO dto, pagingVO vo) {
		String htmltag="<script>";
		System.out.println("[noticeEdit]"+dto.toString());
		if(dto.getEmpno() == (Integer) session.getAttribute("empno")) {
			try {
			int result = service.noticeUpdate(dto);
			htmltag+="location.href='noticelist?nowpage="+vo.getNowPage()+"';";
			} catch (Exception e){
				htmltag += "alert('글이 수정되지 않았습니다.');";
				htmltag += "history.back();";
			}
		} else {
			htmltag += "alert('수정권한이 없습니다.');";
			htmltag += "history.back();";
		}
		
		htmltag +="</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmltag,headers,HttpStatus.OK);
	}
	@GetMapping("HQ/noticeDel")
	@ResponseBody
	public ResponseEntity<String> noticeDel(HttpSession session,int no, pagingVO vo){
		String tag= "<script>";
		try {
			service.noticeDelete(no);
			tag += "location.href='noticelist?nowPage="+vo.getNowPage()+"';";
		}catch (Exception e) {
			e.printStackTrace();
			tag += "history.back();";
		}
		tag+="</script>";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("content-type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(tag,headers,HttpStatus.OK);
	}
}
