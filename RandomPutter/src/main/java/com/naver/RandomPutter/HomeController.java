package com.naver.RandomPutter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
	@Autowired
	service service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	@GetMapping("startSell")
	public void startSell() {
		List<itemDTO> frm = service.itemList(1);
		List<itemDTO> lens = service.itemList(2);
		List<itemDTO> cl = service.itemList(3);
		List<empDTO> emp = service.empList();
		int lastno = service.lastNo()+1;
		
		//while(true) {
			System.out.println("lastno:"+lastno);
			
			List<sellVo> list = new ArrayList<sellVo>();
			
			int cycle=(int)(1+Math.random()*3);
			
			cycle = 3;
			
			for(int i=0; i<cycle;i++) {
				System.out.println("[cycle]:"+cycle+",[idx]:"+i+",[Sellno]:"+lastno);
				switch ( (int)(Math.random()*3) ){
					case 0 : 
						{// frm1 lens2 cl2
							itemDTO frmdto= frm.get((int)(Math.random()*frm.size()));
							itemDTO lensdtor= lens.get((int)(Math.random()*lens.size())); //lensL
							itemDTO lensdtol= lens.get((int)(Math.random()*lens.size())); //lensR
							itemDTO cldtor=cl.get((int)(Math.random()*cl.size()));
							itemDTO cldtol=cl.get((int)(Math.random()*cl.size()));
	
							int num0 =((int)(Math.random()*emp.size()));
							empDTO empdto = emp.get(num0);
							
							sellVo frmvo= new sellVo(lastno, empdto.getEmpno(), empdto.getCode(),1,frmdto.getGoodNo(),frmdto.getSellprice());
							list.add(frmvo);
							sellVo lensr= new sellVo(lastno, empdto.getEmpno(), empdto.getCode(),1,lensdtor.getGoodNo(),lensdtor.getSellprice());
							list.add(lensr);
							sellVo lensl= new sellVo(lastno, empdto.getEmpno(), empdto.getCode(),1,lensdtol.getGoodNo(),lensdtol.getSellprice());
							list.add(lensl);
							sellVo clr= new sellVo(lastno, empdto.getEmpno(), empdto.getCode(),1,cldtor.getGoodNo(),cldtor.getSellprice());
							list.add(clr);
							sellVo cll= new sellVo(lastno, empdto.getEmpno(), empdto.getCode(),1,cldtol.getGoodNo(),cldtol.getSellprice());
							list.add(cll);
							System.out.println("num0 emp idx"+num0+"\n[switch case0]:"+empdto+"\n"+list);
						}
						lastno++;
						break;
					
					case 1 : // cl 2
						{int num1 = (int)(Math.random()*emp.size());
						itemDTO clrdto=cl.get((int)(Math.random()*cl.size()));
						itemDTO clldto=cl.get((int)(Math.random()*cl.size()));
						empDTO empdto1 = emp.get(num1);
		
						System.out.println("num1 emp idx"+num1+"\n[switch case1]:"+empdto1.toString()+"\n"+list);
						
						sellVo rcl= new sellVo(lastno, empdto1.getEmpno(), empdto1.getCode(),1,clrdto.getGoodNo(),clrdto.getSellprice());
						list.add(rcl);
						sellVo lcl= new sellVo(lastno, empdto1.getEmpno(), empdto1.getCode(),1,clldto.getGoodNo(),clldto.getSellprice());
						list.add(lcl);
						}
						lastno++;
						break;

					default : //안경테 + 렌즈2
					{
						int numDefault = (int)(Math.random()*emp.size());
						itemDTO framedto= frm.get((int)(Math.random()*frm.size()));
						itemDTO rlensdto= lens.get((int)(Math.random()*lens.size()));
						itemDTO llensdto= lens.get((int) (Math.random()*lens.size()));
						empDTO empdto2 = emp.get(numDefault);
	
						System.out.println("[switch default]:"+empdto2.toString());
					
						sellVo framevo= new sellVo(lastno, empdto2.getEmpno(), empdto2.getCode(),1,framedto.getGoodNo(),framedto.getSellprice());
						list.add(framevo);
						sellVo rlens= new sellVo(lastno, empdto2.getEmpno(), empdto2.getCode(),1,rlensdto.getGoodNo(),rlensdto.getSellprice());
						list.add(rlens);
						sellVo llens= new sellVo(lastno, empdto2.getEmpno(), empdto2.getCode(),1,llensdto.getGoodNo(),llensdto.getSellprice());
						list.add(llens);
						lastno++;
				}//switch
				System.out.println(lastno-1+"th [ list ]"+list);
				int result = service.selled(list);
				System.out.println( "input result : "+(result>1?"succes":"failed" ) );
				list= new ArrayList<sellVo>();
				// service.selledlist(list); // sell list 추가
				// service.selleddata(list); // sell data 추가
			} //for
		}	
	}
}
