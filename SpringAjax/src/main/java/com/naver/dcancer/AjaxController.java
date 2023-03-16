package com.naver.dcancer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {
	@RequestMapping("/ajaxStart")
	public String ajaxStart() {
		return "ajax/ajaxView";
	}
	//return Type : Sting - 한글 인식 produces="application/text;charset=UTF-8"
	@RequestMapping(value="ajaxString", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	@ResponseBody //return = content
	public String ajaxString(int num, String name) {
		System.out.println("Num : "+num);
		System.out.println("Name : "+name);
		
		return "num is "+num+", name is "+name;
	}
	@GetMapping("ajaxObject")
	@ResponseBody
	public AjaxDTO ajaxObject(int no, String title, String content) {
		
		AjaxDTO dto = new AjaxDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setName("잠탱");
		System.out.println("[ajaxObject]"+dto.toString());
		return dto;
	}
	@PostMapping("ajaxList")
	@ResponseBody
	public List<AjaxDTO> ajaxList(int no, String name) {
		List<AjaxDTO> list = new ArrayList<AjaxDTO>();
		String[] contents = {"이거 해봐야징","되나?","될거야","아마도","뭐가문제냐;","언젠간 되겠지"};
		String[] titles = {"계획","테스팅","믿음","불안","분노","체념"};
		String[] names = {"야심", "시도","처음","중간","중간2","끝"};
		for(int i=0;i<names.length; i++) {
			list.add(new AjaxDTO(i+1,titles[i],contents[i],names[i]));
		}
		System.out.println(list.size());
		System.out.println("no="+no+"\tname:"+name);
		return list;
	}
	@GetMapping("ajaxMap")
	@ResponseBody
	public Map ajaxMap(int num, String name, String tel) {
		HashMap map = new HashMap();
		System.out.println("num : "+num+"\tname : "+name+"\ttel :"+tel );
		map.put("comment","java영역에서 어노테이션 있어도 메소드로 작동은 된다.");
		map.put("totalnum", 21);//AutoBoxing Integer로 변환
		List list = new ArrayList();
		AjaxDTO dto = new AjaxDTO(19,"시험용","졸려용","미나");
		map.put("dto", dto);
		
		List testlist = ajaxList(1,"hong");
		
		String[] contents = {"이거 해봐야징","되나?","될거야","아마도","뭐가문제냐;","언젠간 되겠지"};
		String[] titles = {"계획","테스팅","믿음","불안","분노","체념"};
		String[] names = {"야심", "시도","처음","중간","중간2","끝"};
		for(int i=0;i<names.length; i++) {
			list.add(new AjaxDTO(i+1,titles[i],contents[i],names[i]));
		}
		map.put("list", list);
		map.put("list2", testlist);
		return map;
	}
	@RequestMapping(value="ajaxJson",method=RequestMethod.GET, produces="application/test;charset=UTF-8")
	@ResponseBody
	public String ajaxJson(int num,String name, String tel) {
		String[] orderK= {"부정", "분노", "협상", "우울","수용"}; 
		String[] orderE= { "Denial","Anger","Bargaining","Depression","Acceptance"};
		// JsonType= {no:1,name:2} -java-> {\"no\",\"1\",\"name\":\"2\"}
		String[] react= {"어? 되야하는데 왜안되?", "뭐가문젠데?","이러면될거야","나 안되나..","에휴 오늘내론 되겠지"};
		String json = "{";
		for(int i=0;i<5;i++) {
			json+="\""+orderE[i]+"\" : \""+react[i]+"\"";
			if(i!=4) {
				json+=",";
			}
		}		
		json+= "}";
		System.out.println(json);
		return json;
	}
}
