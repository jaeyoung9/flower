package com.my.flower.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
    private static final String filePath = "C:\\Users\\User\\Desktop\\ez\\프로젝트\\flower\\src\\main\\webapp\\images\\";
    
    public static boolean deleteFile(String storedFileName) {
        File file = new File(filePath + storedFileName);
        
        //upload가 있는지 확인
        //있을때만 작업한다
        if(file.exists()){
            if(file.delete()) {
                return true;
            }
        }
        return false;
    }
    
    public static List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String goods_title = request.getParameter("GOODS_TITLE");
        // String goods_price = request.getParameter("GOODS_PRICE");
       //  String goods_content = request.getParameter("GOODS_CONTENT");
         
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileImg = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
//        String boardIdx = (String)map.get("IDX");
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
                originalFileName = multipartFile.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                storedFileImg = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + storedFileImg);
                multipartFile.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
//                listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("ORIGINAL_FILE_NAME", originalFileName);
                //저장할 파일 이름
                listMap.put("STORED_FILE_IMG", storedFileImg);
                listMap.put("FILE_SIZE", multipartFile.getSize());
                listMap.put("GOODS_TITLE", goods_title);
                
              //  listMap.put("GOODS_PRICE", goods_price);
              //  listMap.put("GOODS_CONTENT", goods_content);
                
                list.add(listMap);
            }
        }
        return list;
    }

    
    public static List<Map<String,Object>> parseInsertFileInfo2(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String goods_title = request.getParameter("GOODS_TITLE");
        // String goods_price = request.getParameter("GOODS_PRICE");
       //  String goods_content = request.getParameter("GOODS_CONTENT");
         
         
        MultipartFile multipartFile2 = null;
        String originalFileName2 = null;
        String originalFileExtension = null;
        String storedFileThumb = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
//        String boardIdx = (String)map.get("IDX");
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile2 = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile2.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
                originalFileName2 = multipartFile2.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = originalFileName2.substring(originalFileName2.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                storedFileThumb = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + storedFileThumb);
                multipartFile2.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
//                listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("ORIGINAL_FILE_NAME2", originalFileName2);
                //저장할 파일 이름
                listMap.put("STORED_FILE_THUMB", storedFileThumb);
                listMap.put("FILE_SIZE2", multipartFile2.getSize());
                listMap.put("GOODS_TITLE", goods_title);
                
              //  listMap.put("GOODS_PRICE", goods_price);
              //  listMap.put("GOODS_CONTENT", goods_content);
                
                list.add(listMap);
            }
        }
        return list;
    }
    
    public static List<Map<String,Object>> parseInsertFileInfo3(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String notice_title = request.getParameter("NOTICE_TITLE");
         String notice_content = request.getParameter("NOTICE_CONTENT");
              
        MultipartFile multipartFile3 = null;
        String originalFileName3 = null;
        String originalFileExtension = null;
        String storedFileNotice = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
//        String boardIdx = (String)map.get("IDX");
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile3 = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile3.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
                originalFileName3 = multipartFile3.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = originalFileName3.substring(originalFileName3.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                storedFileNotice = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + storedFileNotice);
                multipartFile3.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
//                listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("ORIGINAL_FILE_NAME3", originalFileName3);
                //저장할 파일 이름
                listMap.put("STORED_FILE_NOTICE", storedFileNotice);
                listMap.put("FILE_SIZE3", multipartFile3.getSize());
                listMap.put("NOTICE_TITLE", notice_title);
                listMap.put("NOTICE_CONTENT", notice_content);
                
              //  listMap.put("GOODS_PRICE", goods_price);
              //  listMap.put("GOODS_CONTENT", goods_content);
                
                list.add(listMap);
            }
        }
        return list;
    }
    
    public static List<Map<String,Object>> parseInsertFileInfo4(Map<String,Object> map, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         String user_num = request.getParameter("USER_NUM");
         String review_content = request.getParameter("REVIEW_CONTENT");
         String order_num = request.getParameter("ORDER_NUM");
         String goods_index = request.getParameter("GOODS_INDEX");    
         String user_id = request.getParameter("USER_ID");
         
        MultipartFile multipartFile4 = null;
        String originalFileName4 = null;
        String originalFileExtension = null;
        String storedFileReview = null;
         
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null;
         
//        String boardIdx = (String)map.get("IDX");
         
        File file = new File(filePath);
        //경로가 존재하지 않을 경우 디렉토리를 만든다.
        if(file.exists() == false){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile4 = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile4.isEmpty() == false){
                //업로드한 파일의 확장자를 포함한 파일명이다.
                originalFileName4 = multipartFile4.getOriginalFilename();
                //업로드한 파일의 마지막 .을 포함한 확장자를 substring 한 것.
                originalFileExtension = originalFileName4.substring(originalFileName4.lastIndexOf("."));
                //32자리의 숫자를 포함한 랜덤 문자열 + 확장자를 붙여준 파일명이다.
                storedFileReview = CommonUtils.getRandomString() + originalFileExtension;
                 
                file = new File(filePath + storedFileReview);
                multipartFile4.transferTo(file);
                 
                listMap = new HashMap<String,Object>();
//                listMap.put("BOARD_IDX", boardIdx);
                //업로드할 당시의 파일이름
                listMap.put("ORIGINAL_FILE_NAME4", originalFileName4);
                //저장할 파일 이름
                listMap.put("STORED_FILE_REVIEW", storedFileReview);
                listMap.put("FILE_SIZE4", multipartFile4.getSize());
                listMap.put("USER_NUM", user_num);
                listMap.put("USER_ID", user_id);
                listMap.put("ORDER_NUM", order_num);
                listMap.put("GOODS_INDEX", goods_index);
                listMap.put("REVIEW_CONTENT", review_content);
                
                
                
              //  listMap.put("GOODS_PRICE", goods_price);
              //  listMap.put("GOODS_CONTENT", goods_content);
                
                list.add(listMap);
                System.out.println(list);
            }
        }
        return list;
    }
    
}