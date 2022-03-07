package com.my.flower.review;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import com.my.flower.file.FileUploadController;
import com.my.flower.goods.GoodsDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	private static final Logger log = Logger.getLogger(FileUploadController.class);

	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;

	@Resource(name = "goodsDAO")
	private GoodsDAO goodsDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 리뷰 작성
	/*
	 * @Override public void reviewUserWrite(Map<String, Object> map) throws
	 * Exception { reviewDAO.reviewUserWrite(map);
	 * 
	 * 
	 * List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
	 * for(int i=0, size=list.size(); i<size; i++){
	 * reviewDAO.reviewUserWrite(list.get(i)); }
	 * 
	 * 
	 * }
	 */
//리뷰작성
	@Override
	public void reviewUserWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo4(map, request);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> vo = list.get(i);
			reviewDAO.reviewUserWrite(vo);
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

	// 관리자 답변 작성
	@Override
	public void reviewReWrite(Map<String, Object> map) throws Exception {
		reviewDAO.reviewReWrite(map);
	}

	// 리뷰 작성 페이지 이동
	@Override
	public List<Map<String, Object>> getOrder(Map<String, Object> map) {
		return reviewDAO.getOrder(map);
	}

	// 리뷰 상세 페이지 이동
	@Override
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map) {
		return reviewDAO.reviewDetail(map);
	}

	// 관리자 답변 상세
	@Override
	public List<Map<String, Object>> reviewReDetail(Map<String, Object> map) {
		return reviewDAO.reviewReDetail(map);
	}

	// 관리자 답변 삭제
	@Override
	public void reviewReDelete(Map<String, Object> map) throws Exception {
		reviewDAO.reviewReDelete(map);
	}

	@Override
	public String restore(MultipartFile multipartFile, String uploadPath, String newFileName) throws Exception {
		String url = null;

		try {
			// ���� ����

			File f = new File(uploadPath);
			if (!f.exists()) {
				f.mkdirs();
			}

			writeFile(multipartFile, newFileName, uploadPath);
			url = uploadPath + "/" + newFileName;

		} catch (IOException e) {
			// ������� RuntimeException �� ��ӹ��� ���ܰ� ó���Ǿ�� ������
			// ���ǻ� RuntimeException�� ������.
			// throw new FileUploadException();
			throw new RuntimeException(e);
		}
		return url;
	}

	/*
	 * private String genSaveFileName(String extName) { String fileName = "";
	 * 
	 * Calendar calendar = Calendar.getInstance(); fileName +=
	 * calendar.get(Calendar.YEAR); fileName += calendar.get(Calendar.MONTH);
	 * fileName += calendar.get(Calendar.DATE); fileName +=
	 * calendar.get(Calendar.HOUR); fileName += calendar.get(Calendar.MINUTE);
	 * fileName += calendar.get(Calendar.SECOND); fileName +=
	 * calendar.get(Calendar.MILLISECOND); fileName += extName;
	 * 
	 * return fileName; }
	 */

	// ������ ������ write �ϴ� �޼���
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String uploadPath) throws IOException {
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(uploadPath + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	}

}