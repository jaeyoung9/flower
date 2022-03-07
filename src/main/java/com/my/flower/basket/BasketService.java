package com.my.flower.basket;

import java.util.List;
import java.util.Map;

public interface BasketService {

	
	List<Map<String, Object>> getBasketList(Map<String, Object> map);
	void basketPut(Map<String, Object> map);
	void basketDelete(Map<String, Object> map);

}
