package com.my.flower.amin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;

//관리자 메인페이지
@Controller
public class AminController {
	@Resource(name = "aminService")
	AminService aminService;

	@RequestMapping(value = "/aminMyPage")
	public ModelAndView aminMyPage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("aminMyPage");
		return mv;
	}

	// 관리자 - 회원 리스트 (단순 JSP 호출)
	@RequestMapping(value = "/aminMyPage/userList")
	@ResponseBody
	public ModelAndView userList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/amin/userList");
		List<Map<String, Object>> userList = aminService.userList(commandMap.getMap());
		mv.addObject("userList", userList);
		return mv;
	}

	// 관리자 - 회원 아이디로 검색
	@RequestMapping(value = "/aminMyPage/findUser")
	@ResponseBody
	public ModelAndView findUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> findUser = aminService.findUser(commandMap.getMap());
		// System.out.println(findUser.get("USER_ID"));
		System.out.println(findUser.get("USER_NUM"));
		mv.addObject("USER_NUM", findUser.get("USER_NUM"));
		mv.addObject("USER_ID", findUser.get("USER_ID"));
		mv.addObject("USER_NAME", findUser.get("USER_NAME"));
		mv.addObject("USER_PHONE", findUser.get("USER_PHONE"));
		mv.addObject("USER_EMAIL", findUser.get("USER_EMAIL"));
		mv.addObject("USER_ZIPCODE", findUser.get("USER_ZIPCODE"));
		mv.addObject("USER_ADD1", findUser.get("USER_ADD1"));
		mv.addObject("USER_ADD2", findUser.get("USER_ADD2"));
		mv.addObject("AMIN_TIM", findUser.get("AMIN_TIM"));
		mv.addObject("DEL_GB", findUser.get("DEL_GB"));
		
		return mv;
	}

	/* 관리자 - 회원 삭제 */
	@RequestMapping(value = "/aminMyPage/userList/delete")
	public ModelAndView userListDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/amin/userList");
		// HttpSession session = request.getSession();
		// commandMap.put("USER_ID",session.getAttribute("USER_ID"));
		aminService.userListDelete(commandMap.getMap());
		// mv.addObject("USER_ID", commandMap.get("USER_ID"));
		return mv;
	}

	// 주문내역확인 (단순 JSP 호출)
	@RequestMapping(value = "/aminMyPage/orderList")
	@ResponseBody
	public ModelAndView orderList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/amin/orderList");
		List<Map<String, Object>> orderList = aminService.orderList(commandMap.getMap());
		System.out.println(orderList);
		mv.addObject("orderList", orderList);
		return mv;
	}

	/* 배송 여부 수정 */
	@RequestMapping(value = "/aminMyPage/orderList/trans", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView trans(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/amin/orderList");
		aminService.trans(commandMap.getMap());
		List<Map<String, Object>> orderList = aminService.orderList(commandMap.getMap());
		mv.addObject("orderList", orderList);
		return mv;
	}

	@RequestMapping(value = "/aminBoardList")
	public ModelAndView aminBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/amin/aminBoardList");
		List<Map<String, Object>> aminGoodsList = aminService.aminGoodsList(commandMap.getMap());
		List<Map<String, Object>> aminNoticeList = aminService.aminNoticeList(commandMap.getMap());

		mv.addObject("aminGoodsList", aminGoodsList);
		mv.addObject("aminNoticeList", aminNoticeList);

		return mv;

	}

	@RequestMapping(value = "/noticeDelete")
	@ResponseBody
	public ModelAndView noticeDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		aminService.noticeDelete(commandMap.getMap());
		return mv; 

	}

	@RequestMapping(value = "/aminBoardList/delete")
	@ResponseBody
	public ModelAndView goodsDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		aminService.goodsDelete(commandMap.getMap());
		return mv; 

	}
}