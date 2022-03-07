package com.my.flower.amin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("aminDAO")
public class AminDAO extends AbstractDAO {

	// 회원 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> userList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("amin.userList", map);
	}

	// 회원 ID 검색하기
	@SuppressWarnings("unchecked")
	public Map<String, Object> findUser(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("amin.findUser", map);
	}

	// 회원 삭제하기
	public void userListDelete(Map<String, Object> map) throws Exception {
		delete("amin.userListDelete", map);
	}
	@SuppressWarnings("unchecked")
	// 주문 내역 확인
	public List<Map<String, Object>> orderList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("amin.orderList", map);
	}
	@SuppressWarnings("unchecked")
	// 배송 여부 변경
	public Map<String, Object> trans(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("amin.trans", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> aminGoodsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("amin.aminGoodsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> aminNoticeList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("amin.aminNoticeList", map);
	}
	public void noticeDelete(Map<String, Object> map) throws Exception {
		delete("amin.noticeDelete", map);
	}
	
	public void goodsDelete(Map<String, Object> map) throws Exception{
		delete("amin.goodsDelete", map);		
	}
	
}