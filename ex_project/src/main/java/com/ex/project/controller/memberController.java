package com.ex.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ex.project.service.memberService;

@Controller
public class memberController {

	
	@Autowired
	memberService ms;
	
	@RequestMapping(value ="login_page")
	public String login_page() {
		return "views/member/login";
	}
	@RequestMapping(value = "login")
	public String login(@RequestParam HashMap<String, Object> map, HttpSession session) {
		HashMap<String, Object> resultmap = ms.login(map);
		
		if (resultmap  == null) {
			return "views/member/login";
		} else {
			session.setAttribute("member_map", resultmap);
			return "redirect:main";
		}
	}
	
	/*@RequestMapping(value = "연습 ")
	public String 연습(HttpServletRequest request) {
		System.out.println(request.getParameter("search_number"));
		System.out.println(request.getParameter("search_txt"));
		String search_number = request.getParameter("search_number");		// request.getParameter(""); http 요청의 파라미터 값을 얻기위해 사용하는 메소드 
		String search_txt = request.getParameter("search_txt");
		
		
		다른 곳으로 정보를 넘겨주기 위해서 request 객채의 속성 attribute 를 사용한다.
		서블릿에서 request.setAttribute("hobby", strHobby);
		jsp에서 <% String strHobby = (String) request.getAttribute("hobby");%> 로 속성을 얻는다.
		setAttribute(), getAttribute()에서 속성 값으로 사용하는 타입은 Object 이다.                        // 형변환을 위해 앞에 (String)를 붙여준다
		
		String workOrgCd 	= (String)map.get("_worker_org_cd");     // 스트링 형변환
					.toString() 은 그 객체를 설명해주는 문자열을 리턴한다.						 
		Integer.parseInt(); // int 형변환
		
		vo.setCalOrdDate(request.getParameter("close_ymd").replaceAll("-", ""));
		
		
		// 비교   != null   , .equals("");
		if(search_number.equals("")){
			search_number += "%" ;
		}else if (search_txt.equals("")){
			
		} 										// 연습
		
		
		
		// json
		
		JSONObject jObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		List<Map<String,String>> map31 = TS.getList_CATEGORY(map);
		jObj.put("list31",map31);
		jsonArr = JSONArray.fromObject(jObj);
		model.put("result", jsonArr);
		
		
		
		
		
		// 에러 확인			throws Exception
		try {
			ps31TS.saveCreditInf(session, vo);

			model.put("result", "Y");
		} catch (Exception e) {
			//System.out.println(e.toString());

			if(logger.isDebugEnabled()) {
				logger.debug(e.getMessage());
			}
			model.put("result", "N");
		}
		
		
		
		
		// ex
		
//		List<HashMap<String,String>> acctlist = ms.getIncomeAcctcode();  // 데이터 가져오기
		
		//acctlist에서 대메뉴 따기
		Map<String,String> largeMenu = new HashMap<String,String>();
		for(HashMap<String,String> test : acctlist){
			String test2 = test.get("ACCTNAME").toString();
			String test3 = test.get("ACCTCODE").toString().substring(0,5);
			if(test2.contains("_")){
				String[] temp = test2.split("_");
				largeMenu.put(test3,temp[0]);
			}else if(test2.contains("-")){
				String[] temp = test2.split("-");
				largeMenu.put(test3,temp[0]);
			}else{
				largeMenu.put(test3,test2);
			}
		}
//		String tempString = JSONArray.fromObject(largeMenu).toString();
		StringBuffer sb = new StringBuffer();
//		sb.append(tempString);
		String sbtoString = sb.toString()
				.replace(",","},{")
				.replace(":",",\"ACCTNAME\":")
				.replace("{","{\"ACCTCODE\":");
				
				
				
				
				
		  DataMap map = CommUtil.makeDataMap(request);
	      
	      String CRUD[] = map.getString("CRUD", "").split(",");
	      String ENTCTMJ_CD_D[] = map.getString("ENTCTMJ_CD_D", "").split(",");
	      String OUTCTMJ_CD_D[] = map.getString("OUTCTMJ_CD_D", "").split(",");
	      String PM_CD_D[] = map.getString("PM_CD_D", "").split(",");
	      String CONV_QTY_D[] = map.getString("CONV_QTY_D", "").split(",");
	      String SLIP_NO_D[] = map.getString("SLIP_NO_D", "").split(",");
	      String TRAN_FLAG_D[] = map.getString("TRAN_FLAG_D", "").split(",");
	      String SUP_YMD[] = map.getString("SUP_YMD", "").split(",");
	      String _worker_pers_no = request.getParameter("_worker_pers_no");
	      int LENGTH = Integer.parseInt(request.getParameter("LENGTH"));
	      
	      List<Map> list = new ArrayList<Map>();
	      for(int i=0; i<LENGTH; i++){
	    	  HashMap<String, String> hMap = new HashMap<String, String>();
		      hMap.put("ENTCTMJ_CD", ENTCTMJ_CD_D[i]);
		      hMap.put("OUTCTMJ_CD", OUTCTMJ_CD_D[i]);
		      hMap.put("PM_CD", PM_CD_D[i]);
		      hMap.put("CONV_QTY", CONV_QTY_D[i]);
		      hMap.put("SLIP_NO", SLIP_NO_D[i]);
		      hMap.put("TRAN_FLAG", TRAN_FLAG_D[i]);		      
		      hMap.put("_worker_pers_no", _worker_pers_no);
		      hMap.put("_worker_org_cd", "0001");
		      hMap.put("ENTSLIP_TP", 	"MEND");
		 	  hMap.put("OUTSLIP_TP", 	"MRND");
		 	  hMap.put("CTMJ_TP", 		"M");
		 	  hMap.put("SUP_YMD", SUP_YMD[i].replaceAll("-", ""));
		      
		      list.add(hMap);
	      }
	      
		  String result = service.doMat11407_CF(list);		
		
		
		return "";
	}*/
	
	
}
