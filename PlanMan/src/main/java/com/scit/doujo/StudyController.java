package com.scit.doujo; 
 
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map; 
 
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.scit.doujo.dao.alermDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.dao.studyDao;
import com.scit.doujo.util.PageNavigator;
import com.scit.doujo.util.Selenium;
import com.scit.doujo.vo.schedule;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.bind.annotation.ResponseBody; 
 
@Controller 
public class StudyController { 
 
	@Autowired 
	SqlSession sqlSession; 
	 
	@RequestMapping(value = "/gotoQuizMake", method = RequestMethod.GET) 
	public String goquizMake(HttpSession hs, Model model) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID"); 
		System.out.println(id); 
		Map<String, Map<String, String>> recordMap = new HashMap<>(); 
		ArrayList<Map<String, String>> recordList = dao.selectAllQuizrecordlist(id); 
		 
		 
		model.addAttribute("recordList", recordList); 
		return "study/quizMake"; 
	} 
	 
	@RequestMapping(value = "/quizTypeChange", method = RequestMethod.POST) 
	public @ResponseBody String quiztypechange(String type) { 
		String result = "multiplechoice"; 
		System.out.println("[test][quiztypechange]"+type); 
		 
		if(type.equals("shortanswer")) { 
			result = "multiplechoice"; 
		} else if(type.equals("multiplechoice")) { 
			result = "shortanswer"; 
		} 
		 
		return result; 
	} 
	 
	 
	 
	 
	@RequestMapping(value = "/quizInsert", method = RequestMethod.POST) 
	public @ResponseBody Map quizinsert(@RequestBody Map<String, String> quiz, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		quiz.put("id", id);
		Map<String, String> resultMap = new HashMap<>(); 
		 
		System.out.println("quizInsert/quiz/"+quiz.toString());
		//System.out.println(quiz.get("answernumber")); 
		if(quiz.get("type").equals("multiplechoice")) { 
			int result = dao.insertMQuiz(quiz); 
		} else { 
			int result = dao.insertJQuiz(quiz); 
		} 
		 
		 
		if(quiz.get("quizrecordname").equals("normal")) { 
			String quizrecordcode = id + quiz.get("quizrecordname"); 
			if(dao.findQuizrecordlist(quizrecordcode)<=0) { 
				quiz.put("quizrecordcode", quizrecordcode); 
				dao.insertQuizrecordlist(quiz); 
			} 
		} 
		 
		
		if(quiz.get("quizrecordname").equals("new")) { 
			String quizrecordcode = id + quiz.get("newrecord"); 
			quiz.put("quizrecordcode", quizrecordcode); 
			quiz.put("quizrecordname", quiz.get("newrecord")); 
			 
			if(dao.findQuizrecordlist(quizrecordcode)>0) { 
			 
			} else { 
				dao.insertQuizrecordlist(quiz); 
				resultMap.put("newRecordName", quiz.get("quizrecordname")); 
			} 
		 
		} else { 
			quiz.put("quizrecordcode",id+quiz.get("quizrecordname")); 
		} 
		 
		 
		quiz.put("num", ""+dao.findMaxQuizseq(quiz)); 
		dao.insertQuizrecord(quiz); 
		 
		 
		resultMap.put("success", "Insert the Quiz"); 
		 
		return resultMap; 
	} 
	 
	 
	 
	 
 
	 
	 
	 
	 
	 
	 
	@RequestMapping(value = "/gotoQuiz", method = RequestMethod.GET) 
	public String gorecordsolve(Model model, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		 
		Map<String,ArrayList<Map<String, String>>> allMap = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = dao.selectAllQuizrecordlist(id); 
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		System.out.println("gotoQuiz/recordList/"+recordList.toString());
		
		
		allMap.put("recordList", recordList);
		
		model.addAttribute("allMap",allMap);
		
		return "study/quizSolve"; 
	} 
	 
	
	
	@RequestMapping(value = "/getQuizSet", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> getQuizSet(@RequestBody Map<String, String> quizSet, HttpSession hs,
			@RequestParam(value="page", defaultValue="1") int page) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		ArrayList<Map<String,String>> quizList = new ArrayList<>(); 
		Map<String, Map<String,String>> quizMap = new HashMap<>(); 
		
		String set = ""; 
		String name = ""; 
		String id = "";
		int countPerPage = 5;
		int pagePerGroup = 1;
		int total = 0;
		id = (String)hs.getAttribute("memberID"); 
		
		//System.out.println("getQuizSet/quizset"+quizSet.toString());
		if(quizSet.containsKey("select")||quizSet.get("select")!=null) {
			String select = quizSet.get("select");
			set = select.substring(0, 1); 
			name = select.substring(1); 
		} else {
			set = quizSet.get("set");
			name = quizSet.get("name");
			page = Integer.parseInt(quizSet.get("page"))+1;
		}
		quizSet.put("id", id);
		//System.out.println(set +", "+ name +", "+ page);
		
		
		quizSet.put("quizrecordcode", id+name); 
		total = dao.countRecordQuiz(quizSet);
		System.out.println("total"+total);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		quizList = dao.selectRecordQuiz(quizSet, rb); 
		
		System.out.println("total"+total);
		int count = 0;
		for (Map<String, String> map : quizList) { 
			map.put("name", name);
			map.put("set", set);
			map.put("page", ""+page);
			quizMap.put(""+count, map);
			count++;
		} 
		 
		System.out.println("[getQuizSet]quizMap.size: "+quizMap.size()); 
		return quizMap; 
	} 
	
	
	 
	@RequestMapping(value = "/grading", method = RequestMethod.POST) 
	public @ResponseBody Map grading(@RequestBody Map<String, String> solveSet , HttpSession hs) { 
		Map<String, String> resultMap = new HashMap<>(); 
		String result = ""; 
		String id = (String)hs.getAttribute("memberID"); 
		System.out.println("grading/solveSeq/"+solveSet.toString());
		
		
		if(solveSet.containsKey("answer1")) {
			int num = Integer.parseInt(solveSet.get("num1"));
			String yourAns = solveSet.get("answer1"); 
			studyDao dao = sqlSession.getMapper(studyDao.class);	  
			Map<String, String> quiz = dao.selectOneQuiz(num); 
			 
			if(quiz.get("TYPE").equals("shortanswer")) { 
				if(quiz.get("ANSWER1").equals(yourAns)) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} else if(quiz.get("TYPE").equals("multiplechoice")) { 
				if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} 
			 
			
			Map<String, String> quizR = new HashMap<>(); 
			quizR.put("id", id); 
			quizR.put("num", ""+num); 
			String quizrecordname = dao.selectQuizrecordname(quizR); 
			String quizrecordcode = id + quizrecordname; 
			quizR.put("quizrecordcode", quizrecordcode); 
			quizR.put("quizrecordname", quizrecordname); 
			System.out.println(quizR.toString()); 
			 
			if(result.equals("CORRECT")) { 
				dao.updateCQuizrecord(quizR); 
				resultMap.put("1", "CORRECT"); 
				 
			} else if(result.equals("WRONG")){ 
				dao.updateWQuizrecord(quizR); 
				resultMap.put("1", "WRONG"); 
			} 
			 
		}
		
		
		
		if(solveSet.containsKey("answer2")) {
			int num = Integer.parseInt(solveSet.get("num2"));
			String yourAns = solveSet.get("answer2"); 
			studyDao dao = sqlSession.getMapper(studyDao.class);	  
			Map<String, String> quiz = dao.selectOneQuiz(num); 
			if(quiz.get("TYPE").equals("shortanswer")) { 
				if(quiz.get("ANSWER1").equals(yourAns)) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} else if(quiz.get("TYPE").equals("multiplechoice")) { 
				if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} 
			 
			
			Map<String, String> quizR = new HashMap<>(); 
			quizR.put("id", id); 
			quizR.put("num", ""+num); 
			String quizrecordname = dao.selectQuizrecordname(quizR); 
			String quizrecordcode = id + quizrecordname; 
			quizR.put("quizrecordcode", quizrecordcode); 
			quizR.put("quizrecordname", quizrecordname); 
			System.out.println(quizR.toString()); 
			if(result.equals("CORRECT")) { 
				dao.updateCQuizrecord(quizR); 
				resultMap.put("2", "CORRECT"); 
				 
			} else if(result.equals("WRONG")){ 
				dao.updateWQuizrecord(quizR); 
				resultMap.put("2", "WRONG"); 
			} 
			 
		}
		
		
		if(solveSet.containsKey("answer3")) {
			int num = Integer.parseInt(solveSet.get("num3"));
			String yourAns = solveSet.get("answer3"); 
			studyDao dao = sqlSession.getMapper(studyDao.class);	  
			Map<String, String> quiz = dao.selectOneQuiz(num); 
			 
			if(quiz.get("TYPE").equals("shortanswer")) { 
				if(quiz.get("ANSWER1").equals(yourAns)) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} else if(quiz.get("TYPE").equals("multiplechoice")) { 
				if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} 
			 
			Map<String, String> quizR = new HashMap<>(); 
			quizR.put("id", id); 
			quizR.put("num", ""+num); 
			String quizrecordname = dao.selectQuizrecordname(quizR); 
			String quizrecordcode = id + quizrecordname; 
			quizR.put("quizrecordcode", quizrecordcode); 
			quizR.put("quizrecordname", quizrecordname); 
			System.out.println(quizR.toString()); 
			 
			if(result.equals("CORRECT")) { 
				dao.updateCQuizrecord(quizR); 
				resultMap.put("3", "CORRECT"); 
				 
			} else if(result.equals("WRONG")){ 
				dao.updateWQuizrecord(quizR); 
				resultMap.put("3", "WRONG"); 
			} 
			 
		}
		 
		
		if(solveSet.containsKey("answer4")) {
			int num = Integer.parseInt(solveSet.get("num4"));
			String yourAns = solveSet.get("answer4"); 
			studyDao dao = sqlSession.getMapper(studyDao.class);	  
			Map<String, String> quiz = dao.selectOneQuiz(num); 
			 
			if(quiz.get("TYPE").equals("shortanswer")) { 
				if(quiz.get("ANSWER1").equals(yourAns)) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} else if(quiz.get("TYPE").equals("multiplechoice")) { 
				if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} 
			 
			
			Map<String, String> quizR = new HashMap<>(); 
			quizR.put("id", id); 
			quizR.put("num", ""+num); 
			String quizrecordname = dao.selectQuizrecordname(quizR); 
			String quizrecordcode = id + quizrecordname; 
			quizR.put("quizrecordcode", quizrecordcode); 
			quizR.put("quizrecordname", quizrecordname); 
			System.out.println(quizR.toString()); 
			 
			if(result.equals("CORRECT")) { 
				dao.updateCQuizrecord(quizR); 
				resultMap.put("4", "CORRECT"); 
				 
			} else if(result.equals("WRONG")){ 
				dao.updateWQuizrecord(quizR); 
				resultMap.put("4", "WRONG"); 
			} 
			
		}
		 
		
		
		
		if(solveSet.containsKey("answer5")) {
			int num = Integer.parseInt(solveSet.get("num5"));
			String yourAns = solveSet.get("answer5"); 
			studyDao dao = sqlSession.getMapper(studyDao.class);	  
			Map<String, String> quiz = dao.selectOneQuiz(num); 
			 
			if(quiz.get("TYPE").equals("shortanswer")) { 
				if(quiz.get("ANSWER1").equals(yourAns)) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} else if(quiz.get("TYPE").equals("multiplechoice")) { 
				if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
					result = "CORRECT"; 
				} else { 
					result = "WRONG"; 
				} 
				 
			} 
			 
			
			Map<String, String> quizR = new HashMap<>(); 
			quizR.put("id", id); 
			quizR.put("num", ""+num); 
			String quizrecordname = dao.selectQuizrecordname(quizR); 
			String quizrecordcode = id + quizrecordname; 
			quizR.put("quizrecordcode", quizrecordcode); 
			quizR.put("quizrecordname", quizrecordname); 
			System.out.println(quizR.toString()); 
			 
			 
			
			if(result.equals("CORRECT")) { 
				dao.updateCQuizrecord(quizR); 
				resultMap.put("5", "CORRECT"); 
				 
			} else if(result.equals("WRONG")){ 
				dao.updateWQuizrecord(quizR); 
				resultMap.put("5", "WRONG"); 
			} 
			 
			
		}
		System.out.println("grading/resultMap/"+resultMap.toString());
		
		return resultMap; 
	} 
	 
	 
	@RequestMapping(value = "/inQuiznumOutQuiz", method = RequestMethod.POST) 
	public @ResponseBody Map inQuiznumOutQuiz(@RequestBody Map<String, String> jsonMap) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		int num = Integer.parseInt(jsonMap.get("select")); 
		Map<String, String> quiz = dao.selectOneQuiz(num); 
		System.out.println(quiz.get("QUESTION")); 
		 
		 
		return quiz; 
	} 
	 
	 
	 
	 
	 
	@RequestMapping(value = "/showQuizList", method = RequestMethod.POST) 
	public @ResponseBody Map showquizlist(@RequestBody Map<String, String> idSet,HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = ""; 
		if(idSet.containsKey("quiz")) { 
			id = idSet.get("id"); 
		} else { 
			id = (String)hs.getAttribute("memberID"); 
		} 
		 
		Map<String,Map<String, Map<String, String>>> maps = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = null;
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		if(dao.countQuizrecordlist(id)>0) { 
			recordList = dao.selectAllQuizrecordlist(id); 
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map); 
			} 
		} 
		
		System.out.println("recordMapSize:"+recordMap.size()); 
		maps.put("recordMap", recordMap); 
		 
		 
		 
		return maps; 
	} 
	 
	 
 
	 
	 
 
	@RequestMapping(value = "/showInQuizSet", method = RequestMethod.POST) 
	public @ResponseBody Map showInQuizset(@RequestBody Map<String, String> selectSet) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		ArrayList<Map<String,String>> quizList = new ArrayList<>(); 
		Map<String, Map<String,String>> quizMap = new HashMap<>(); 
		 
		System.out.println(selectSet.get("select")); 
		String type = selectSet.get("select").substring(0, 1); 
		String name = selectSet.get("select").substring(1); 
		String id = selectSet.get("id"); 
		String num = ""; 


		selectSet.put("quizrecordcode", id+name); 
		System.out.println(selectSet.get("quizrecordcode") + ", " + selectSet.get("id")); 
		quizList = dao.selectAllRecordQuiz(selectSet); 
		
		System.out.println("3."+quizList.size()); 
		for (Map<String, String> map : quizList) { 
			quizMap.put(map.get("NUM"), map); 
		} 
		 
		System.out.println("[showInQuizset]quizMap.size: "+quizMap.size()); 
		return quizMap; 
	} 
	 
	 
	 
	@RequestMapping(value = "/gotoQuizSelect", method = RequestMethod.GET) 
	public String goquizselect(Model model, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID"); 
		 
		Map<String,Map<String, Map<String, String>>> maps = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = null; 
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		 
		if(dao.countQuizrecordlist(id)>0) { 
			recordList = dao.selectAllQuizrecordlist(id); 
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map); 
			} 
		} 
		
		System.out.println("recordMapSize:"+recordMap.size()); 
		 
		model.addAttribute("recordList", recordList); 
		 
		return "study/quizSelect"; 
	} 
	
	
	@RequestMapping(value = "/gotoGroupLobby", method = RequestMethod.GET)
	public  String gogrouplobby() {
		return "study/groupLobby";
	}

	
	
	
	@RequestMapping(value = "/makingGroup", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> makingGroup(@RequestBody Map<String, String> group, HttpSession hs) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		String id = (String)hs.getAttribute("memberID");
		group.put("id", id);
		
		System.out.println("makingGroup/group"+group);
		int ig = gdao.insertGroup(group);
		int slmg =  gdao.selectLastMakeGroupseq(id);
		
		group.put("groupseq", ""+slmg);
		gdao.insertGroupMember(group);
		
		return group;
	}

	
	
	@RequestMapping(value = "/showMyGroup", method = RequestMethod.POST)
	public @ResponseBody Map showMyGroup(@RequestBody Map<String, String> lists, HttpSession hs) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		String id = (String) hs.getAttribute("memberID");
		System.out.println("흠?");
		ArrayList<Map<String,String>> groupList = gdao.selectMyGroup(id);
		
		Map<String, Map<String,String>> groups = new HashMap<>();
		for (Map<String, String> map : groupList) {
			groups.put(map.get("NAME"), map);
		}
		
		System.out.println("흠"+groups.size());
		return groups;
	}
	
	@RequestMapping(value = "/gotoGroup", method = RequestMethod.GET)
	public String gotoGroup(int num, String name, HttpSession hs, Model model) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		String id = (String) hs.getAttribute("memberID");
		System.out.println(id+num+name);
		
		Map<String, String> groupmember = new HashMap<>();
		String sNum = ""+num;
		groupmember.put("id", id);
		groupmember.put("groupseq", sNum);
		groupmember.put("name", name);
		
		int result = gdao.selectGroupmember(groupmember);
		
		if(result<=0) {
			return "group/grouplobby";
		}
		
		String leaderId = gdao.selectOneGroup(num).get("GROUPLEADER");
		//System.out.println("리더아이디"+leaderId);
		groupmember.put("leaderId", leaderId);
		System.out.println("gma"+groupmember.toString());
		model.addAttribute("groupmember", groupmember);
		return "study/groupRoom";
	}
	
	
	@RequestMapping(value = "/searchGroup", method = RequestMethod.POST)
	public @ResponseBody Map searchGroup(@RequestBody Map<String, String> searching, HttpSession hs) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		ArrayList<Map<String, String>> groupList = new ArrayList<>();
		Map<String,Map<String, String>> groupMap = new HashMap<>();
		Map<String, String> search = new HashMap<>();
		
		System.out.println(searching.toString());
		search.put(searching.get("type"), searching.get("search"));
		
		groupList = gdao.selectGroup(search);
		System.out.println(groupList.toString());
		for (Map<String, String> map : groupList) {
			groupMap.put(""+map.get("NUM"), map);
		}
		System.out.println(groupMap.toString());
		return groupMap;
	}
	
	//
	//
	//
	/*  StudyMain   */
	//
	//
	//
	
	
	@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
	public String gotoStudy(String eventtitle, HttpSession session, Model model, Locale locale) {
		memberDao manager2=sqlSession.getMapper(memberDao.class);
		String id=(String) session.getAttribute("memberID");
		schedule result=new schedule();
		String eventtype="study";
		result.setEventtype(eventtype);
		result.setId(id);
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Date date=new Date();
		
		String countday=formatter.format(date);
		Calendar cal = Calendar.getInstance();
		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		
		
		ArrayList<schedule> schList=new ArrayList<>();
		System.out.println("요일확인"+cal.getTime()+"weekday : "+weekday);
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
		
		System.out.println(schList.size());
		
		int did=manager2.didschcount(result);
		int allsch=manager2.allschcount(result);
		System.out.println(did);
		System.out.println(allsch);
		double sucesspercent=((double)did/(double)allsch)*100;
		double failpercent=100-sucesspercent;
		
		System.out.println("성공율"+sucesspercent +"실패율"+failpercent);
		
		model.addAttribute("sucesspercent", sucesspercent);
		model.addAttribute("failpercent", failpercent);
		
		session.setAttribute("schList", schList);
		session.setAttribute("eventtitle", eventtitle);
		return "study/studyMain";
	}
	
	@RequestMapping(value = "/goWord", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String[]> goWord( String type, HttpSession hs) {
		 String aa = "오늘의 "+type+"단어";
			String request = "https://search.naver.com/search.naver?ie=utf8&query="+aa;
		String USER_AGENT = "Mozilla/5.0";
	
         
         Connection conn = Jsoup
                 .connect(request)
                 .header("Content-Type", "application/json;charset=UTF-8")
                 .userAgent(USER_AGENT)
                 .method(Connection.Method.GET)
                 .ignoreContentType(true);
         
         Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}
         List<Element> a =doc.select("a.word");
         List<Element> b = doc.select("p.mean");
         ArrayList<String[]> result = new ArrayList<String[]>();
         for(int i =0; i<a.size(); i++) {
        	 String[] ds = new String[2];
        	 ds[0]= a.get(i).text();
        	 ds[1]= b.get(i).text();
        	 result.add(ds);
         }
		return result;

	}
	
	
	
	@RequestMapping(value = "/gotoQuizSearch", method = RequestMethod.GET) 
	public String gotoQuizSearch(HttpSession hs, Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="search", defaultValue="") String search) {
		if(page<=0) {
			page=1;
		}
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		Map<String, String> searchParameterMap = new HashMap<>();
		searchParameterMap.put("search", search);
		searchParameterMap.put("id", id);
		int countPerPage = 20;
		int pagePerGroup = 5;
		
		System.out.println("2");
		int total = dao.countSearchingQuizrecordlist(searchParameterMap);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		ArrayList<Map<String, String>> searchResultList = dao.selectSearchingQuizrecordlist(searchParameterMap, rb);
		model.addAttribute("navi", navi);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchResultList", searchResultList);
		System.out.println("3");
		return "study/quizSearch"; 
	}
	
	
	@RequestMapping(value = "/doTakeQuizMyFolder", method = RequestMethod.GET) 
	public String doTakeQuizMyFolder(HttpSession hs, Model model, String friendId, String title) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		Map<String, String> SARQ = new HashMap<>();
		ArrayList<Map<String,String>> quizList1 = new ArrayList<>(); 
		Map<String, Map<String,String>> quizMap1 = new HashMap<>(); 
		SARQ.put("quizrecordcode", friendId+title);
		SARQ.put("id", friendId);
		quizList1 = dao.selectAllRecordQuiz(SARQ);
		System.out.println("quizList//"+quizList1.toString());
		
		
		for (Map<String, String> map : quizList1) {
			map.put("type", map.get("TYPE"));
			map.remove("TYPE");
			map.put("teg", map.get("TEG"));
			map.remove("TEG");
			map.put("answer1", map.get("ANSWER1"));
			map.remove("ANSWER1");
			map.put("answer2", map.get("ANSWER2"));
			map.remove("ANSWER2");
			map.put("answer3", map.get("ANSWER3"));
			map.remove("ANSWER3");
			map.put("answer4", map.get("ANSWER4"));
			map.remove("ANSWER4");
			map.put("answernumber", map.get("ANSWERNUMBER"));
			map.remove("ANSWERNUMBER");
			map.put("id", id);
			map.remove("ID");
			map.put("question", map.get("QUESTION"));
			map.remove("QUESTION");
			map.put("quizrecordname", map.get("QUIZRECORDNAME"));
			map.remove("QUIZRECORDNAME");
			map.remove("QUIZRECORDCODE");
			
			if(map.get("type").equals("multiplechoice")) {
				System.out.println(map.toString());
				quizInsertFunction(map, id);
				
				
			}else if(map.get("type").equals("shortanswer")) {
				System.out.println(map.toString());
				quizInsertFunction(map, id);
				
				
			}
		} 
		
		
		
		 
		Map<String,ArrayList<Map<String, String>>> allMap = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = dao.selectAllQuizrecordlist(id); 
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		 
		
		if(dao.countQuizrecordlist(id)>0) {
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map);
				//System.out.println(map.toString());
			} 
		} 
		
		
		allMap.put("recordList", recordList);
		
		
		model.addAttribute("allMap",allMap);
		
		
		
		
		
		
		
		
		return "study/quizSolve"; 
	}
	
	
	
	
	
	
	
	
	public void quizInsertFunction(Map<String, String> quiz, String id) {
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		Map<String, String> resultMap = new HashMap<>(); 
		 
		
		 
		//System.out.println(quiz.get("answernumber")); 
		if(quiz.get("type").equals("multiplechoice")) { 
			int result = dao.insertMQuiz(quiz); 
		} else { 
			int result = dao.insertJQuiz(quiz); 
		} 
		 
		 
		if(quiz.get("quizrecordname").equals("normal")) { 
			String quizrecordcode = id + quiz.get("quizrecordname"); 
			if(dao.findQuizrecordlist(quizrecordcode)<=0) { 
				quiz.put("quizrecordcode", quizrecordcode); 
				dao.insertQuizrecordlist(quiz); 
			} 
		}else {
			quiz.put("quizrecordcode", id + quiz.get("quizrecordname")); 
		}
		 
		int i = dao.countQuizrecordlistForTaking(quiz);
		if(i <= 0) { 
			String quizrecordcode = id + quiz.get("quizrecordname"); 
			quiz.put("quizrecordcode", quizrecordcode); 
			quiz.put("quizrecordname", quiz.get("quizrecordname")); 
			 
			if(dao.findQuizrecordlist(quizrecordcode)>0) { 
			 
			} else { 
				dao.insertQuizrecordlist(quiz); 
				resultMap.put("newRecordName", quiz.get("quizrecordname")); 
			} 
		 
		} else { 
			quiz.put("quizrecordcode",id+quiz.get("quizrecordname")); 
		} 
		 
		 
		quiz.put("num", ""+dao.findMaxQuizseq(quiz)); 
		dao.insertQuizrecord(quiz); 
		 
		 
		resultMap.put("success", "Insert the Quiz"); 	
	}
	
	
	
	
	
	
	@RequestMapping(value = "/inviteGroup", method = RequestMethod.POST)
	public @ResponseBody Map inviteGroup(@RequestBody Map<String, String> idSet, HttpSession hs) {
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		memberDao fdao = sqlSession.getMapper(memberDao.class);
		ArrayList<Map<String, String>> groupList = new ArrayList<>();
		Map<String,Map<String, String>> groupMap = new HashMap<>();
		Map<String, String> resultMap = new HashMap<>();
		
		int check = fdao.idDoubleCheck2(idSet.get("id"));
		if(check<=0) {
			resultMap.put("result", "존재하지 않는 아이디 입니다.");
			groupMap.put("resultMap", resultMap);
			return groupMap;
		}
		
		
		
		System.out.println("inviteGroup/idSet"+idSet.toString());
		int result = sdao.insertGroupMember(idSet);
		if(result>0) {
			resultMap.put("result", "초대성공");
		}else {
			resultMap.put("result", "초대실패");
		}
		groupMap.put("resultMap", resultMap);
		return groupMap;
	}
	
	
	
	/*테스트 ===================================================================*/ 
	@RequestMapping(value = "/sample01", method = RequestMethod.GET) 
	public String sample01() { 
		
		return "sample/sample01"; 
	} 
} 
