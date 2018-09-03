package com.scit.doujo.work;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.workDao;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.work.memo;



@Controller
public class WorkController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/goWork1", method = RequestMethod.GET)
	public String goWork1(String eventtitle, HttpSession session) {
		System.out.println(eventtitle);
		session.setAttribute("eventtitle", eventtitle);
		return "/work/work";
	}
	@RequestMapping(value = "/goNews", method = RequestMethod.GET)
	public String goNews(String type, HttpSession hs, Model model) {
		workDao um= sqlSession.getMapper(workDao.class);
		member m = (member)hs.getAttribute("member");
		String userid = m.getId();
		List<memo> result2 = um.allMemo(userid);
		model.addAttribute("mlist", result2);
		System.out.println(type);
		hs.setAttribute("type",type);
		return "/work/news";			
	}
	@RequestMapping(value = "/goNewsMap", method = RequestMethod.GET)
	public String goNewsMap() {
		return "/work/newsMap";			
	}
	@RequestMapping(value = "/saveMemo", method = RequestMethod.POST)
	public @ResponseBody String saveTodayMemo(String text,String startDate, HttpSession hs) {
		workDao wd = sqlSession.getMapper(workDao.class);
		member m = (member) hs.getAttribute("member");
		String userid = m.getId();
		memo a = new memo(userid,text,startDate,startDate);		
		System.out.println(a.toString());
		if(wd.insertMemo(a)==1) {
			return "success";
		}else	return "fail";
	}
	
}
