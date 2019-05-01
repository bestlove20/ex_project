package com.ex.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface carsService {

	ArrayList<Map<String, Object>> carslist();

	ArrayList<Map<String, Object>> cars_selectbox2(HashMap<String, Object> map);

	ArrayList<Map<String, Object>> cars_selectbox3(HashMap<String, Object> map);

	ArrayList<Map<String, Object>> cars_postlist(HashMap<String, Object> map);

}
