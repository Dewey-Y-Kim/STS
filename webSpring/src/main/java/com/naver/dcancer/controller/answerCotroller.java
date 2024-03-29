package com.naver.dcancer.controller;

import java.util.List;

import javax.inject.Inject;
import javax.management.ConstructorParameters;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.AnswerDTO;
import com.naver.dcancer.service.AnsService;

@RestController
@RequestMapping("/answer")
public class answerCotroller {
	@Autowired
	AnsService service;
	@Inject
	DataSourceTransactionManager TransActionManager;
	@GetMapping("/list")
	public ModelAndView ansList() {
		ModelAndView mav = new ModelAndView();
		//레코드 선택
		List<AnswerDTO> list = service.answerList();
		mav.addObject("list",list);
		//총 레코드 수
		int totalRec=service.totalRec();
		mav.addObject("totalRec", totalRec);
		mav.setViewName("answer/list");
		return mav;
	}
	@GetMapping("/write")
	public ModelAndView ansWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("answer/write");
		return mav;
	}
	@PostMapping("/writeOk")
	public ResponseEntity<String> ansWriteOk(AnswerDTO dto,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)session.getAttribute("logId"));
		dto.setIp(request.getRemoteAddr());
		ResponseEntity<String> entity=null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		try {
		service.answerInsert(dto);
		String body="<script>location.href='/dcancer/answer/list';</script>";
		entity = new ResponseEntity<String>(body,headers,HttpStatus.OK);
				
		}catch(Exception e) {
			e.printStackTrace();
			String body ="<Script>";
			body +="alert('글 등록 실패하였습니다.');";
			body +="history.back;";
			body +="</script>";
			entity= new ResponseEntity<String>(body,headers,HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	@GetMapping("View")
	public ModelAndView ansView(int no, AnswerDTO dto) {
		ModelAndView mav = new ModelAndView();
		//조회수 증가
		service.addhit(no);
		//해당글 선택
		mav.setViewName("answer/view");
		dto=service.ansView(no);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("ansReplyWrite/{no}")
	public ModelAndView ansReply(@PathVariable("no") int no) { 
		ModelAndView mav = new ModelAndView();
		// mav.addObject("no",no);
		mav.setViewName("answer/reply");
		return mav;
	}
	//db등록
	@PostMapping("replyOk") 
	public ResponseEntity<String> ansReplyInsert(AnswerDTO dto,HttpServletRequest request) {
		DefaultTransactionDefinition define= new DefaultTransactionDefinition();
		/*
		 * Propagation_REQUIRED 트렌젝션 있으면 그상태로 실행, 없ㄷ으면 새로운 트랜젝션 생성 실행
		 */
		define.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus stat= TransActionManager.getTransaction(define);
		ResponseEntity<String> entity=null;
		HttpHeaders headers= new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("logId"));
		
		try {
			//원 글 refno, lvl step 선택
			AnswerDTO originalDTO = service.replydataselect(dto.getNo());
			//원글과 같은 refno 가진 글의 원글 step보다 크면 1씩 증가
			int cnt = service.replyStepUp(originalDTO);
			System.out.println("[ansReplyInsert] cnt : "+cnt);
			//답글 등록
			dto.setRefno(originalDTO.getRefno());
			dto.setLv(originalDTO.getLv());
			dto.setStep(originalDTO.getStep());
			int result=service.replyInsert(dto);
			System.out.println("[ansReplyInsert] result : "+result);
			// list로
			String tag="<script>location.href='/dcancer/answer/list'</script>";
			entity= new ResponseEntity<String>(tag,headers,HttpStatus.OK);
			
			TransActionManager.commit(stat);
		} catch(Exception e) {
			e.printStackTrace();
			// rollback
			String tag="<script>alert('답글등록에 실패하였습니다.');history.back();</script>";
			entity= new ResponseEntity<String>(tag,headers,HttpStatus.BAD_REQUEST);
			
			TransActionManager.rollback(stat);
		}
		return entity;
	}
	@GetMapping("replyUpdate/{no}")
	public ModelAndView replyUpdate(@PathVariable int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",service.replySelect(no));
		mav.setViewName("answer/edit");
		return mav;
	}
	@PostMapping("replyUpdateOk")
	public ResponseEntity<String> replyUpdateOk(int no){
		ResponseEntity<String> entity = null;
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type","text/html;charset=utf-8");
		int result= service.replyUpdateOk(no);
		String tag ="<script>";
		if (result>0) {
			tag+="location.href='/answer/list'";
			entity= new ResponseEntity<String>(tag,header,HttpStatus.OK);
		}else {
			tag+="alert('글 등록이 실패하였습니다.');history.back();";
			entity= new ResponseEntity<String>(tag,header,HttpStatus.BAD_REQUEST);
		}
		tag+="<script>";
		return entity;
	}
	@GetMapping("/replyDel/{no}")
	public ModelAndView replyDel(@PathVariable int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int lv= service.getLv(no);
		if(lv==0) {//delte 같은 refno 삭제
			int result=service.ansDel(no);
			if(result>0) {
				mav.setViewName("redirect:list");
			}
		}else { //내용 변경
			service.ansDelUp(no);
			mav.addObject("no",no);
			mav.setViewName("redirect:view");
		}
		return mav;
	}
	
}
