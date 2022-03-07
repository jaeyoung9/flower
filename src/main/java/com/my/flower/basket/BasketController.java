package com.my.flower.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;

@Controller
public class BasketController {
	@Resource(name = "basketService")
	BasketService basketService;

	@RequestMapping(value = "/basket")
	@ResponseBody
	public ModelAndView basketList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("basket");// jsonView 동작안함
		List<Map<String, Object>> basketList = basketService.getBasketList(commandMap.getMap());
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고
		mv.addObject("basketList", basketList);
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
		return mv;

	}

	@RequestMapping(value = "/basket/put")
	@ResponseBody
	public ModelAndView basketPut(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("goodsSubDetail");// .jsp
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고
		basketService.basketPut(commandMap.getMap()); // 이게 맵으로 받아온 값을 basketPut으로 넣는다는
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
		return mv; // 리턴
	}

	
	
	
	
	
	@RequestMapping(value = "/basket/Delete")
	@ResponseBody
	public ModelAndView basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("basket");// .jsp
	 basketService.basketDelete(commandMap.getMap()); // 이게 맵으로 받아온 값을 basketPut으로 넣는다는
		return mv; // 리턴
	}

	
	
	
	

}
