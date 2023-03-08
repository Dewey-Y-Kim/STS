package com.naver.dcancer.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dao.BoardDAO;
import com.naver.dcancer.dao.PagingVO;
import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.service.BoardService;
// Controller : veiw 언어 사용 불가-jsp생성 및 구현/ RestController : view 언어 사용 가능, 반환형 String = 컨텐츠
@RestController
@RequestMapping("board")
public class Boardcontroller {
	@Autowired
	BoardService service;
	@GetMapping("/list")
	public ModelAndView boardlist(PagingVO vo) {
		//db 조회
		//total record 
		vo.setTotalRec(service.boardCnt());
		System.out.println(vo.toString());
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",service.pageSelect(vo));
		mav.setViewName("/board/list");
		mav.addObject("vo",vo);
		return mav;
	}
	
	@GetMapping("/write")
	public ModelAndView boardwrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/write");
		return mav;
	}
	@PostMapping("/writeOk")
	public ResponseEntity<String>  boardwriteOk(BoardDTO dto,HttpServletRequest req) {
		
		dto.setId((String)req.getSession().getAttribute("logId")); //logId 구하기
		dto.setIp((String)req.getRemoteAddr());
		String htmltag="<script>";
		try { // RestController : 
		int result = service.boardInsert(dto);
		htmltag+="location.href='list';";
		} catch(Exception e) {
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
}
