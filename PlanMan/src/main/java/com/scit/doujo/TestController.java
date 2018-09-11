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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
