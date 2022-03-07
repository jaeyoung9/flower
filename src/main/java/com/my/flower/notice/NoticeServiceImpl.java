package com.my.flower.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.flower.goods.GoodsDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> notice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDAO.notice(map);
	}

	

}
