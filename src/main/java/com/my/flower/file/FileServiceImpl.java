package com.my.flower.file;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.my.flower.common.util.FileUtils;

@Service("fileService")
public class FileServiceImpl implements FileService {

	private static final Logger log = Logger.getLogger(FileServiceImpl.class);

	@Resource
	private FileUtils fileUtils;

	@Resource
	private FileDAO fileDao;

	@Override
	public void insertgoodsimg(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			fileDao.insertgoodsimg(vo);
		}

		// test
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("---------- file start ----------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("---------- file end ----------\n");
			}
		}
	}

	@Override
	public void insertgoodsthumb(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo2(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			fileDao.insertgoodsthumb(vo);
		}

		// test
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("---------- file start ----------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("---------- file end ----------\n");
			}
		}
	}

	@Override
	public void insertnotice(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo3(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			fileDao.insertnotice(vo);
		}

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("---------- file start ----------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("---------- file end ----------\n");
			}
		}
	}
}