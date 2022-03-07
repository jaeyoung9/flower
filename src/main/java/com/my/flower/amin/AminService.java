package com.my.flower.amin;

import java.util.List;
import java.util.Map;

public interface AminService {

	List<Map<String, Object>> userList(Map<String, Object> map);
	Map<String, Object> findUser(Map<String, Object> map);
	void userListDelete(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> orderList(Map<String, Object> map);
	Map<String, Object> trans(Map<String, Object> map);
	List<Map<String, Object>> aminGoodsList(Map<String, Object> map);
	List<Map<String, Object>> aminNoticeList(Map<String, Object> map);
	void noticeDelete(Map<String, Object> map) throws Exception;
	void goodsDelete(Map<String, Object> map) throws Exception;
	
}