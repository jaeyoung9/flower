package com.my.flower.basket;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;
@Repository("basketDAO")
public class BasketDAO  extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("basket.basketList",map);
	}
	
	@SuppressWarnings("unchecked")
	public void basketPut(Map<String, Object> map){
	 insert("basket.basketPut",map);
	}
	
	@SuppressWarnings("unchecked")
	public void basketDelete(Map<String, Object> map){
	 insert("basket.basketDelete",map);
	}

	
}
