package com.scit.doujo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.alermDao;
import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.studyDao;

@Controller
public class TestController {
	
	
	@Autowired 
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "gotoSample01", method = RequestMethod.GET)
	public String gotoSample01() {
		return "sample/sample01";
	}
	
	//메인페이지 이동
	@RequestMapping(value = "gotoMain", method = RequestMethod.GET)
	public String gotoMain() {
	
		return "main";
	}
	
	
	
	
	
	
	
	
	
	
	/* alerm에서 수락 ===================================================================*/ 
	@RequestMapping(value = "/friendAlermOkBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermOkBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		friendDao sdao = sqlSession.getMapper(friendDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		System.out.println("friendAlermOkBtn/alerm/"+alerm.toString());
		//DB에 친구등록
		int result1 = 0;
		
		
		
		
		
		
		//해당 알람을 지운다.
		int result2 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+(result1+result2));
		AlermResult.put("result2", "groupAlermOk");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	
	
	/* alerm에서 거절해서 해당 alerm을 테이블에서 지운다. ===================================================================*/ 
	@RequestMapping(value = "/friendAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		//해당 알람을 지운다.
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "friendAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	
}
