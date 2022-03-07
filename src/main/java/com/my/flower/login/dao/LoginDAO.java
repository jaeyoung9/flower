package com.my.flower.login.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.loginMemberCk", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("login.findId", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("login.findPw", map);
	}
}
