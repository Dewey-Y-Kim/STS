package com.naver.dcancer.CTL.HQ;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.naver.dcancer.DTO.LoginDTO;
import com.naver.dcancer.DTO.NoticeDTO;
import com.naver.dcancer.DTO.pagingVO;
import com.naver.dcancer.DTO.promiseDTO;
import com.naver.dcancer.DTO.soldDTO;
import com.naver.dcancer.Service.CampService;
import com.naver.dcancer.Service.HQService;
import com.naver.dcancer.Service.LoginService;

@Controller
public class LoginCTL {
	@Autowired
	LoginService service;
	@Autowired
	CampService camp;
	@Autowired
	HQService hq;
	
	@PostMapping("LoginOk")
	public ModelAndView Login(int empno, String pwd,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		LoginDTO result = service.login(empno, pwd);
		System.out.println(result.toString());
		if(result!=null) {
			mav.setViewName("LoginResult");
			session.setAttribute("empno", empno);
			session.setAttribute("campName", result.getCampName());
			session.setAttribute("ename",result.getEname());
			session.setAttribute("code", result.getCode());
			session.setAttribute("auth", result.getAuth());
			session.setAttribute("LoginStatus", 'Y');
			System.out.println(result.toString());
			switch((Integer)session.getAttribute("auth")) {
			case 2 : session.setAttribute("codeData", "Camp");mav.addObject("codeData","Camp");break;
			case 3: case 4: session.setAttribute("codeData", "HQ");mav.addObject("codeData","HQ");break;
			}
			System.out.println(session.getAttribute("empno"));
		}
		
		return mav;
	}
	@GetMapping("/{path}/main")
	public ModelAndView Frm(@PathVariable("path")String path,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("codeData",session.getAttribute("codeData"));
		mav.setViewName(path+"/main");
		
		//graph data Only sum
		LocalDate now= LocalDate.now();
		DateTimeFormatter form = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String date=now.format(form);
		List<soldDTO> list = camp.soldDay(date);
		JsonArray jsonArr = new JsonArray();
		JsonObject sum = new JsonObject();
		for (soldDTO dto:list) {
			JsonObject json = new JsonObject();
			json.addProperty("camp", dto.getCampname());
			json.addProperty("sum", dto.getSum());
			jsonArr.add(json);
		}
		
		List<promiseDTO> promise;
		try {
			int code=Integer.parseInt( (String)session.getAttribute("code") );
			if(code>0) {
				promise=camp.promiseToday(code, date);
				mav.addObject("promise",promise);
				System.out.println(code+"///"+date);
				System.out.println(promise);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		// noticeList
		pagingVO vo = new pagingVO();
		List<NoticeDTO> notice =  hq.noticeList(vo);
		mav.addObject("notice",notice);
		mav.addObject("date",date);
		mav.addObject("list",list);
		mav.addObject("json",jsonArr.toString());
		
		return mav;
	}
	
	@PostMapping(value={"HQ/noticeContent","Camp/noticeContent"})
	@ResponseBody
	public String noticeContent(@RequestParam("no") String no) {
		String content=service.getNoticeContent(no);
		hq.hitupdate(Integer.parseInt(no), "noticeBBS");
		System.out.println(content);
		return content;
	}
}