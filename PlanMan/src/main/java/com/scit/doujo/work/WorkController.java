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
import com.scit.doujo.vo.work.friend;

import com.scit.doujo.vo.work.friendquery;


import com.scit.doujo.vo.work.keylist;







@Controller
public class WorkController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/goWork1", method = RequestMethod.GET)
	public String goWork1(HttpSession hs ,Model model) {
		workDao wd = sqlSession.getMapper(workDao.class);
		member m = (member) hs.getAttribute("member");
		String userid = m.getId();
		List<memo> result= wd.allMemo(userid);
		model.addAttribute("mlist", result);
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
	public @ResponseBody int saveTodayMemo(String text,String startDate, HttpSession hs) {
		workDao wd = sqlSession.getMapper(workDao.class);
		member m = (member) hs.getAttribute("member");
		String userid = m.getId();
		memo a = new memo(userid,text,startDate,startDate);		
		memo mm = wd.findMemo(a);
		int i=0;
		if(mm ==null) {
			i = wd.insertMemo(a);
			return i;
		} else {
			if(wd.updateMemo(a)) return 3;
			else return 0;
		}
		
	}
	@RequestMapping(value = "/insertmemo", method = RequestMethod.POST)
	public @ResponseBody int insertmemo( Model model,memo m) {
		workDao um= sqlSession.getMapper(workDao.class);
		memo mm = um.findMemo(m);
		int i=0;
		if(mm ==null) {
			i = um.insertMemo(m);
			return i;
		} else {
			if(um.updateMemo(m)) return 3;
			else return 0;
		}
		
	}
	@RequestMapping(value = "/findmemo", method = RequestMethod.POST)
	public @ResponseBody memo findmemo( Model model,String id, String startdate) {
		workDao um= sqlSession.getMapper(workDao.class);
		memo m = new memo();
		m.setId(id);
		m.setStartdate(startdate);
		memo mm = um.findMemo(m);
		return mm;

	}
	@RequestMapping(value = "/deletememo", method = RequestMethod.POST)
	public @ResponseBody int delete( Model model,String id, String startdate) {
		workDao um= sqlSession.getMapper(workDao.class);
		memo m = new memo();
		m.setId(id);
		m.setStartdate(startdate);
		int result =um.deleteMemo(m);
		return result;

	}
	@RequestMapping(value = "/keylist", method = RequestMethod.GET)
	public @ResponseBody List<keylist> keylist( Model model,String userid) {
		workDao um= sqlSession.getMapper(workDao.class);
		System.out.println(userid);
		List<keylist> result= um.keyList(userid);
		System.out.println(result.size());
		return result;
	}
	@RequestMapping(value = "/findFriend", method = RequestMethod.GET)
	public @ResponseBody com.scit.doujo.vo.work.friend[] findFriend( Model model,String userid, String sex, int age) {
		
		workDao um= sqlSession.getMapper(workDao.class);
		friendquery fq = new friendquery(userid,sex,age);
		friend[] result = um.findFriend(fq);
		return result;

	}
	@RequestMapping(value = "/friendKey", method = RequestMethod.GET)
	public @ResponseBody List<keylist> friendKey( Model model,String id) {
		workDao um= sqlSession.getMapper(workDao.class);
		List<keylist> result= um.friendKeyword(id);
		return result;
		
	}
	@RequestMapping(value = "/deleteKeyword", method = RequestMethod.POST)
	public @ResponseBody String deleteKeyword( Model model,String value,HttpSession hs) {
		String userid = (String) hs.getAttribute("userid");
		workDao um= sqlSession.getMapper(workDao.class);
		if(um.deleteKeyword(userid,value)==1) {
			return "success";
		}else return "fail";
		
		
	}
}
