package com.my.flower.mypage.serivce;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	Map<String, Object> myPage(Map<String, Object> map) throws Exception;
	
	void myUpdate(Map<String, Object> map) throws Exception;
	
	void withdraw(Map<String, Object> map) throws Exception;
	
	Map<String, Object> checkPw(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> orderList(Map<String, Object> map);

}
