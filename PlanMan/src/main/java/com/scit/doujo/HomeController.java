package com.scit.doujo;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.memberDao;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;


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
	
	//회원아이디 중복 확인
	@RequestMapping(value = "idcheck", method=RequestMethod.GET)
	public @ResponseBody String idcheck(String id){
		System.out.println(id);
		memberDao manager = sqlSession.getMapper(memberDao.class);
		String result =manager.idDoubleCheck(id);
			
		return result;			
	}
		
	//회원등록완료
	@RequestMapping(value = "insertMember", method=RequestMethod.POST)
	public String insertMember(member vo){
		
		if(vo.getNickname().length()==0) {			
			String data=vo.getId();
			vo.setNickname(data);
		}
		System.out.println(vo);
		memberDao manager = sqlSession.getMapper(memberDao.class);
		int result = manager.insertMember(vo);
		System.out.println(result);
		return "redirect:/";
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
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//스케쥴 입력하기
	@RequestMapping(value = "addschdule", method = RequestMethod.POST)
	public @ResponseBody String addschdule(schedule vo, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println(vo.toString());
		int result=manager.addschdule(vo);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
}

