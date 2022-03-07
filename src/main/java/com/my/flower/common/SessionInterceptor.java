package com.my.flower.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String getId = (String) session.getValue("USER_ID");
		if (getId == null) {

			response.sendRedirect(request.getContextPath()+"/loginForm");
			System.out.println("로그인 세션 없음 로그인 폼으로");
		}				
		else if( getId == "FLOWER") {			
			response.sendRedirect(request.getContextPath()+"/llllllll");
			System.out.println("관리자로그인됨");
		} 				
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("jsp 처리후 보여짐");
		
		
	}

}
