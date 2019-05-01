package com.ex.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class boardDaoImpl implements boardDao {

	@Autowired
	SqlSession session;
	
	

	@Override
	public int total() {
		return session.selectOne("board.total");
	}

	@Override
	public List<Map<String, Object>> board_list(HashMap<String, Object> pgmap) {
		return session.selectList("board.board_list", pgmap);
	}

	@Override
	public int post_delete(List<String> delete_list) {
		return session.delete("board.post_delete", delete_list);
	}

	@Override
	public int post_insert(HashMap<String, Object> map) {
		return session.insert("board.post_insert", map);
	}

	@Override
	public int post_update(HashMap<String, Object> map) {
		return session.update("board.post_update", map);
	}

	@Override
	public HashMap<String, Object> post_detail(int post_no) {
		return session.selectOne("board.post_View", post_no);
	}

}
