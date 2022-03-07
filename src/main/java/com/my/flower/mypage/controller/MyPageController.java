package com.my.flower.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;
import com.my.flower.mypage.serivce.MyPageService;

@Controller
public class MyPageController {

	@Resource(name = "myPageService")
	private MyPageService myPageService;
	
	/* 마이페이지 */
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage(CommandMap commandMap,HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myPage");
		HttpSession session = request.getSession();
		String USER_ID = (String)session.getValue("USER_ID");
		session.setAttribute("USER_ID", USER_ID);
		if(request.getSession().getAttribute("USER_ID")==null){
			 response.sendRedirect("/flower/loginForm"); 
		} else {
		List<Map<String, Object>> orderList = myPageService.orderList(commandMap.getMap());
		mv.addObject("orderList", orderList);
		}
		return mv;
	}	
	
	/* 정보수정 폼 */
	@RequestMapping(value="/myPage/myUpdate", method = RequestMethod.GET)
	public ModelAndView myUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("myUpdate");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		commandMap.put("USER_ID", id);
		
		Map<String, Object> map = myPageService.myPage(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	/* 정보수정 완료 */
	@RequestMapping(value = "/myPage/myUpdateOk", method = RequestMethod.POST)
	public ModelAndView myUpdateOk(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("myPage");
		/* System.out.println(commandMap.get("USER_ID")); */ 
		myPageService.myUpdate(commandMap.getMap());
		return mv;
	}
	
	/* 회원탈퇴 */
	@RequestMapping(value="/myPage/withdraw" )
	public ModelAndView withdraw(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/logout");
			
		HttpSession session = request.getSession();
		commandMap.put("USER_ID",session.getAttribute("USER_ID"));
		myPageService.withdraw(commandMap.getMap());
		return mv;
	}
	
	// 회원정보수정 - 비밀번호 체크 폼
		@RequestMapping(value = "/myPage/checkPwForm")
		public ModelAndView checkPwForm(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("checkPwForm");
			return mv;
		}

		// 회원정보수정 - 비밀번호 체크
		@RequestMapping(value= "/myPage/checkPw", method = RequestMethod.POST) 
		public ModelAndView checkPw(CommandMap commandMap, HttpServletRequest request) throws Exception { 
			ModelAndView mv = new ModelAndView("checkPw");
			HttpSession session = request.getSession(true);
			
			String message = "";
			
			Map<String, Object> result = myPageService.checkPw(commandMap.getMap());
			System.out.println(result);
			
			if(result == null) {
				message = "비밀번호가 일치하지 않습니다.";
			} else if(result.get("USER_PW").equals(commandMap.get("USER_PW"))) {
				session.setAttribute("USER_ID", result.get("USER_ID"));
			}
			mv.addObject("message", message);
			
			return mv;
		}
}
