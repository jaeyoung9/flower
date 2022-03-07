package com.my.flower.Join.controller;

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

import com.my.flower.Join.service.JoinService;
import com.my.flower.common.CommandMap;
import com.my.flower.goods.GoodsService;

@Controller
public class JoinController {

	@Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "goodsService")
	GoodsService goodsService;
	
	/* 메인 세션!!!!!!!!!!!!!!!!!!!!!!!! 여기거된다.*/
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		//request의 getSession()메서드의 파라미터로 false를 전달하면, 
		//이미 생성된 세션이 있을 때 그 세션을 반환하고, 없으면 null을 반환한다.
		List<Map<String, Object>> list = goodsService.maingoods(commandMap.getMap());
		String USER_ID = (String)session.getValue("USER_ID");
		ModelAndView mv = new ModelAndView("main");
		session.setAttribute("USER_ID", USER_ID);
		mv.addObject("list", list);
		return mv;
	}

	/* 회원가입 */
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("joinForm");
		return mv;
	}
	// 회원가입 폼
	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
    public String registerPOST(String id) throws Exception {
        int idResult = joinService.joinIdCk(id);

        try {
            if (idResult == 1) {
                return "joinForm";
            } else if (idResult == 0) {
                joinService.joinIdCk(id);
                return "redirect:loginForm";
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return "redirect:/";
    }
	
	/* 회원가입완료 */
	@RequestMapping(value = "/joinOk", method = RequestMethod.POST)
	public ModelAndView joinOk(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
	
		joinService.joinOk(commandMap.getMap());
		return mv;
	}

	/* id 중복 체크 */
	@RequestMapping(value = "/joinIdCk", method = RequestMethod.POST)
	@ResponseBody
	public int joinIdCk(String id) throws Exception {
		int result = joinService.joinIdCk(id);
		return result;
	}


	
}