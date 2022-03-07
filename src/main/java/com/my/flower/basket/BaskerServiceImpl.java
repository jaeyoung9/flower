package com.my.flower.basket;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service ("basketService")
public class BaskerServiceImpl implements BasketService{

	@Resource(name="basketDAO")
	private BasketDAO basketDAO;
	
	
	@Override
	public List<Map<String, Object>> getBasketList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return basketDAO.basketList(map);
	}


	@Override
	public void basketPut(Map<String, Object> map) {
		// TODO Auto-generated method stub
		basketDAO.basketPut(map);
	}

	@Override
	public void basketDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		basketDAO.basketDelete(map);
		
	}

}
