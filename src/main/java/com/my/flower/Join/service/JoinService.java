package com.my.flower.Join.service;

import java.util.Map;

public interface JoinService {

	int joinIdCk(String id) throws Exception;

	void joinOk(Map<String, Object> map) throws Exception;
}