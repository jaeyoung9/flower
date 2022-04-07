package com.my.flower.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {

	// 리뷰 작성
	@SuppressWarnings("unchecked")
	public void reviewUserWrite(Map<String, Object> map) {
		insert("review.reviewUserWrite", map);
	}
	
	// 리뷰 작성 페이지 이동 	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getOrder(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("review.getOrder",map);
	}
	
	// 리뷰 상세보기 페이지 이동 	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("review.reviewDetail",map);
	}
	
	// 리뷰 삭제
	public void reviewDelete(Map<String, Object> map) throws Exception {
		delete("review.reviewDelete", map);	
	}
		
	// 관리자 답변 작성
	@SuppressWarnings("unchecked")
	public void reviewReWrite(Map<String, Object> map) {
		insert("review.reviewReWrite", map);
	}
	
	// 관리자 답변 상세
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewReDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("review.reviewReDetail",map);
	}
	
	// 관리자 답변 삭제
	public void reviewReDelete(Map<String, Object> map) throws Exception {
		delete("review.reviewReDelete", map);	
	}
			
}