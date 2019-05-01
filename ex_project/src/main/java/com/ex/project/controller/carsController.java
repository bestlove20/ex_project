package com.ex.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ex.project.service.carsService;


@Controller
public class carsController {

	@Autowired
	carsService cs;
	
	@RequestMapping(value = "carslist")
	public String carslist(Model model) {
		ArrayList<Map<String, Object>> carslist = cs.carslist();
		System.out.println(carslist);
		model.addAttribute("list", carslist);
		return "views/cars/carslist";
	}
	@RequestMapping(value = "cars_selectbox2", method=RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public Map<String, Object> cars_selectbox2(@RequestParam HashMap<String, Object> map, Model model) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ArrayList<Map<String, Object>> carslist = cs.cars_selectbox2(map);
		System.out.println("carslist = "+carslist);
		
		resultMap.put("carslist", carslist);
		return resultMap;
	}
	@RequestMapping(value = "cars_selectbox3", method=RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public Map<String, Object> cars_selectbox3(@RequestParam HashMap<String, Object> map, Model model) throws Exception {
		System.out.println(map.get("CARS_MODEL"));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ArrayList<Map<String, Object>> carslist = cs.cars_selectbox3(map);
		System.out.println("carslist = "+carslist);
		
		resultMap.put("carslist", carslist);
		return resultMap;
	}
	@RequestMapping(value = "cars_list", method=RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public Map<String, Object> cars_list(@RequestParam HashMap<String, Object> map, Model model) throws Exception {
		System.out.println(map.get("CARS_COMPANY"));
		System.out.println(map.get("CARS_MODEL"));
		System.out.println(map.get("CARS_MODEL_DETAILS"));
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ArrayList<Map<String, Object>> carslist = cs.cars_postlist(map);
		System.out.println("carslist = "+carslist);
		
		resultMap.put("carslist", carslist);
		return resultMap;
	}
	@RequestMapping(value = "node")
	public String node() {
		return "views/node";
	}
}
