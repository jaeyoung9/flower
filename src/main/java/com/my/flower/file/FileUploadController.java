package com.my.flower.file;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.flower.common.CommandMap;
import com.my.flower.goods.GoodsService;

@Controller
public class FileUploadController {

    private static final Logger log = Logger.getLogger(FileUploadController.class);
    
    @Autowired
    FileService fileService;
    
	/*
	 * @Resource(name = "goodsService") GoodsService goodsService;
	 */
	/*
	 * @RequestMapping(value = "/goodsWritePage", method = RequestMethod.GET) public
	 * ModelAndView getFilePage(CommandMap inparams) { ModelAndView mav = new
	 * ModelAndView("goodsWritePage"); return mav; }
	 */
    
    @RequestMapping(value = "/upload/insertgoodsimg", method = RequestMethod.POST)
    public ModelAndView insertgoodsimg(CommandMap inparams, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("jsonView");            
        if (log.isDebugEnabled()) {
            log.debug(inparams);
        }
        
        fileService.insertgoodsimg(inparams.getMap(), request);
        
        
        
        return mav;
    }
   
    @RequestMapping(value = "/upload/insertgoodsthumb", method = RequestMethod.POST)
    public ModelAndView insertgoodsthumb(CommandMap inparams, HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView("jsonView");
        if (log.isDebugEnabled()) {
            log.debug(inparams);
        }
        
        fileService.insertgoodsthumb(inparams.getMap(), request);
        return mav;
    }
    
}