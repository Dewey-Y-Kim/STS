package com.naver.dcancer;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AjaxRestController {
	@GetMapping("ajaxRestObject")
	public AjaxDTO Ajax(int no, String title, String content) {
		AjaxDTO dto = new AjaxDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setName("잠탱");
		System.out.println("[ajaxObject]"+dto.toString());
		return dto;
	}
		
	@PostMapping("ajaxRestList")
	public List<AjaxDTO> ajaxList(int num, String name,String tel) {
		List<AjaxDTO> list = new ArrayList<AjaxDTO>();
		String[] contents = {"이거 해봐야징","되나?","될거야","아마도","뭐가문제냐;","언젠간 되겠지"};
		String[] titles = {"계획","테스팅","믿음","불안","분노","체념"};
		String[] names = {"야심", "시도","처음","중간","중간2","끝"};
		for(int i=0;i<names.length; i++) {
			list.add(new AjaxDTO(i+1,titles[i],contents[i],names[i]));
		}
		System.out.println(list.size());
		System.out.println("num="+num+"\tname:"+name+"\ttel:"+tel);
		return list;
	}
}
