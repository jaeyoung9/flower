package com.my.flower.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("myPageDAO")
public class MyPageDAO extends AbstractDAO {

	//회원정보가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> myPage(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("myPage.myPage",map);
	}
	//회원정보수정
	public void myUpdate(Map<String, Object> map) throws Exception {
		update("myPage.myUpdate", map);
	}
	//회원탈퇴
	public void withdraw(Map<String, Object> map) throws Exception {
		delete("myPage.withdraw", map);	
	}
	
	//비밀번호 확인
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("myPage.checkPw",map);
	}
	
	//주문내역
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> orderList(Map<String, Object> map){
			return (List<Map<String, Object>>) selectList("myPage.orderList",map);
		}
}
