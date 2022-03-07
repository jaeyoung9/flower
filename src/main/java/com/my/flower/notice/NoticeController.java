package com.my.flower.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;
import com.my.flower.file.FileService;
import com.my.flower.file.FileUploadController;
import com.my.flower.goods.GoodsService;

@Controller
public class NoticeController {
	private static final Logger log = Logger.getLogger(FileUploadController.class);

	@Resource(name = "noticeService")
	NoticeService noticeService;
	@Autowired
	FileService fileService;

	@RequestMapping(value = "/notice")
	public ModelAndView notice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("notice");
		List<Map<String, Object>> notice = noticeService.notice(commandMap.getMap());
		// HttpSession session = request.getSession(true);
		mv.addObject("notice", notice);
		// session.getAttribute("USER_ID");

		return mv;

	}

	@RequestMapping(value = "/notice/writePage")
	public ModelAndView noticeWritePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("noticeWritePage");

		return mv;

	}

	@RequestMapping(value = "/noticeWritePage/noticeWrite" , method = RequestMethod.POST)
	
	public ModelAndView noticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");
		 if (log.isDebugEnabled()) {
	            log.debug(commandMap);
	        }
		fileService.insertnotice(commandMap.getMap(), request);

		return mv;

	}

}
