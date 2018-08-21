package com.scit.doujo;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.doujo.dao.memberDao;
import com.scit.doujo.vo.member;


@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "home";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "gotoSignIn", method = RequestMethod.GET)
	public String gotoSignIn() {
	
		return "singIn";
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "gotoLogin", method = RequestMethod.GET)
	public String gotoLogin() {
	
		return "login";
	}

	//로그인 페이지로 이동
	@RequestMapping(value = "doLogin", method = RequestMethod.POST)
	public String doLogin(member vo, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		member result=manager.doLogin(vo);
		if(result==null) {
			//로그인 실패시 메인페이지로 이동
			return "redirect:/";
		}else {
			//로그인 성공시 세션에 member로 회원정보 저장
			session.setAttribute("member", result);
			return "main";
		}
	}
	
}
