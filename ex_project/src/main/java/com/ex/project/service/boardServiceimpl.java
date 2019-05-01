package com.ex.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.project.dao.boardDao;

@Service
public class boardServiceimpl implements boardService{

	@Autowired
	boardDao bd;
	
	
	@Override
	public int total() {
		return bd.total();
	}

	@Override
	public ArrayList<Map<String, Object>> board_list(HashMap<String, Object> pgmap) {
		return (ArrayList<Map<String, Object>>) bd.board_list(pgmap);
	}

	@Override
	public int post_delete(List<String> delete_list) {
		return bd.post_delete(delete_list);
	}

	@Override
	public int post_insert(HashMap<String, Object> map) {
		return bd.post_insert(map);
	}

	@Override
	public int post_update(HashMap<String, Object> map) {
		return bd.post_update(map);
	}

	@Override
	public HashMap<String, Object> post_detail(int post_no) {
		return bd.post_detail(post_no);
	}

}
