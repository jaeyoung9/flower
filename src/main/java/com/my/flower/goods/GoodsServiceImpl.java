package com.my.flower.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	


	
	

	@Override
	public List<Map<String, Object>> maingoods(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.maingoods(map);
	}

	@Override
	public List<Map<String, Object>> goodsWrite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.goodsWrite(map);
	}

	@Override
	public List<Map<String, Object>> getReview2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.review2(map);
	}

	@Override
	public List<Map<String, Object>> getReviewRe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.reviewRe(map);
	}

	@Override
	public List<Map<String, Object>> getReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsDAO.review(map);
	}


	@Override
	public List<Map<String, Object>> goodsSubList(Map<String, Object> map) {
		return goodsDAO.goodsSubList(map);
	}

	@Override
	public List<Map<String, Object>> goodsSaleList(Map<String, Object> map) {
		return goodsDAO.goodsSaleList(map);
	}

	@Override
	public List<Map<String, Object>> getsubDetail(Map<String, Object> map) {
		return goodsDAO.subDetail(map);
	}

	@Override
	public List<Map<String, Object>> getsaleDetail(Map<String, Object> map) {
		return goodsDAO.saleDetail(map);
	}


}
