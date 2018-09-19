package com.scit.doujo;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.util.MsFaceAPI;
import com.scit.doujo.util.PageNavigator;
import com.scit.doujo.util.work_PageNavi;
import com.scit.doujo.vo.board;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;


@Controller
public class FriendController {
			
	@Autowired
	SqlSession sqlSession;
	
	@Component
	public class HelloComponent {

	private ArrayList<String[]> articles;
	private void setValue(ArrayList<String[]> hello){
	    articles = hello;
	    
	}
	public ArrayList<String[]> getStaticHello(){
	    return articles; // spring.profiles.active is default
	}
	public ArrayList<String[]> page(  int page) {
		int size = (articles.size()+3)/3;
		
		ArrayList<String[]> result=new ArrayList<String[]>();
		if(page==size) {
			for(int a=(page-1)*3; a<articles.size(); a++) {
				result.add(articles.get(a));
			}
		}
		else {
		for(int a=(page-1)*3; a<page*3; a++) {
			result.add(articles.get(a));
		}
		}
		return result;
	}
	}
	HelloComponent article = new HelloComponent();
	
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
		
		memberDao manager2=sqlSession.getMapper(memberDao.class);
		
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

				
		return "friend/friendMain1";
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
		map.put("meme", userid);
		List<member> list = getfriend.getRecommendFriends(map,rb);	
				
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);
				
		return "friend/friendMain";
	}
	@RequestMapping(value = "/searchMeeting", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> searchMeeting(String search) {
		String USER_AGENT = "Mozilla/5.0";

		String request = "http://search.onoffmix.com/event?s=%23" + search;
		System.out.println(request);
		Connection conn = Jsoup.connect(request).header("Content-Type", "application/json;charset=UTF-8")
				.userAgent(USER_AGENT).method(Connection.Method.GET).ignoreContentType(true);

		Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		List<Element> a = doc.select("ul.todayEvent");
		System.out.println(a.size());
		ArrayList<String[]> result = new ArrayList<String[]>();
		for (int i = 0; i < a.size(); i++) {
			String[] ds = new String[3];
			String link = a.get(i).select("li.eventThumbnail a").attr("href");
			String image = a.get(i).select("li.eventThumbnail img").attr("src");
			String title = a.get(i).select("li.eventThumbnail img").attr("alt");
			ds[0] = link;
			ds[1] = image;
			ds[2] = title;

			result.add(ds);
		}
		article.setValue(result);
		work_PageNavi pn = new work_PageNavi(3,1,result.size());
		Map<String ,Object> data = new HashMap<String,Object>();
		ArrayList<String[]> ab = article.page(1);
		data.put("meeting", ab);
		data.put("navi",pn);

		return data;

	}
	@RequestMapping(value = "/goMPage", method = RequestMethod.POST)
	public @ResponseBody Map<String ,Object> goMPage( int value) {
		ArrayList<String[]> ab = article.page(value);
		work_PageNavi pn = new work_PageNavi(3,value,article.getStaticHello().size());
		Map<String ,Object> data = new HashMap<String,Object>();
		data.put("meeting", ab);
		data.put("navi",pn);
		return data;

	}
	

	
	//friendSchedule페이지로 이동하기
	@RequestMapping (value="friendSchedule", method=RequestMethod.GET)
	public String friendSchedule(HttpSession session, Model model) {
		friendDao manager = sqlSession.getMapper(friendDao.class);
		String userid=(String) session.getAttribute("memberID");
		ArrayList<friend> fList=new ArrayList<>();
		fList=manager.selectFriendLsit(userid);
		model.addAttribute("fList", fList);
		return "friend/friendCalendar";
	}
	
	//모임장소 추천으로 이동하기
	@RequestMapping (value="friend3", method=RequestMethod.GET)
	public String friend3(HttpSession hs ,Model model) {
		friendDao bd = sqlSession.getMapper(friendDao.class);
		member a = (member) hs.getAttribute("member");
		String userid = a.getId();
		List<board> flist = bd.selectListBoard(userid);
		for(board ab : flist) {
		String temp =ab.getContent();
		temp=temp.replaceAll("<br>", "\r\n");
		ab.setContent(temp);
		}
		model.addAttribute("allList", flist);
		System.out.println(flist.size());
		return "friend/friendMain3";
	}
	@RequestMapping (value="showFriendList", method=RequestMethod.GET)
	public String showFriendList(HttpSession hs ,Model model) {
		friendDao bd = sqlSession.getMapper(friendDao.class);
		member a = (member) hs.getAttribute("member");
		String userid = a.getId();
		List<board> flist = bd.selectAllBoard(userid);
		for(board ab : flist) {
		String temp =ab.getContent();
		temp=temp.replaceAll("<br>", "\r\n");
		ab.setContent(temp);
		}
		model.addAttribute("flist", flist);

		return "friend/friendMain3";
	}
	@RequestMapping (value="showDetail", method=RequestMethod.GET) //한장의 사진 만 가져오기
	public String showDetail(HttpSession hs ,Model model,String path) {
		friendDao bd = sqlSession.getMapper(friendDao.class);
		board flist = bd.selectOne(path);
		String temp =flist.getContent();
		temp=temp.replaceAll("<br>", "\r\n");
		flist.setContent(temp);
		
		model.addAttribute("oneboard", flist);

		return "friend/friendMain3";
	}
	@RequestMapping("/display.do") //사진 불러오기
	public void getImage(String path,HttpServletRequest req, HttpSession session, HttpServletResponse res, @RequestParam HashMap<String, String> map) throws Exception {
	      String UPLOADPATH = "C:\\Doujo\\Doujo\\images\\"+path;
		String realFile = "C:\\\\Doujo\\\\Doujo\\\\images\\\\";
		String fileNm = path.split("_")[0];
		System.out.println(path.split("\\.")[0]);
		String ext = path.split("\\.")[1];
		BufferedOutputStream out = null;
		InputStream in = null;
		try {
			res.setContentType("image/."+ext);
			res.setHeader("Content-Disposition", "inline;filename="+fileNm );
			File file = new File(realFile);
			if(file.exists()){
				in = new FileInputStream(new File(UPLOADPATH));
				out = new BufferedOutputStream(res.getOutputStream());
				int len;
				byte[] buf = new byte[1024];
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
			}
			} catch (Exception e) {
		} finally {
			if(out != null){ out.flush(); }
			if(out != null){ out.close(); }
			if(in != null){ in.close(); }
		}
		
	}
	   @RequestMapping(value="/saveboard", method=RequestMethod.POST)
	   public String writeboard(board board, MultipartFile upload, HttpSession session) {
	      System.out.println(board.toString());
		   System.out.println("업로드 파일 :" + upload);
	      String UPLOADPATH = "C:\\Doujo\\Doujo\\images\\";
	      String text = board.getContent();
			text=text.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
			board.setContent(text);
	      UUID uuid=UUID.randomUUID();
			String saveFilename=uuid+"_"+upload.getOriginalFilename();
			File saveFile=new File(UPLOADPATH, saveFilename);
			String originalfile = upload.getOriginalFilename();
		      board.setOriginalfile(originalfile);
		      board.setSavedfile(saveFilename);
			try {
				upload.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MsFaceAPI fpi = new MsFaceAPI();
			String faceResult =fpi.getImgInfo(saveFile);
			JSONParser jParser = new JSONParser();
			JSONObject jObject = new JSONObject();
			JSONArray jArray = new JSONArray();
			try {
				double happiness=0.0;
				double neutral=0.0;
				double sadness=0.0;
				double surprise=0.0;
				jArray = (JSONArray)jParser.parse(faceResult);
				for(int i=0; i<jArray.size(); i++) {
					jObject = (JSONObject)jArray.get(i);
					jObject = (JSONObject) jObject.get("faceAttributes");
					jObject = (JSONObject) jObject.get("emotion");
					happiness +=Double.parseDouble(jObject.get("happiness").toString());
					neutral +=Double.parseDouble(jObject.get("neutral").toString());
					sadness +=Double.parseDouble(jObject.get("sadness").toString());
					surprise +=Double.parseDouble(jObject.get("surprise").toString());
				}
				System.out.println("행복"+happiness+"중립"+neutral+"슬픔:"+sadness+"놀람:"+surprise);
				happiness /=(double)jArray.size();
				neutral /=(double)jArray.size();
				sadness /=(double)jArray.size();
				surprise /=(double)jArray.size();
				System.out.println("행복"+happiness+"중립"+neutral+"슬픔:"+sadness+"놀람:"+surprise);
				happiness = (double)Math.round(happiness*1000)/1000.0;
				neutral = (double)Math.round(neutral*1000)/1000.0;
				sadness = (double)Math.round(sadness*1000)/1000.0;
				surprise = (double)Math.round(surprise*1000)/1000.0;
				board.setHappiness(happiness);	
				board.setNeutral(neutral);
				board.setSadness(sadness);
				board.setSurprise(surprise);
				System.out.println("행복"+happiness+"중립"+neutral+"슬픔:"+sadness+"놀람:"+surprise);
			} catch (Exception e) {
				e.printStackTrace();
			}
			friendDao mapper = sqlSession.getMapper(friendDao.class);
		      int result = mapper.insertBoard(board);
		      if(result==1){System.out.println("게시판 등록 성공");}
			return "redirect:friend3";
	  
	   }

		@RequestMapping (value="moreboard", method=RequestMethod.POST)
		public @ResponseBody List<board> moreboard (int number,HttpSession hs) {
			friendDao chooseone = sqlSession.getMapper(friendDao.class);
			member a = (member) hs.getAttribute("member");
			String userid = a.getId();
			int first = number*3+1;
			int second = (number+1)*3;
			
			List<board> flist = chooseone.boardpaging(userid, first, second);
			System.out.println(flist.size());
			
			return flist;
		}
		@RequestMapping (value="morelist", method=RequestMethod.POST)
		public @ResponseBody List<board> morelist (int number,HttpSession hs) {
			friendDao chooseone = sqlSession.getMapper(friendDao.class);
			member a = (member) hs.getAttribute("member");
			String userid = a.getId();
			int first = number*30+1;
			int second = (number+1)*30;
			
			List<board> flist = chooseone.boardpaging(userid, first, second);
			System.out.println(flist.size());
			
			return flist;
		}
	
	
}