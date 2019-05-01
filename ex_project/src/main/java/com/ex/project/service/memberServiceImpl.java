package com.ex.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ex.project.dao.memberDao;

@Service
public class memberServiceImpl implements memberService{

	@Autowired
	memberDao md;

	@Override
	public HashMap<String, Object> login(HashMap<String, Object> map) {
		return md.login(map);
	}

	
}
