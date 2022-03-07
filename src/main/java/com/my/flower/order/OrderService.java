package com.my.flower.order;

import java.util.List;
import java.util.Map;

public interface OrderService {

	
	List<Map<String, Object>> orderPayPage(Map<String, Object> map);
	List<Map<String, Object>> orderPay(Map<String, Object> map);
	List<Map<String, Object>> orderMember(Map<String, Object> map);
	
	List<Map<String, Object>> orderPayPage2(Map<String, Object> map);
	List<Map<String, Object>> orderPay2(Map<String, Object> map);
	
}
