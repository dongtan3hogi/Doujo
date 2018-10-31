package com.scit.doujo; 
 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap; 
import java.util.Map; 
 
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.scit.doujo.dao.alermDao;
import com.scit.doujo.dao.friendDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.dao.messageDao;
import com.scit.doujo.dao.studyDao;
import com.scit.doujo.util.PageNavigator;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
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
public class AlermController { 
 
	@Autowired 
	SqlSession sqlSession;
	
	
	@RequestMapping(value = "/groupRegistApply", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> groupRegistApply(@RequestBody Map<String, String> group, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		String id = (String)hs.getAttribute("memberID"); 
		group.put("content", group.get("groupnumber"));
		group.put("friendid", group.get("leader"));
		group.put("id", id);
		System.out.println(group.toString());
		
		Map<String, String> check = new HashMap<>();
		
		
		
		int checkcount = adao.countGroupJoinCheck(group);
		if(checkcount > 0) {
			check.put("result", "already");
			return check;
		} else {
			
		}
		
		int result = adao.insertGroupJoin(group);
		System.out.println("doGroupRegistApply/result/"+result);
		check.put("result", "success");
		
		return check;
	}
	
	
	@RequestMapping(value = "/showAlermList", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> showAlermList(@RequestBody Map<String, String> message, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, String> alerm = new HashMap<>();
		alerm.put("id", memberID);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		ArrayList<Map<String,String>> alermList = new ArrayList<>();
		//System.out.println(message.toString());
		
		alermList = adao.selectAlerm(alerm);
		int count = 0;
		for (Map<String, String> map : alermList) {
			map.put("count", "ok");
			alermMap.put(""+count, map);
			count++;
		}
		Map<String,String> AlermCount = new HashMap<>();
		AlermCount.put("count", ""+count);
		alermMap.put("alermCount", AlermCount);
		
		return alermMap; 
	}
	
	
	@RequestMapping(value = "/groupAlermOk", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> groupAlermOk(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		System.out.println("groupAlermOk/alerm/"+alerm.toString());
		int result1 = sdao.insertGroupMember(alerm);
		
		int result2 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+(result1+result2));
		AlermResult.put("result2", "groupAlermOk");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	@RequestMapping(value = "/groupAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> groupAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "groupAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	@RequestMapping(value = "/friendRegistApply", method = RequestMethod.POST) 
	public @ResponseBody String friendRegistApply(String id, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		friendDao chooseone = sqlSession.getMapper(friendDao.class);
		String userid = (String)hs.getAttribute("memberID");
		
		System.out.println("friend아이디"+id);
		System.out.println("아이디"+userid);
		
		int check = chooseone.checkFriend(userid, id);
		System.out.println(check);
		if(check == 0) {
			Map<String, String> alerm = new HashMap<>();
			alerm.put("id", userid);
			alerm.put("type", "friendapply");
			alerm.put("friendId", id);
			int result = adao.insertFriendJoin(alerm);
			
			return "sucess";
		}else {

			return "already";
			
		}
		
		
	}
	
	
	
	@RequestMapping(value = "/friendAlermOkBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermOkBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		memberDao mdao = sqlSession.getMapper(memberDao.class);
		friendDao sdao = sqlSession.getMapper(friendDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		System.out.println("friendAlermOkBtn/alerm/"+alerm.toString());
		String sendid=alerm.get("sendid");
		member vo=mdao.selectOneMember(sendid);
		friend vo2=new friend();
		vo2.setFriendid(sendid);
		vo2.setUserid(memberID);
		vo2.setAge(vo.getAge());
		vo2.setGender(vo.getGender());
		vo2.setName(vo.getName());
		vo2.setNickname(vo.getNickname());
		if(vo.getJob()==null) {
			vo2.setJob("-");
		}else {
			vo2.setJob(vo.getJob());
		}
		if(vo.getHobby()==null) {
			vo2.setHobby("-");
		}else {
			vo2.setHobby(vo.getHobby());
		}
		int result1 = sdao.insertMyFriend(vo2);
		System.out.println("친구신청받은 사람이 기준이 되는 친구신청수락"+vo2.toString());
		member vo3=mdao.selectOneMember(memberID);
		vo2.setFriendid(memberID);
		vo2.setUserid(sendid);
		vo2.setAge(vo3.getAge());
		vo2.setGender(vo3.getGender());
		vo2.setName(vo3.getName());
		vo2.setNickname(vo3.getNickname());
		if(vo3.getJob()==null) {
			vo2.setJob("-");
		}else {
			vo2.setJob(vo3.getJob());
		}
		if(vo3.getHobby()==null) {
			vo2.setHobby("-");
		}else {
			vo2.setHobby(vo3.getHobby());
		}
		System.out.println("친구신청한 사람이 기준이 되는 친구신청수락"+vo2.toString());
		int result3 = sdao.insertMyFriend(vo2);
		
		
		
		int result2 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+(result1+result2));
		AlermResult.put("result2", "groupAlermOk");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	
	@RequestMapping(value = "/friendAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "friendAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap;
		
	}
	
	
	@RequestMapping(value = "/askShareSchedule", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> askShareSchedule(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		friendDao sdao = sqlSession.getMapper(friendDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		alerm.put("type", "schedulesharing");
		
		System.out.println(alerm.toString());
		
		int result=adao.insertScheduleAlerm(alerm);
		
		return alermMap; 
	}
	
	@RequestMapping(value = "/scheduleAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> scheduleAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "scheduleAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap;
		
	}
	
	@RequestMapping(value = "/scheduleAlermOkBtn", method = RequestMethod.POST) 
	public @ResponseBody  Map<String, String> scheduleAlermOkBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		memberDao mdao = sqlSession.getMapper(memberDao.class);

		String memberID = (String)hs.getAttribute("memberID");
		Map<String,String> alermMap = new HashMap<>();
		System.out.println("scheduleAlermOkBtn/alerm/"+alerm.toString());
		String aseq=alerm.get("alermseq");
		int alermseq=Integer.parseInt(aseq);
		
		alermMap=adao.selectAlermUserSeq(alermseq);
		System.out.println(alermMap.toString());
		
		schedule result=new schedule();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String variable4=alermMap.get("VARIABLE4");
		System.out.println("variable4는 무엇인가"+variable4);
		
		int plusday=Integer.parseInt(alermMap.get("VARIABLE3"));
		int result3;
		int result4;
		
		if(variable4.equals("sometimes")) {
			System.out.println("반복스케쥴"+plusday);
			result.setId(memberID);
			result.setEventtype(alermMap.get("VARIABLE1"));
			result.setEventtitle(alermMap.get("VARIABLE2"));
			result.setStartday(alermMap.get("STARTTIME"));
			result.setEndday(alermMap.get("ENDTIME"));
			result.setEventcontent(alermMap.get("CONTENT"));
			result.setStarttime("0");
			result.setEndtime("0");
			for(int i= 0; i<plusday; i++) {
				
				result.setId(memberID);
				
				result3=mdao.addschdule(result);
				
				result.setId(alermMap.get("SENDID"));
				
				result4=mdao.addschdule(result);
				
				try {
					Date date = format.parse(result.getEndday());
					Calendar cal = Calendar.getInstance();
		            cal.setTime(date);
		            cal.add(Calendar.DATE, 1);	
		            date=cal.getTime();
		            System.out.println(date.toString());
		            result.setEndday( format.format(date));
		            date = format.parse(result.getStartday());
					cal = Calendar.getInstance();
		            cal.setTime(date);
		            cal.add(Calendar.DATE, 1);	
		            date=cal.getTime();
		            System.out.println(date.toString());
		            result.setStartday( format.format(date));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println(result.toString()+")))1");
			
			result.setId(memberID);
			
			result3=mdao.addschdule(result);
			
			result.setId(alermMap.get("SENDID"));
			
			System.out.println(result.toString()+")))2");
			
			result4=mdao.addschdule(result);
			
		}else {
			
			System.out.println("지속스케쥴"+plusday);
			
			result.setStartday(alermMap.get("STARTTIME"));
			result.setEndday(alermMap.get("ENDTIME"));
			
			try {
				Date date = format.parse(result.getEndday());
				Calendar cal = Calendar.getInstance();
	            cal.setTime(date);
	            cal.add(Calendar.DATE, plusday);	
	            date=cal.getTime();
	            System.out.println(date.toString());
	            result.setEndday( format.format(date));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			result.setId(memberID);
			result.setEventtype(alermMap.get("VARIABLE1"));
			result.setEventtitle(alermMap.get("VARIABLE2"));
			
			result.setEventcontent(alermMap.get("CONTENT"));
			result.setStarttime("0");
			result.setEndtime("0");
			
			result3=mdao.addschdule(result);
			
			result.setId(alermMap.get("SENDID"));
			
			result4=mdao.addschdule(result);
			
		}
		int result2 = adao.deleteAlerm(alerm);
		return alermMap; 
	}
	
} 
