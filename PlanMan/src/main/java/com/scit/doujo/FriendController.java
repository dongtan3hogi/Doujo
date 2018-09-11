package com.scit.doujo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.util.PageNavigator;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;


@Controller
public class FriendController {
			
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping (value="gotoSearchFriend", method=RequestMethod.GET)
	public String friendMain(HttpSession session, String eventtitle) {
		memberDao manager2=sqlSession.getMapper(memberDao.class);
		String id=(String) session.getAttribute("memberID");
		schedule result=new schedule();
		String eventtype="friend";
		result.setEventtype(eventtype);
		result.setId(id);
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Date date=new Date();
		
		String countday=formatter.format(date);
		Calendar cal = Calendar.getInstance();
		String year=countday.split("-")[0];
		String month=countday.split("-")[1];
		String day=countday.split("-")[2];
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.MONTH-1, Integer.parseInt(month));
		cal.set(Calendar.DATE, Integer.parseInt(day));		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		
		ArrayList<schedule> schList=new ArrayList<>();
		
		switch(weekday) {
		case 1:
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			String weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			String weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 2:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 3:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 5);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 4:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 4);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 5:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 3);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 6:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 2);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 7:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 1);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		default:
			break;
		}
		
		session.setAttribute("schList", schList);
		return "friend/friendMain";
	}
	
	/*@RequestMapping (value="gotoSearchFriend", method=RequestMethod.POST)
	public String gotoSearchFriend() {
		
		return "friend/searchnewfriend";
	}*/
	
	@RequestMapping (value="joinfriend", method=RequestMethod.GET)
	public String joinfriend() {
		
		return "friend/joinfriend";
	}
	
	@RequestMapping (value="joinnewfriend", method=RequestMethod.GET)
	public String joinnewfriend() {
		
		return "friend/friendMain";
	}
		
	@RequestMapping (value="finallyjoinin", method=RequestMethod.POST)
	public String joinfriend(member friend, HttpSession session, Model model) {
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		System.out.println(friend);
		getfriend.updateMember(friend);
		/*getfriend.insertMember(member);*/
		session.setAttribute("member", friend);
		/*String name = (String) session.getAttribute("name");*/
		/*dao.insert(member);*/
		
		return "friend/friendMain";
	}
		
	@RequestMapping(value="/listfriend", method=RequestMethod.GET)
	public String listfriend(
		@RequestParam(value="currentPage", defaultValue="1") int currentPage,
		@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
		@RequestParam(value="searchWord", defaultValue="") String searchWord, 
		Model model, @RequestParam(value="startRecord", defaultValue="1") int startRecord
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem + ", " + searchWord);
	    
	    map.put("searchItem", searchItem);
	    map.put("searchWord", searchWord);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
				
		List<member> list = getfriend.getRecommendFriends(map,rb);	
			System.out.println(list.get(0).toString());
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);
				
		return "friend/friendMain";

	}
	
	@RequestMapping(value="/listMyfriend", method=RequestMethod.GET)
	public String listMyfriend(
			@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
			@RequestParam(value="searchWord", defaultValue="") String searchWord, 
			Model model
	)  
	{
		int currentPage=1;
		System.out.println();
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem + ", " + searchWord);
	    
	    map.put("searchItem", searchItem);
	    map.put("searchWord", searchWord);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getMyFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
				
		List<friend> newlist = getfriend.getMyFriends(map,rb);	
			System.out.println(newlist.size());
		model.addAttribute("newlist", newlist);
		model.addAttribute("navi", navi);

				
		return "friend/friendMain1";

	}
	
	
	
	//프렌드 리스트로 가기
	@RequestMapping (value="tooldFriend", method=RequestMethod.GET)
	public String tooldFriend(HttpSession session, Model model) {
		int currentPage=1;
		Map<String, String> map = new HashMap<>();
	    
	    map.put("searchItem", "");
	    map.put("searchWord", "");
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getMyFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		member a = (member)session.getAttribute("member");
		String id = a.getId();
		map.put("id", id);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
				
		List<friend> newlist = getfriend.getMyFriends(map,rb);	
			System.out.println(newlist.size());
		model.addAttribute("newlist", newlist);
		model.addAttribute("navi", navi);

				
		return "friend/friendMain1";
	}
	
	@RequestMapping (value="/tonewFriend", method=RequestMethod.GET)
	public String tonewFriend() {
		
		return "friend/friendMain";
	}
	@RequestMapping (value="/accept", method=RequestMethod.GET)
	public String accept(String fid,HttpSession hs) {
		member a = (member) hs.getAttribute("member");
		String userid = a.getId();
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		getfriend.acceptFriend(userid, fid);
		getfriend.acceptFriend(fid, userid);

		return "redirect: tooldFriend";

	}
	@RequestMapping(value="/searchRecommendFriends", method=RequestMethod.GET)
	public String listoldfriend(
		@RequestParam(value="currentPage", defaultValue="1") int currentPage,
		@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
		@RequestParam(value="searchWord", defaultValue="") String searchWord, 
		Model model, @RequestParam(value="startRecord", defaultValue="1") int startRecord,
		HttpSession hs
	)  
	{
		Map<String, String> map = new HashMap<>();
	    map.put("searchItem", searchItem);
	    map.put("searchWord", searchWord);
	    
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage = 10;
		int pagePerGroup = 5;
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordCount);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		member a= (member) hs.getAttribute("member");
		String userid =a.getId();
		String hobby =a.getHobby();
		String job =a.getJob();
		map.put("meme", userid);
		map.put("meme", hobby);
		map.put("meme", job);
		List<member> list = getfriend.getRecommendFriends(map,rb);	
				
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);
				
		return "friend/friendMain";

	}
	
	@RequestMapping (value="chooseOnefriend", method=RequestMethod.POST)
	public @ResponseBody String chooseOnefriend (String id,HttpSession hs) {
		friendDao chooseone = sqlSession.getMapper(friendDao.class);
		member a = (member) hs.getAttribute("member");
		String userid = a.getId();
		friend check = chooseone.checkFriend(userid, id);
		if(check !=null) {
			return "already";
		}
		int result = chooseone.insert(userid, id);
		chooseone.beInserted(userid,id);
		return "result";
	}
	
	@RequestMapping (value="friend2", method=RequestMethod.GET)
	public String friend2() {
		
		return "friend/friendMain2";
	}
	
	@RequestMapping (value="friend3", method=RequestMethod.GET)
	public String friend3() {
		
		return "friend/friendMain3";
	}
	
	
	
	
}