package com.scit.doujo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.doujo.dao.memberDao;
import com.scit.doujo.vo.schedule;

@Controller
public class StudyMainController {

	@Autowired 
	SqlSession sqlSession; 
	
	@RequestMapping(value = "/studyMAIN", method = RequestMethod.GET)
	public String studyMAIN(Model model, schedule vo, HttpSession session, String eventtitle) {
		memberDao dao = sqlSession.getMapper(memberDao.class);
		//로그인 성공시 세션에 member로 회원정보 저장
		String id=(String) session.getAttribute("memberID");
		Date date = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String today=sdf.format(date);
	    String startdaytime=today+" 00:00";
	    String enddaytime=today+" 23:59";
	    String eventType="study";
	    schedule vo2=new schedule();
	    vo2.setId(id);
	    vo2.setStartdaytime(startdaytime);
	    vo2.setEnddaytime(enddaytime);
	    vo2.setEventtype(eventType);
	    System.out.println(vo2.toString());
		System.out.println(eventtitle);
		return "study/studyMAIN";
	}
	
}
