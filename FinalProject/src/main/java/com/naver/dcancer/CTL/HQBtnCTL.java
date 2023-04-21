package com.naver.dcancer.CTL;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.SellerDTO;
import com.naver.dcancer.DTO.goodDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.Service.HQService;

@Controller
public class HQBtnCTL {
	@Autowired
	HQService service;
	@GetMapping("HQ/noticelist")
	public ModelAndView noticelist(HttpSession session,pagingVO vo) {
		ModelAndView mav = new ModelAndView();
		List<NoticeDTO> list = service.noticeList(vo);
		mav.addObject("noticelist", list);
		mav.setViewName("HQ/noticelist");
		vo.setTotalLine(service.pagingData("noticebbs","no"));
		mav.addObject("vo",vo);
		return mav;
	}
	@GetMapping("HQ/Sellerlist")
	public ModelAndView sellerList(HttpSession session,pagingVO vo) {
		ModelAndView mav = new ModelAndView();
		List<SellerDTO> list = service.sellerList(vo);
		System.out.println(((SellerDTO)list.get(1)).toString());
		mav.addObject("sellerlist", list);
		mav.setViewName("HQ/Sellerlist");
		vo.setTotalLine(service.pagingData("sellerInfo","sellercode"));
		mav.addObject("vo",vo);
		mav.addObject("auth",session.getAttribute("auth"));
		System.out.println(session.getAttribute("auth"));
		return mav;
	}
	@GetMapping("HQ/Brandlist")
	public ModelAndView brandSector(HttpSession session, pagingVO vo) {
		ModelAndView mav = new ModelAndView();
		List<SellerDTO> sell=service.sellerInfo();
		mav.addObject("seller",sell);
		List<goodDTO> list = service.goodlist(vo);
		mav.addObject("goodlist",list);
		mav.addObject("auth",session.getAttribute("auth"));
		mav.addObject("vo", vo);
		mav.setViewName("HQ/Brandlist");
		return mav;
	}
	
	
	
}
