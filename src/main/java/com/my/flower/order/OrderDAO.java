package com.my.flower.order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;
@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	// 장바구니에서 결제페이지 가는거니까 바스킷리스트 불러와서 꺼내와서 ?
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderPage(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.orderPage", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderPay(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.orderPay", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderMember(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.orderMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderPage2(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.orderPage2", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderPay2(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.orderPay2", map);
	}
	
	
}
