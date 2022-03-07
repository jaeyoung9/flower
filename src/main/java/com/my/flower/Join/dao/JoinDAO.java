package com.my.flower.Join.dao;

import java.util.Map;
import org.springframework.stereotype.Repository;
import com.my.flower.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{

	public int joinIdCk(String id) throws Exception {
		return (Integer) selectOne("join.joinIdCk", id);
	}

	public void joinOk(Map<String, Object> map) throws Exception {
		insert("join.joinOk", map);
	}
}