package com.my.flower.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO {

	//경고무시 9. unchecked : 검증되지 않은 연산자 관련 경고 억제 
	//구독판매 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSubList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectPagingList("goods.goodsSubList",map);
	}
	//일반판매 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSaleList(Map<String, Object> map){
		return (List<Map<String, Object>>) selectPagingList("goods.goodsSaleList",map);
	}
	
	//구독 상세 페이징
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> subDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.SubDetail",map);
	}
	// 일반 상세 페이징
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> saleDetail(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.SaleDetail",map);
	}
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> review(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.Review",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> review2(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.Review2",map);
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewRe(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.ReviewRe",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsWrite(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.goodsWrite",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getSaleThumb(Map<String, Object> map){
		return (List<Map<String, Object>>) selectList("goods.getSaleThumb",map);
	}
	
	//메인 페이지
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> maingoods(Map<String, Object> map){
			return (List<Map<String, Object>>) selectList("goods.maingoods",map);
		}
	
//	subList()구독판매페이지
//	saleList()일반판매페이지
//	subDetail()구독판매상세페이지
//	saleDetail()일반판매상세페이지
	//goodsListDetail 리스트 상세
}
