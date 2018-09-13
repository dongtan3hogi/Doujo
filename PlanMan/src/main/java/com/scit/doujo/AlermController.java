package com.scit.doujo; 
 
import java.util.ArrayList;


import java.util.Collections;
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
	
	
	/* 그룹 가입 신청 */
	@RequestMapping(value = "/groupRegistApply", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> groupRegistApply(@RequestBody Map<String, String> group, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		String id = (String)hs.getAttribute("memberID"); 
		group.put("content", group.get("groupnumber"));
		group.put("friendid", group.get("leader"));
		group.put("id", id);
		System.out.println(group.toString());
		ArrayList<Map<String, String>> groupList = new ArrayList<>();
		Map<String,Map<String, String>> groupMap = new HashMap<>();
		Map<String, String> check = new HashMap<>();
		
		
		
		int checkcount = adao.countGroupJoinCheck(group);
		if(checkcount > 0) {
			//1 이상일 경우 이미 해당 alerm은 등록된 것 이기에 집어넣지 않고 이미 했던 것임을 알려준다.
			check.put("result", "already");
			return check;
		} else {
			
		}
		
		int result = adao.insertGroupJoin(group);
		System.out.println("doGroupRegistApply/result/"+result);
		check.put("result", "success");
		
		return check;
	}
	
	
	/* 페이지 시작시 alerm 가져오기===================================================================*/ 
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
	
	
	/* alerm에서 수락 ===================================================================*/ 
	@RequestMapping(value = "/groupAlermOk", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> groupAlermOk(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		System.out.println("groupAlermOk/alerm/"+alerm.toString());
		//먼저 group에 해당 맴버를 넣는다.
		int result1 = sdao.insertGroupMember(alerm);
		
		//해당 알람을 지운다.
		int result2 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+(result1+result2));
		AlermResult.put("result2", "groupAlermOk");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	/* alerm에서 거절해서 해당 alerm을 테이블에서 지운다. ===================================================================*/ 
	@RequestMapping(value = "/groupAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> groupAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		//해당 알람을 지운다.
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "groupAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	/* 친구신청, 알람TABLE에 등록 ===================================================================*/ 
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
	
	
	
	/* alerm에서 친구 신청수락 ===================================================================*/ 
	@RequestMapping(value = "/friendAlermOkBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermOkBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		memberDao mdao = sqlSession.getMapper(memberDao.class);
		friendDao sdao = sqlSession.getMapper(friendDao.class);
		String memberID = (String)hs.getAttribute("memberID");
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		System.out.println("friendAlermOkBtn/alerm/"+alerm.toString());
		//DB에 친구등록
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
		System.out.println(vo2.toString());
		int result1 = sdao.insertMyFriend(vo2);
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
		System.out.println(vo2.toString());
		int result3 = sdao.insertMyFriend(vo2);
		
		
		
		//해당 알람을 지운다.
		int result2 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+(result1+result2));
		AlermResult.put("result2", "groupAlermOk");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
	
	/* alerm에서 거절해서 해당 alerm을 테이블에서 지운다. ===================================================================*/ 
	@RequestMapping(value = "/friendAlermNoBtn", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> friendAlermNoBtn(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		studyDao sdao = sqlSession.getMapper(studyDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		//해당 알람을 지운다.
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "friendAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	/* FRIEND에게 스케쥴 신청하기 ===================================================================*/ 
	@RequestMapping(value = "/askShareSchedule", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Map<String,String>> askShareSchedule(@RequestBody Map<String, String> alerm, HttpSession hs) {
		alermDao adao = sqlSession.getMapper(alermDao.class);
		friendDao sdao = sqlSession.getMapper(friendDao.class);
		Map<String, Map<String,String>> alermMap = new HashMap<>();
		
		
		//해당 알람을 지운다.
		int result1 = adao.deleteAlerm(alerm);
		Map<String,String> AlermResult = new HashMap<>();
		AlermResult.put("result1", ""+result1);
		AlermResult.put("result2", "friendAlermNoBtn");
		alermMap.put("alermCount", AlermResult);
		return alermMap; 
	}
	
	
} 
