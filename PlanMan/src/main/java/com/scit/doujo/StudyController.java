package com.scit.doujo; 
 
import java.util.ArrayList; 
import java.util.HashMap; 
import java.util.Map; 
 
import javax.servlet.http.HttpSession; 
 
import org.apache.ibatis.session.SqlSession; 
import com.scit.doujo.dao.studyDao; 
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
	 
	/*공부 메인페이지로 이동 ===================================================================*/ 
	@RequestMapping(value = "/gotoQuiz", method = RequestMethod.GET) 
	public String goquiz() { 
		return "study/quiz"; 
	} 
	 
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
	@RequestMapping(value = "/gotoTegSolve", method = RequestMethod.POST) 
	public String gotegsolve(@RequestParam(value="type", defaultValue="none") String type, 
			Model model, HttpSession hs, String teg) { 
		studyDao dao = sqlSession.getMapper(studyDao.class);		 
		String id = (String) hs.getAttribute("memberID"); 
		Map<String, String> quiz = new HashMap<>(); 
		quiz.put("teg", teg); 
		quiz.put("id", id); 
		if(type.equals("none")) { 
			 
		} else { 
			quiz.put("type", type); 
		} 
		 
		ArrayList<Map<String, String>> quizList = dao.selectTegQuiz(quiz); 
		 
		model.addAttribute("quizcount", quizList.size()); 
		model.addAttribute("quizList", quizList); 
		return "study/quizsolve"; 
	} 
	 
	 
	@RequestMapping(value = "/gotoRecordSolve", method = RequestMethod.POST) 
	public String gorecordsolve(Model model, HttpSession hs, String quizrecordname) { 
		studyDao dao = sqlSession.getMapper(studyDao.class); 
		String id = (String)hs.getAttribute("memberID"); 
		Map<String, String> quiz = new HashMap<>(); 
		quiz.put("id", id); 
		quiz.put("quizrecordname", quizrecordname); 
		quiz.put("quizrecordcode", id+quizrecordname); 
		ArrayList<Map<String, String>> quizList = dao.selectRecordQuiz(quiz); 
		 
		model.addAttribute("quizcount", quizList.size()); 
		model.addAttribute("quizList", quizList); 
		return "study/quizsolve"; 
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
		System.out.println("num:"+num); 
		Map<String, String> quiz = dao.selectOneQuiz(num); 
		 
		/*정답오답 판정*/ 
		//주관식일 경우 
		if(quiz.get("TYPE").equals("shortanswer")) { 
			if(quiz.get("ANSWER").equals(yourAns)) { 
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
		 
		System.out.println("2"); 
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
		 
		System.out.println("3"); 
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
			quizList = dao.selectTegQuiz(selectSet); 
			 
		//type이 record이면 아이디와 레코드코드를 사용해서 불러온다. 
		} else if(type.equals("r")) { 
			selectSet.put("quizrecordcode", id+name); 
			System.out.println(selectSet.get("quizrecordcode") + ", " + selectSet.get("id")); 
			quizList = dao.selectRecordQuiz(selectSet); 
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
	 
	 
} 
