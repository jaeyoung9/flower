package com.my.flower.Join.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.flower.Join.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService {

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public int joinIdCk(String id) throws Exception {
		return joinDAO.joinIdCk(id);
	}

	@Override
	public void joinOk(Map<String, Object> map) throws Exception {
		joinDAO.joinOk(map);
	}
}