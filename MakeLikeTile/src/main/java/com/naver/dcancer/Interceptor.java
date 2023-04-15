package com.naver.dcancer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		// 로그인 유무 확인 로그인 된 경우 호출한 매핑주소로 이동 // 로그인이 안된 경우 로그인 폼으로 이동
				HttpSession session = request.getSession();
				String auth=(String)session.getAttribute("auth");
				String code=(String)session.getAttribute("code");
				if(code!=null||auth!=null) {
					return true;
				}
				response.sendRedirect("home");
				return false;
			}
			//controller 실행 후 view 이동전 실행
			@Override
			public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, @Nullable ModelAndView mav) throws Exception {
				
			}
			//controller 실행 후 실행
			@Override
			public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object Handler, @Nullable Exception ex) throws Exception {
				
			}

}
