package com.my.flower.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.basket.BasketService;
import com.my.flower.common.CommandMap;
import com.my.flower.goods.GoodsService;

@Controller
public class OrderController {
	@Resource(name = "orderService")
	OrderService orderService;
	@Resource(name = "basketService")
	BasketService basketService;
	@Resource(name = "goodsService")
	GoodsService goodsService;

	@RequestMapping(value = "/order/PayPage")
	@ResponseBody
	public ModelAndView orderPayPage(CommandMap commandMap, HttpServletRequest request, Object op2, Object op3, Object op4) throws Exception {
		ModelAndView mv = new ModelAndView("userPayPage");
		List<Map<String, Object>> orderPayPage = orderService.orderPayPage(commandMap.getMap());
		List<Map<String, Object>> orderMember = orderService.orderMember(commandMap.getMap());
		
		mv.addObject("orderPayPage", orderPayPage);
		mv.addObject("orderMember", orderMember);
		return mv;
	}

	@RequestMapping(value = "/order/Pay")

	public ModelAndView orderPay(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("userPayPage");
		List<Map<String, Object>> orderPay = orderService.orderPay(commandMap.getMap());		
		mv.addObject("orderPay", orderPay);	
		return mv;

	}
	
	
	
	
	@RequestMapping(value = "/order/PayPage2")
	@ResponseBody
	public ModelAndView orderPayPage2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("basketPayPage");
		List<Map<String, Object>> orderPayPage2 = orderService.orderPayPage2(commandMap.getMap());
		List<Map<String, Object>> orderMember = orderService.orderMember(commandMap.getMap());
		mv.addObject("orderPayPage2", orderPayPage2);
		mv.addObject("orderMember", orderMember);
		return mv;
	}

	@RequestMapping(value = "/order/Pay2")

	public ModelAndView orderPay2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("basketPayPage");
		List<Map<String, Object>> orderPay2 = orderService.orderPay2(commandMap.getMap());		
		mv.addObject("orderPay2", orderPay2);	
		return mv;

	}
	
	
	@RequestMapping(value = "/order/Delete")
	@ResponseBody
	public ModelAndView basketDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("basket");// .jsp
	 basketService.basketDelete(commandMap.getMap()); // 이게 맵으로 받아온 값을 basketPut으로 넣는다는
		return mv; // 리턴
	}

	
	
	
}
