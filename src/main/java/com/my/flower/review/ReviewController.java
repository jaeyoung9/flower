package com.my.flower.review;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;
import com.my.flower.file.FileService;
import com.my.flower.goods.GoodsService;

@Controller
public class ReviewController {
	
	@Resource(name = "reviewService")
	ReviewService reviewService;
	@Autowired
	FileService fileService;
	
	
	// 리뷰 작성 페이지 이동
	@RequestMapping(value = "/reviewWritePage")
	public ModelAndView reviewWritePage(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewWritePage");
		List<Map<String, Object>> reviewWritePage = reviewService.getOrder(commandMap.getMap());
		HttpSession session = request.getSession();// 세션 값 불러오고
		String USER_ID = (String) session.getValue("USER_ID");// 값을 String 저장하고
		mv.addObject("reviewWritePage", reviewWritePage);
		session.setAttribute("USER_ID", USER_ID);// 세션정보를 user_id 에 담아 jsp로 리턴
		
		return mv;
	}
	
	// 리뷰 상세 페이지 이동
	@RequestMapping(value = "/reviewDetail")
	public ModelAndView reviewDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewDetail");
		// HttpSession session = request.getSession();
		// String REVIEW_INDEX = (String)session.getValue("REVIEW_INDEX");
		// session.setAttribute("REVIEW_INDEX", REVIEW_INDEX);
		// commandMap.put("REVIEW_INDEX", session.getAttribute("REVIEW_INDEX"));
		
		List<Map<String, Object>> reviewDetail = reviewService.reviewDetail(commandMap.getMap());
		List<Map<String, Object>> reviewReDetail = reviewService.reviewReDetail(commandMap.getMap());
		mv.addObject("reviewDetail", reviewDetail);
		mv.addObject("reviewReDetail", reviewReDetail);
		
		return mv;
	}
	
	// 리뷰 작성
	@RequestMapping(value="/review/userWrite" , method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView reviewUserWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		reviewService.reviewUserWrite(commandMap.getMap(), request);
		
		return mv;
	}
	
	// 관리자 답변 작성
	@RequestMapping(value= "/reviewReWrite")
	public ModelAndView reviewReWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("reviewDetail");
		reviewService.reviewReWrite(commandMap.getMap());
			
		return mv;
	}
	
	// 관리자 답변 삭제
	@RequestMapping(value="/reviewReDelete" )
	public ModelAndView reviewReDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("reviewDetail");		
		reviewService.reviewReDelete(commandMap.getMap());
		
		return mv;
	}

}
//, HttpServletRequest request,
//@RequestParam("REVIEW_IMG") MultipartFile file1
//UUID uuid = UUID.randomUUID();
//String newFileName = uuid.toString() + file1.getOriginalFilename();
//commandMap.put("REVIEW_IMG", newFileName);
//
//String path="/images/review";
//String uploadPath  = request.getSession().getServletContext().getRealPath(path);
//String REVIEW_IMG = reviewService.restore(file1, uploadPath, newFileName);
//
//mv.addObject("REVIEW_IMG", REVIEW_IMG);