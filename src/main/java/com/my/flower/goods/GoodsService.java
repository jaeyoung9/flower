package com.my.flower.goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	List<Map<String, Object>> goodsSubList(Map<String, Object> map);

	List<Map<String, Object>> getReview(Map<String, Object> map);

	List<Map<String, Object>> getReview2(Map<String, Object> map);

	List<Map<String, Object>> getReviewRe(Map<String, Object> map);

	List<Map<String, Object>> goodsSaleList(Map<String, Object> map);

	List<Map<String, Object>> getsubDetail(Map<String, Object> map);

	List<Map<String, Object>> getsaleDetail(Map<String, Object> map);

	List<Map<String, Object>> goodsWrite(Map<String, Object> map);

	List<Map<String, Object>> maingoods(Map<String, Object> map);


//	subList()구독판매페이지
//	saleList()일반판매페이지
//	subDetail()구독판매상세페이지
//	saleDetail()일반판매상세페이지
// goodsListDetail 리스트 상세
}
