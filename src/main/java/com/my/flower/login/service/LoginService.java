package com.my.flower.login.service;

import java.util.List;
import java.util.Map;

public interface LoginService {

	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception;
}
