package com.naver.dcancer.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.dto.PagingVO;
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
		vo.setTotalRec(service.boardCnt(vo));
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",service.pageSelect(vo));
		mav.setViewName("/board/list");
		mav.addObject("vo",vo);
		System.out.println(vo.toString());
		System.out.println(vo.sTostring());
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
	@GetMapping("/contentView")
	public ModelAndView contentView(BoardDTO dto,PagingVO vo) {
		service.hitCount(dto.getNo());
		ModelAndView mav = new ModelAndView();
		dto=service.contentSelect(dto.getNo());
		mav.setViewName("board/contentView");
		mav.addObject("dto",dto);
		mav.addObject("vo",vo);
		return mav;
	}
	@GetMapping("/edit")
	public ModelAndView contentEdit(int no,PagingVO vo) {
		ModelAndView mav=new ModelAndView();
		BoardDTO dto= service.editSelect(no);
		// String title = dto.getTitle();
		// title.replaceAll("\"","&quot;");
		// title.replaceAll("\'","&sbquo;");
		// dto.setTitle(title);
		mav.addObject("dto",dto);
		mav.addObject("vo",vo);
		mav.setViewName("board/BoardEdit");
		
		return mav;
	}
	@PostMapping("/EditOk")
	public ResponseEntity<String> contentOk(BoardDTO dto,PagingVO vo,HttpSession session) {
		dto.setId((String)session.getAttribute("logId"));
		String htmltag="<script>";
		try {
		int result=service.contentUpdate(dto);
		
		
		htmltag+="location.href='contentView?no="+dto.getNo()+"&nowPage="+vo.getNowPage();
		if(vo.getSearchWord()!=null) {
			htmltag+="&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord();
		}
		htmltag+="';";
		
		}catch(Exception e) {
			e.printStackTrace();
			htmltag += "alert('글이 등록되지 않았습니다.');";
			htmltag += "history.back();";
		}
		htmltag+="</script>";
		System.out.println(dto.toString());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		ResponseEntity<String> entity= new ResponseEntity<String>(htmltag, headers, HttpStatus.OK);
		return entity;
	}
	@GetMapping("/delete")
	public ResponseEntity<String> delContent(int no,PagingVO vo,HttpSession session){
		BoardDTO dto = new BoardDTO();
		String logid=(String)session.getAttribute("logId");
		String html="<script>";
		html+="location.href='list?nowPage="+vo.getNowPage();
		if(vo.getSearchWord()!=null) {
			html+="&searchKey="+vo.getSearchKey()+"&searchWord"+vo.getSearchWord();
		}
		html+="'";
		try {
			service.delRecord(no,logid);
		}catch(Exception e) {
			e.printStackTrace();
			html+="alert('글이 등록되지 않았습니다.');";
			html+="history.back;";
		}
		html+="</script>";
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		header.add("Context-type", "text/html; charset=Utf-8");
		ResponseEntity<String> entity= new ResponseEntity<String>(html,header,HttpStatus.OK);
		return entity;
	}
	@GetMapping("/boardDel")
	public ModelAndView BoardDel(BoardDTO dto,PagingVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		dto.setId((String)session.getAttribute("logId"));
		int result=service.boardDel(dto);
		mav.addObject("nowPage",vo.getNowPage());
		if(vo.getSearchWord()!=null) {
			mav.addObject("searchKey",vo.getSearchKey());
			mav.addObject("searchWord",vo.getSearchWord());
		}
		if(result>0) {
			mav.setViewName("redirect:list");
		}else {
			mav.setViewName("redirect:boardView");
		}
		return mav;
	}
}
