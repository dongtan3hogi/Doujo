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
import java.util.Map; 
 
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

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
	 
	/*문제만들기 페이지로 이동 ===================================================================*/ 
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
	 
	/*객관식 <--> 주관식 전환기능 ===================================================================*/ 
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
	 
	 
	 
	 
	/*문제 만들기 기능===================================================================*/ 
	@RequestMapping(value = "/quizInsert", method = RequestMethod.POST) 
	public @ResponseBody Map quizinsert(@RequestBody Map<String, String> quiz, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		quiz.put("id", id);
		Map<String, String> resultMap = new HashMap<>(); 
		 
		//insert the Teg 
		String[] tegs = quiz.get("teg").split("#"); 
		Map<String, String> tegMap = new HashMap<>(); 
		if(tegs.length > 0) { 
			for(int i=1; i<tegs.length; i++) { 
				Map<String, String> teg = new HashMap<>(); 
				teg.put("teg", tegs[i]); 
				teg.put("id", id); 
				teg.put("belong", "quiz"); 
				 
				//이미 있는테그면 update로 숫자증가 
				if(dao.findTeg(teg)>0) { 
					teg.put("plus", "plus"); 
					dao.recountTeg(teg); 
					 
				//없는 테그면 새로 추가 
				} else if(dao.findTeg(teg)<=0) { 
					dao.insertTeg(teg); 
				} 
			} 
		} 
		 
		//System.out.println(quiz.get("answernumber")); 
		//문제 넣기 
		if(quiz.get("type").equals("multiplechoice")) { 
			int result = dao.insertMQuiz(quiz); 
		} else { 
			int result = dao.insertJQuiz(quiz); 
		} 
		 
		 
		//list확인하고 없으면 생성 
		//normal이 없었다면 생성 
		if(quiz.get("quizrecordname").equals("normal")) { 
			String quizrecordcode = id + quiz.get("quizrecordname"); 
			if(dao.findQuizrecordlist(quizrecordcode)<=0) { 
				quiz.put("quizrecordcode", quizrecordcode); 
				dao.insertQuizrecordlist(quiz); 
			} 
		} 
		 
		//new였다면 생성 
		if(quiz.get("quizrecordname").equals("new")) { 
			//일단 quizrecordcode를 생성한다. 
			String quizrecordcode = id + quiz.get("newrecord"); 
			quiz.put("quizrecordcode", quizrecordcode); 
			quiz.put("quizrecordname", quiz.get("newrecord")); 
			 
			//quizrecordcode가 이미 존재하는지 확인하고 없을경우 입력한다. 
			if(dao.findQuizrecordlist(quizrecordcode)>0) { 
			 
			} else { 
				dao.insertQuizrecordlist(quiz); 
				resultMap.put("newRecordName", quiz.get("quizrecordname")); 
			} 
		 
		//new가 아닌경우 기존에 존재하는 record에 넣는다.		 
		} else { 
			quiz.put("quizrecordcode",id+quiz.get("quizrecordname")); 
		} 
		 
		 
		// record에 해당문제 기록  
		quiz.put("num", ""+dao.findMaxQuizseq(quiz)); 
		dao.insertQuizrecord(quiz); 
		 
		 
		resultMap.put("success", "Insert the Quiz"); 
		 
		return resultMap; 
	} 
	 
	 
	 
	 
 
	 
	 
	 
	 
	/*문제리스트를 가지고 문제풀기 페이지로 이동하자===================================================================*/ 
	 
	 
	@RequestMapping(value = "/gotoQuiz", method = RequestMethod.GET) 
	public String gorecordsolve(Model model, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID");
		 
		Map<String,ArrayList<Map<String, String>>> allMap = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = dao.selectAllQuizrecordlist(id); 
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> tegList = dao.selectAllTeg(id);  
		Map<String, Map<String, String>> tegMap = new HashMap<>(); 
		 
		//일단 태그와 레코드목록 불러온다.
		
		if(dao.countQuizrecordlist(id)>0) {
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map);
				//System.out.println(map.toString());
			} 
		} 
		if(dao.countTeg(id)>0) {
			for (Map<String, String> map : tegList) { 
				tegMap.put(map.get("TEG"), map); 
				//System.out.println(map.toString());
			} 
		}
		//allMap.put("recordMap", recordMap); 
		//allMap.put("tegMap", tegMap);
		allMap.put("recordList", recordList);
		allMap.put("tegList", tegList);
		
		System.out.println(tegList.size());
		
		model.addAttribute("allMap",allMap);
		
		return "study/quizSolve"; 
	} 
	 
	
	
	/*퀴즈들 가져오기, JSON사용===================================================================*/ 
	@RequestMapping(value = "/getQuizSet", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> getQuizSet(@RequestBody Map<String, String> quizSet, HttpSession hs,
			@RequestParam(value="page", defaultValue="1") int page) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		ArrayList<Map<String,String>> quizList = new ArrayList<>(); 
		Map<String, Map<String,String>> quizMap = new HashMap<>(); 
		
		//필요한 변수 선언
		String set = ""; 
		String name = ""; 
		String id = "";
		int countPerPage = 1;
		int pagePerGroup = 1;
		int total = 0;
		id = (String)hs.getAttribute("memberID"); 
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
		System.out.println(set +", "+ name +", "+ page);
		//teg타입인지 record타입인지 먼저 확인한다. 
		//type이 teg이면 태그를 사용해서 불러온다. 
		
		
		if(set.equals("t")||set.equals("teg")) { 
			quizSet.put("teg", name);
			total = dao.countTegQuiz(quizSet);
			System.out.println("total"+total);
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
			RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			quizList = dao.selectTegQuiz(quizSet, rb);
			
		//type이 record이면 아이디와 레코드코드를 사용해서 불러온다. 
		} else if(set.equals("r")||set.equals("record")) { 
			quizSet.put("quizrecordcode", id+name); 
			total = dao.countRecordQuiz(quizSet);
			System.out.println("total"+total);
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
			RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			quizList = dao.selectRecordQuiz(quizSet, rb); 
		} 
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
	
	
	 
	/*체점하기====================================================================================================================================*/ 
	@RequestMapping(value = "/grading", method = RequestMethod.POST) 
	public @ResponseBody Map grading(@RequestBody Map<String, String> solveSet , HttpSession hs) { 
		Map<String, String> resultMap = new HashMap<>(); 
		String result = ""; 
		String id = (String)hs.getAttribute("memberID"); 
		int num = Integer.parseInt(solveSet.get("num"));
		String yourAns = solveSet.get("answer"); 
		studyDao dao = sqlSession.getMapper(studyDao.class);	  
		Map<String, String> quiz = dao.selectOneQuiz(num); 
		 
		/*정답오답 판정*/ 
		//주관식일 경우 
		if(quiz.get("TYPE").equals("shortanswer")) { 
			if(quiz.get("ANSWER1").equals(yourAns)) { 
				result = "CORRECT"; 
			} else { 
				result = "WRONG"; 
			} 
			 
		//객관식일 경우 
		} else if(quiz.get("TYPE").equals("multiplechoice")) { 
			if(yourAns.equals(quiz.get("ANSWERNUMBER"))) { 
				result = "CORRECT"; 
			} else { 
				result = "WRONG"; 
			} 
			 
		} 
		 
		
		/*정오답 결과 기록*/ 
		//만약 문제를 푼게 최초일 경우 기록을 위한 기본 record생성한다. 
		//추후 회원가입때 발동하는 것 고려. 일단 회원가입안만들었으니 유저아이디는 직접기입 
		Map<String, String> quiz2 = new HashMap<>(); 
		quiz2.put("id", id); 
		quiz2.put("num", ""+num); 
		String quizrecordname = dao.selectQuizrecordname(quiz2); 
		String quizrecordcode = id + quizrecordname; 
		quiz2.put("quizrecordcode", quizrecordcode); 
		quiz2.put("quizrecordname", quizrecordname); 
		System.out.println(quiz2.toString()); 
		 
		/*int normalrecordcount = dao.findQuizrecordlist(quizrecordcode); 
		if(normalrecordcount<=0) { 
			//0���� = ���� = ������ 
			dao.insertQuizrecordlist(quiz); 
		}*/ 
		 
		
		/*퀴즈레코드에 내가 푼 문제가 등록되있는지 확인해서 최초로 푼 문제라면 추가, 이미 풀어봤다면 업데이트를 하자.*/ 
		//먼저 정답일 경우 corr~증가, 오답일 경우 wor~증가. 
		if(result.equals("CORRECT")) { 
			dao.updateCQuizrecord(quiz2); 
			resultMap.put("result", "CORRECT"); 
			 
		} else if(result.equals("WRONG")){ 
			dao.updateWQuizrecord(quiz2); 
			resultMap.put("result", "WRONG"); 
		} 
		 
		//문제이미 풀어봤는지 확인 
		/*int quiznew = dao.findQuizrecord(quiz); 
		if(quiznew<=0) { 
			//0이하 = 없다 = 문제 풀어본 기록 추가 
			dao.insertQuizrecord(quiz); 
			 
		}else if(quiznew>0) { 
			//0이상 = 있다 = 정답&오답 수 증가 
			dao.updateQuizrecord(quiz); 
		}*/ 
		 
		 
		 
		return resultMap; 
	} 
	 
	 
	/*퀴즈하나만 ajax사용해서 가져오기===================================================================*/ 
	@RequestMapping(value = "/inQuiznumOutQuiz", method = RequestMethod.POST) 
	public @ResponseBody Map inQuiznumOutQuiz(@RequestBody Map<String, String> jsonMap) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		int num = Integer.parseInt(jsonMap.get("select")); 
		Map<String, String> quiz = dao.selectOneQuiz(num); 
		System.out.println(quiz.get("QUESTION")); 
		 
		 
		return quiz; 
	} 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	/*아이디가 일치하는 퀴즈레코드들과 퀴즈태그 가져오기===================================================================*/ 
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
		 
		ArrayList<Map<String, String>> tegList = null; 
		Map<String, Map<String, String>> tegMap = new HashMap<>(); 
		 
		//일단 태그와 레코드목록 불러온다. 
		if(dao.countQuizrecordlist(id)>0) { 
			recordList = dao.selectAllQuizrecordlist(id); 
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map); 
			} 
		} 
		if(dao.countTeg(id)>0) { 
			tegList = dao.selectAllTeg(id); 
			for (Map<String, String> map : tegList) { 
				tegMap.put(map.get("TEG"), map); 
			} 
		} 
		System.out.println("recordMapSize:"+recordMap.size()); 
		System.out.println("tegMapSize:"+tegMap.size()); 
		maps.put("recordMap", recordMap); 
		maps.put("tegMap", tegMap); 
		 
		 
		 
		return maps; 
	} 
	 
	 
 
	 
	 
 
	/*퀴즈묶음에 들어있는 퀴즈번호들 가져오기, JSON사용, ID받아와서 사용===================================================================*/ 
	@RequestMapping(value = "/showInQuizSet", method = RequestMethod.POST) 
	public @ResponseBody Map showInQuizset(@RequestBody Map<String, String> selectSet) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);	 
		ArrayList<Map<String,String>> quizList = new ArrayList<>(); 
		Map<String, Map<String,String>> quizMap = new HashMap<>(); 
		 
		//teg타입인지 record타입인지 먼저 확인한다. 
		System.out.println(selectSet.get("select")); 
		String type = selectSet.get("select").substring(0, 1); 
		String name = selectSet.get("select").substring(1); 
		String id = selectSet.get("id"); 
		String num = ""; 
		//type이 teg이면 태그를 사용해서 불러온다. 
		if(type.equals("t")) { 
			selectSet.put("teg", name); 
			quizList = dao.selectAllTegQuiz(selectSet); 			 

		//type이 record이면 아이디와 레코드코드를 사용해서 불러온다. 
		} else if(type.equals("r")) { 
			selectSet.put("quizrecordcode", id+name); 
			System.out.println(selectSet.get("quizrecordcode") + ", " + selectSet.get("id")); 
			quizList = dao.selectAllRecordQuiz(selectSet); 
		} 
		System.out.println("3."+quizList.size()); 
		for (Map<String, String> map : quizList) { 
			quizMap.put(map.get("NUM"), map); 
		} 
		 
		System.out.println("[showInQuizset]quizMap.size: "+quizMap.size()); 
		return quizMap; 
	} 
	 
	 
	 
	/*내가 풀고자 하는 문제를 고르기 위해 TEG와 퀴즈레코드목록 보여주기===================================================================*/ 
	@RequestMapping(value = "/gotoQuizSelect", method = RequestMethod.GET) 
	public String goquizselect(Model model, HttpSession hs) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID"); 
		 
		Map<String,Map<String, Map<String, String>>> maps = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> recordList = null; 
		Map<String,Map<String, String>> recordMap = new HashMap<>(); 
		 
		ArrayList<Map<String, String>> tegList = null; 
		Map<String, Map<String, String>> tegMap = new HashMap<>(); 
		 
		//일단 태그와 레코드목록 불러온다. 
		if(dao.countQuizrecordlist(id)>0) { 
			recordList = dao.selectAllQuizrecordlist(id); 
			for (Map<String, String> map : recordList) { 
				recordMap.put(map.get("NAME"), map); 
			} 
		} 
		if(dao.countTeg(id)>0) { 
			tegList = dao.selectAllTeg(id); 
			for (Map<String, String> map : tegList) { 
				tegMap.put(map.get("TEG"), map); 
			} 
		} 
		System.out.println("recordMapSize:"+recordMap.size()); 
		System.out.println("tegMapSize:"+tegMap.size()); 
		 
		model.addAttribute("recordList", recordList); 
		model.addAttribute("tegList", tegList); 
		 
		return "study/quizSelect"; 
	} 
	 
	
	
	
	
	
	
	
	//
	//
	//
	/*  ChatRoom   */
	//
	//
	//
	
	
	/* 그룹로비로 이동 */
	@RequestMapping(value = "/gotoGroupLobby", method = RequestMethod.GET)
	public  String gogrouplobby() {
		return "study/groupLobby";
	}

	
	
	
	/* 그룹생성 */
	@RequestMapping(value = "/makingGroup", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> makingGroup(@RequestBody Map<String, String> group, HttpSession hs) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		String id = (String)hs.getAttribute("memberID");
		group.put("id", id);
		
		//그룹생성
		int ig = gdao.insertGroup(group);
		int slmg =  gdao.selectLastMakeGroupseq(id);
		
		//그룹에 리더를 맴버로 등록
		group.put("groupseq", ""+slmg);
		gdao.insertGroupMember(group);
		
		return group;
	}

	
	
	
	/* 내 가입그룹 목록 가져오기 */
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
	
	/* 그룹 방으로 이동 */	
	@RequestMapping(value = "/gotoGroup", method = RequestMethod.GET)
	public String gotoGroup(int num, String name, HttpSession hs, Model model) {
		studyDao gdao = sqlSession.getMapper(studyDao.class);
		String id = (String) hs.getAttribute("memberID");
		System.out.println(id+num+name);
		
		//검색용 groupmember 만든다.
		Map<String, String> groupmember = new HashMap<>();
		groupmember.put("id", id);
		groupmember.put("groupseq", ""+num);
		groupmember.put("name", name);
		
		//id와 groupseq를 사용, 그룹에 유저가 등록되있는지 확인한다.
		int result = gdao.selectGroupmember(groupmember);
		
		//등록되있지 않을시 로비로 이동
		if(result<=0) {
			return "group/grouplobby";
		}
		
		//leaderID groupmember에 넣는다.
		String leaderId = gdao.selectOneGroup(num).get("GROUPLEADER");
		System.out.println("리더아이디"+leaderId);
		groupmember.put("leaderId", leaderId);
		
		model.addAttribute("groupmember", groupmember);
		return "study/groupRoom";
	}
	
	
	/* 그룹 검색 */
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
	
	
	/* 그룹로비로 이동 */
	@RequestMapping(value = "/gotoStudy", method = RequestMethod.GET)
	public String gotoStudy(String eventtitle, HttpSession session, Model model) {
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
	
         
         // 2. HTML 가져오기
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
         // 3. 가져온 HTML Document 를 확인하기
		return result;
	/*	
		Selenium sl = new Selenium();
		try {
			type=URLDecoder.decode(type, "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(type);
		ArrayList<String[]> wlist= sl.wList(type);
		return wlist;*/

	}
	
		
} 
