package com.ex.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ex.project.service.boardService;
import com.ex.project.service.memberService;
import com.ex.project.service.paging;

@Controller
public class boardController {
	@Autowired
	boardService bs;
	
	
	@RequestMapping(value = "main")
	public String main(String currentPage,Model model, @RequestParam HashMap<String, Object> map) {
		int total = bs.total();
		paging pg = new paging(total, currentPage);
		HashMap<String, Object> pgmap = new HashMap<String, Object>();
		pgmap.put("start", pg.getStart());
		pgmap.put("end", pg.getEnd());
		if (map != null) {
			pgmap.put("search_number", map.get("search_number"));
			pgmap.put("search_txt", map.get("search_txt"));
		}
		ArrayList<Map<String, Object>> boardlist = bs.board_list(pgmap);
		for (int i = 0; i < boardlist.size(); i++) {
			System.out.println(boardlist.get(i));
		}
		model.addAttribute("list", boardlist);
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		
		return "views/board/main";
	}
	@RequestMapping(value = "post_delete")
	@ResponseBody
	public Map<String, Object> post_delete(@RequestParam HashMap<String, Object> map, Model model) {
		List<String> delete_list = new ArrayList<String>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);   // {post_no=10,9,8,7,6}
		String[] arrIdx = map.get("post_no").toString().split(",");
		for (int i=0; i<arrIdx.length; i++) {
			delete_list.add(arrIdx[i]);   
		}
		int result = bs.post_delete(delete_list);
		if (result < 1 ) {
			System.out.println("게시글 삭제 실패");
			resultMap.put("msg", "게시글 삭제 실패");
		} else {
			System.out.println("게시글 삭제 성공");
			resultMap.put("msg", "게시글 삭제 성공");
		}
		return resultMap;
	}
	@RequestMapping(value = "post_view")
	public String post_view () {
		return "views/board/post_view";
	}
	@RequestMapping(value = "post_insert")
	@ResponseBody
	public Map<String, Object> post_insert(@RequestParam HashMap<String, Object> map, Model model) {
		int result = bs.post_insert(map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (result  < 1) {
			System.out.println("게시글 등록 실패");
			resultMap.put("msg", result);
			return resultMap;
		} else {
			System.out.println("게시글 등록 성공");
			resultMap.put("msg", result);
			return resultMap;
		}
	}
	@RequestMapping(value = "post_update")
	@ResponseBody
	public Map<String, Object> post_update(@RequestParam HashMap<String, Object> map, Model model){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map.get("post_no"));
		System.out.println(map.get("subject"));
		System.out.println(map.get("content"));
		int result = bs.post_update(map);
		if (result  < 1) {
			System.out.println("로그인실패");
			resultMap.put("msg", result);
		} else {
			System.out.println("로그인성공");
			resultMap.put("msg", result);
		}
		return map;
	}
	@RequestMapping(value = "post_View")
	public String post_detail(int post_no, Model model) {
		System.out.println(post_no);
		HashMap<String, Object> resultlist = (HashMap<String, Object>) bs.post_detail(post_no);
		System.out.println(resultlist);
		model.addAttribute("list", resultlist);
		System.out.println("넘어가자");
		return "views/board/post_view";
	}
}
