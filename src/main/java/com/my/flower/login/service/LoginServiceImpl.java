package com.my.flower.login.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.my.flower.login.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginMemberCk(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.loginMemberCk(map);
	}

	@Override
	public List<Map<String, Object>> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
	}

	@Override
	public List<Map<String, Object>> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}
	
	
}
