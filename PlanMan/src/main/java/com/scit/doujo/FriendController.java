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
import com.scit.doujo.util.PageNavigator2;
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
		int weekday=cal.get(cal.DAY_OF_WEEK);
		
		ArrayList<schedule> schList=new ArrayList<>();
		
		switch(weekday) {
		case 1:
			String weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			String weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 2:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 6);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 3:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 5);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 4:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 4);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 5:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 3);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 6:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 2);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 7:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 1);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday);
			cal.add(cal.DATE, -6);
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
	public String listoldfriends(
			@RequestParam(value="currentPage2", defaultValue="1") int currentPage2,
			@RequestParam(value="searchItem2", defaultValue="id") String searchItem2, 
			@RequestParam(value="searchWord2", defaultValue="") String searchWord2, 
			Model model, 
			@RequestParam(value="startRecord2", defaultValue="1") int startRecord2
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem2 + ", " + searchWord2);
	    
	    map.put("searchItem2", searchItem2);
	    map.put("searchWord2", searchWord2);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount2 = getfriend.getMyFriendsCount(map);
		
		int countPerPage2 = 10;
		int pagePerGroup2 = 5;
		
		PageNavigator2 navi = new PageNavigator2(countPerPage2, pagePerGroup2, currentPage2, totalRecordCount2);
		RowBounds rb = new RowBounds(navi.getstartRecord2(), navi.getCountPerPage());
				
		List<friend> newlist = getfriend.getMyFriends(map,rb);	
			System.out.println(newlist.get(0).toString());
		model.addAttribute("newlist", newlist);
		model.addAttribute("searchWord2", searchWord2);
		model.addAttribute("searchItem2", searchItem2);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage2", currentPage2);
				
		return "friend/friendList";

	}
	
	@RequestMapping(value="/searchMyfriend", method=RequestMethod.GET)
	public String searchMyfriend(
			@RequestParam(value="currentPage2", defaultValue="1") int currentPage2,
			@RequestParam(value="searchItem2", defaultValue="id") String searchItem2, 
			@RequestParam(value="searchWord2", defaultValue="") String searchWord2, 
			Model model, 
			@RequestParam(value="startRecord2", defaultValue="1") int startRecord2
	)  
	{
		Map<String, String> map = new HashMap<>();
	    System.out.println(searchItem2 + ", " + searchWord2);
	    
	    map.put("searchItem2", searchItem2);
	    map.put("searchWord2", searchWord2);
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		int totalRecordCount2 = getfriend.getRecommendFriendsCount(map);
		
		int countPerPage2 = 10;
		int pagePerGroup2 = 5;
		
		PageNavigator2 navi = new PageNavigator2(countPerPage2, pagePerGroup2, currentPage2, totalRecordCount2);
		RowBounds rb = new RowBounds(navi.getstartRecord2(), navi.getCountPerPage());
				
		List<member> oldlist = getfriend.getRecommendFriends(map,rb);	
			System.out.println(oldlist.get(0).toString());
		model.addAttribute("oldlist", oldlist);
		model.addAttribute("searchWord2", searchWord2);
		model.addAttribute("searchItem2", searchItem2);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage2", currentPage2);
				
		return "friend/friendList";

	}
	
	//프렌드 리스트로 가기
	@RequestMapping (value="tooldFriend", method=RequestMethod.GET)
	public String tooldFriend(HttpSession session, Model model) {
		String id = (String)session.getAttribute("memberID");
		friendDao getfriend = sqlSession.getMapper(friendDao.class);
		List<member> friendsInfo = getfriend.selectFriendList(id);
		model.addAttribute("friendsInfo", friendsInfo);
		return "friend/friendList";
	}
	
	@RequestMapping (value="tonewFriend", method=RequestMethod.GET)
	public String tonewFriend() {
		
		return "friend/friendMain";
	}
	
	@RequestMapping(value="/searchRecommendFriends", method=RequestMethod.GET)
	public String listoldfriend(
		@RequestParam(value="currentPage", defaultValue="1") int currentPage,
		@RequestParam(value="searchItem", defaultValue="id") String searchItem, 
		@RequestParam(value="searchWord", defaultValue="") String searchWord, 
		Model model, @RequestParam(value="startRecord", defaultValue="1") int startRecord
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
				
		List<member> list = getfriend.getRecommendFriends(map,rb);	
				
		System.out.println(list);
		System.out.println(list.get(0).toString());
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
		
		int result = chooseone.insert(userid, id);
		System.out.println("result : "+result);
		
		return "";
	}
	
	@RequestMapping (value="friend2", method=RequestMethod.GET)
	public String friend2() {
		
		return "friend/friendMain2";
	}
	
	
	
	
}