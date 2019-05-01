package com.ex.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.project.dao.carsDao;


@Service
public class carsServiceImpl implements carsService {

	@Autowired
	carsDao cd;

	@Override
	public ArrayList<Map<String, Object>> carslist() {
		return (ArrayList<Map<String, Object>>) cd.carslist();
	}

	@Override
	public ArrayList<Map<String, Object>> cars_selectbox2(HashMap<String, Object> map) {
		return (ArrayList<Map<String, Object>>) cd.cars_selectbox2(map);
	}

	@Override
	public ArrayList<Map<String, Object>> cars_selectbox3(HashMap<String, Object> map) {
		return (ArrayList<Map<String, Object>>) cd.cars_selectbox3(map);
	}

	@Override
	public ArrayList<Map<String, Object>> cars_postlist(HashMap<String, Object> map) {
		return (ArrayList<Map<String, Object>>) cd.cars_postlist(map);
	}

}
