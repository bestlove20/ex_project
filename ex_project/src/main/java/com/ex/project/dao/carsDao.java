package com.ex.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface carsDao {

	List<Map<String, Object>> carslist();

	List<Map<String, Object>> cars_selectbox2(HashMap<String, Object> map);

	List<Map<String, Object>> cars_selectbox3(HashMap<String, Object> map);

	List<Map<String, Object>> cars_postlist(HashMap<String, Object> map);


}
