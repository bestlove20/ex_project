package com.ex.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface boardDao {
	int total();

	List<Map<String, Object>> board_list(HashMap<String, Object> pgmap);

	int post_delete(List<String> delete_list);

	int post_insert(HashMap<String, Object> map);

	int post_update(HashMap<String, Object> map);

	HashMap<String, Object> post_detail(int post_no);

}
