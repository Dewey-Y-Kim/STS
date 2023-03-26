package com.naver.dcancer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.AbstractTransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.dto.BoardDTO;
import com.naver.dcancer.service.TransActionService;

@Controller
public class TransActionController {
	@Inject
	TransActionService service;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@GetMapping("/transaction")
	public ModelAndView transActionTest(HttpSession session) {
		
		DefaultTransactionDefinition def= new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
		BoardDTO dto1= new BoardDTO();
		dto1.setTitle("title1");
		dto1.setContent("content1");
		dto1.setId((String)session.getAttribute("logId"));
		dto1.setIp("123.123.123.123");
		BoardDTO dto2= new BoardDTO();
		dto2.setTitle("title");
		dto2.setContent("content2");
		dto2.setId((String)session.getAttribute("logId")+"jj");
		dto2.setIp("123.123.123.321");
		service.transBoardInsert(dto1);
		System.out.println("dto1 clear");
		service.transBoardInsert(dto2);
		System.out.println("dto2 clear");
		transactionManager.commit(status);
		} catch(Exception e) {
			transactionManager.rollback(status); //
		}
		ModelAndView mav= new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
}
