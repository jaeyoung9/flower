package com.my.flower.mypage.serivce;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.flower.mypage.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {

	@Resource(name="myPageDAO")
	private MyPageDAO myPageDAO;
	
	@Override
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.myPage(map);
	}

	@Override
	public void myUpdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.myUpdate(map);
	}

	@Override
	public void withdraw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.withdraw(map);
	}

	@Override
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated m	ethod stub
		return myPageDAO.checkPw(map);
	}
	
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDAO.orderList(map);
	}
	
}
