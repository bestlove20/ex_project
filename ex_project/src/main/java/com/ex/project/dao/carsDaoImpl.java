package com.ex.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class carsDaoImpl implements carsDao{
	@Autowired
	SqlSession session;

	@Override
	public List<Map<String, Object>> carslist() {
		return session.selectList("cars.carslist");
	}

	@Override
	public List<Map<String, Object>> cars_selectbox2(HashMap<String, Object> map) {
		return session.selectList("cars.cars_selectbox2", map);
	}

	@Override
	public List<Map<String, Object>> cars_selectbox3(HashMap<String, Object> map) {
		return session.selectList("cars.cars_selectbox3", map);
	}

	@Override
	public List<Map<String, Object>> cars_postlist(HashMap<String, Object> map) {
		return session.selectList("cars.cars_postlist", map);
	}
}
