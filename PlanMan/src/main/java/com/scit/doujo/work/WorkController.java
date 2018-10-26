package com.scit.doujo.work;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.memberDao;
import com.scit.doujo.dao.workDao;
import com.scit.doujo.util.naverNews;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;
import com.scit.doujo.vo.work.memo;
import com.scit.doujo.vo.work.wordCloud;
import com.scit.doujo.vo.work.count;
import com.scit.doujo.vo.work.favorites;
import com.scit.doujo.vo.work.friendquery;


import com.scit.doujo.vo.work.keylist;


@Controller
public class WorkController {

	@Autowired
	SqlSession sqlSession;

	/*@RequestMapping(value = "/goWork1", method = RequestMethod.GET)
	public String goWork1(HttpSession hs ,Model model) {
		workDao wd = sqlSession.getMapper(workDao.class);
		member m = (member) hs.getAttribute("member");
		String userid = m.getId();
		List<memo> result= wd.allMemo(userid);
		model.addAttribute("mlist", result);
		return "/work/work";
	}
	@RequestMapping(value = "/goWorkMain", method = RequestMethod.GET)
	public String goWork1() {
		
		return "redirect:mainWork";
	}@RequestMapping(value = "/goWC", method = RequestMethod.GET)//word cloud pageに行くメソッド
	public String goWC() {
		
		return "/work/wordCloud";
	}*/
	@RequestMapping(value = "/mainWork", method = RequestMethod.GET)//work main pageに行くメソッド
	public String mainWork(HttpSession session ,Model model) {
		memberDao manager2=sqlSession.getMapper(memberDao.class);
	      String id=(String) session.getAttribute("memberID");
	      schedule result=new schedule();
	      String eventtype="work";
	      result.setEventtype(eventtype);
	      result.setId(id);
	      SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		  Date date=new Date();
			
		  String countday=formatter.format(date);
		  Calendar cal = Calendar.getInstance();
			
		  int weekday=cal.get(cal.DAY_OF_WEEK);
		  ArrayList<schedule> schList=new ArrayList<>();
		  System.out.println("요일확인"+cal.getTime()+"weekday : "+weekday);
		  switch(weekday) {//今日から1週間のスケジュールを持つコード
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
			
	      naverNews n = new naverNews();
	      ArrayList<String[]> article = n.search("오늘의 주요뉴스", 5);//naver apiを使って今日の主要ニュース5つを持ってきます。
	      workDao wd = sqlSession.getMapper(workDao.class);
	      List<favorites> fa = wd.allFavorites(id);//使用者がお気に入りの記事を全部読みます。
	      model.addAttribute("fcheck",fa);
	      model.addAttribute("article",article );
	      session.setAttribute("schList", schList);
		return "/work/workMain";
	}
	@RequestMapping(value = "/goNews", method = RequestMethod.GET)//ニュース検索サイトへ移動します。
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
	@RequestMapping(value = "/goNewsMap", method = RequestMethod.GET)//ニュースマップのページに移動
	public String goNewsMap() {
		return "/work/newsMap";			
	}
	@RequestMapping(value = "/saveMemo", method = RequestMethod.POST)//日つけ別にメモを保存するためのメソッド
	public @ResponseBody int saveTodayMemo(String text,String startDate, HttpSession hs) {
		workDao wd = sqlSession.getMapper(workDao.class);
		text=text.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");;
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
	
	@RequestMapping(value = "/insertFavorites", method = RequestMethod.POST)//お気に入り保存メソッド
	public @ResponseBody int insertFavorites( favorites fv) {
		workDao um= sqlSession.getMapper(workDao.class);
		int mm = um.insertFavorites(fv);
		return mm;
		
	
	}
	@RequestMapping(value = "/deleteFavorites", method = RequestMethod.POST)//お気に入り削除メソッド

	public @ResponseBody int deleteFavorites( favorites fv) {
		workDao um= sqlSession.getMapper(workDao.class);
		System.out.println(fv.toString());
		int mm = um.deleteFavorites(fv);
		return mm;
		
	}
	@RequestMapping(value = "/loadFavorites", method = RequestMethod.POST)//	お気に入りを持ってくるメソッド
	public @ResponseBody List<favorites> loadFavorites( String id) {
		workDao um= sqlSession.getMapper(workDao.class);
		List<favorites> fa = um.allFavorites(id);
		return fa;
		
	}
	@RequestMapping(value = "/findmemo", method = RequestMethod.POST)//メモを持ってくるメソッド
	public @ResponseBody memo findmemo( Model model,String id, String startdate) {
		workDao um= sqlSession.getMapper(workDao.class);
		memo m = new memo();
		m.setId(id);
		m.setStartdate(startdate);
		memo mm = um.findMemo(m);
		if(mm==null) {
			return null;
		}
		String temp = mm.getMemo();
		temp=temp.replaceAll("<br>", "\r\n");
		System.out.println(temp);
		mm.setMemo(temp);
		return mm;

	}
	@RequestMapping(value = "/deletememo", method = RequestMethod.POST)//メモ削除メソッド
	public @ResponseBody int delete( Model model,String id, String startdate) {
		workDao um= sqlSession.getMapper(workDao.class);
		memo m = new memo();
		m.setId(id);
		m.setStartdate(startdate);
		int result =um.deleteMemo(m);
		return result;

	}
	@RequestMapping(value = "/keylist", method = RequestMethod.GET)//私が検索したキーワードをロードするメソッド
	public @ResponseBody List<keylist> keylist( Model model,String userid) {
		workDao um= sqlSession.getMapper(workDao.class);
		System.out.println(userid);
		List<keylist> result= um.keyList(userid);
		System.out.println(result.size());
		return result;
	}
	@RequestMapping(value = "/findFriend", method = RequestMethod.POST)//私と同じキーワードをたくさん検索した人々を探し出すメソッド
	public @ResponseBody com.scit.doujo.vo.work.count[] findFriend( Model model,String userid, String sex, int age) {
		
		workDao um= sqlSession.getMapper(workDao.class);
		friendquery fq = new friendquery(userid,sex,age);
		count[] result = um.findFriend(fq);
		return result;

	}
	@RequestMapping(value = "/friendKey", method = RequestMethod.GET)//友達のキーワードを検索するメソッド
	public @ResponseBody List<keylist> friendKey( Model model,String id) {
		workDao um= sqlSession.getMapper(workDao.class);
		List<keylist> result= um.friendKeyword(id);
		return result;
		
	}
	@RequestMapping(value = "/deleteKeyword", method = RequestMethod.POST)//私が検索したキーワードを削除するメソッド
	public @ResponseBody String deleteKeyword( Model model,String value,HttpSession hs) {
		String userid = (String) hs.getAttribute("userid");
		workDao um= sqlSession.getMapper(workDao.class);
		if(um.deleteKeyword(userid,value)==1) {
			return "success";
		}else return "fail";
		
		
	}
	
	@RequestMapping(value = "/memodays", method = RequestMethod.POST)//ユーザーが選択した日付のメモを読み込むメソッド
	public @ResponseBody String memodays( Model model,String id, String startdate) {
		workDao um= sqlSession.getMapper(workDao.class);
		String[] days = um.memodays(id);
		String result = "";
		for(int i=0; i<days.length; i++) {
			if(i==days.length-1) {
				result+=days[i];
				continue;
			}
			result+=days[i]+",";
		}
		return result;
	}
	
	
	@RequestMapping(value = "/wordcloud", method = RequestMethod.POST)//ユーザーが検索したキーワードをまとめて表示してくれるword cloudを作るメソッド
	public @ResponseBody List<Map<String,Object>> wordcloud( Model model,String id, String startdate) {
		List<Map<String,Object>> result =new ArrayList<Map<String,Object>>();
		workDao um= sqlSession.getMapper(workDao.class);
		List<wordCloud> wordMap=  um.wordList();
		 for(wordCloud temp:wordMap){
	                Map<String,Object> map=new LinkedHashMap<String,Object>();
	                map.put("name",temp.getKeyword());
	                map.put("weight",temp.getCount());
	                result.add(map);
	            }
		 System.out.println(result.toArray().toString());
		return result;
	}
}
