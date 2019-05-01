package com.ex.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class memberDaoImpl implements memberDao{

	@Autowired
	SqlSession session;

	@Override
	public HashMap<String, Object> login(HashMap<String, Object> map) {
		return session.selectOne("member.login", map);
	}

}
