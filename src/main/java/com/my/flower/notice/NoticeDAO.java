package com.my.flower.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("notice.notice",map);
	}
	
	
	
}
