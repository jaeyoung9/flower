package com.my.flower.amin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("aminService")
public class AminServiceImpl implements AminService {
	
		@Resource(name = "aminDAO")
	private AminDAO aminDAO;

	@Override
	public List<Map<String, Object>> userList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.userList(map);
	}
	@Override
	public Map<String, Object> findUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.findUser(map);
	}
	@Override
	public void userListDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		aminDAO.userListDelete(map);
	}
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.orderList(map);
	}
	@Override
	public Map<String, Object> trans(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.trans(map);
	}
	@Override
	public List<Map<String, Object>> aminNoticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.aminNoticeList(map);
	}
	
	@Override
	public List<Map<String, Object>> aminGoodsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return aminDAO.aminGoodsList(map);
	}
	
	@Override
	public void noticeDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		aminDAO.noticeDelete(map);
	}
	
	@Override
	public void goodsDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		aminDAO.goodsDelete(map);
		
	}
}