package com.scit.doujo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.memberDao;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;


@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "home";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "gotoSignIn", method = RequestMethod.GET)
	public String gotoSignIn() {
	
		return "singIn";
	}
	
	//회원아이디 중복 확인
	@RequestMapping(value = "idcheck", method=RequestMethod.GET)
	public @ResponseBody String idcheck(String id){
		System.out.println(id);
		memberDao manager = sqlSession.getMapper(memberDao.class);
		String result =manager.idDoubleCheck(id);
			
		return result;			
	}
		
	//회원등록완료
	@RequestMapping(value = "insertMember", method=RequestMethod.POST)
	public String insertMember(member vo){
		
		if(vo.getNickname().length()==0) {			
			String data=vo.getId();
			vo.setNickname(data);
		}
		System.out.println(vo);
		memberDao manager = sqlSession.getMapper(memberDao.class);
		int result = manager.insertMember(vo);
		System.out.println(result);
		return "redirect:/";
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "gotoLogin", method = RequestMethod.GET)
	public String gotoLogin() {
	
		return "home";
	}

	//로그인 페이지로 이동
	@RequestMapping(value = "doLogin", method = RequestMethod.POST)
	public String doLogin(member vo, HttpSession session, Model model) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		member result=manager.doLogin(vo);
		if(result==null) {
			//로그인 실패시 메인페이지로 이동
			//System.out.println("로그인 실패");
			model.addAttribute("loginResult", "loginfail");
			return "home";
		}else {
			//로그인 성공시 세션에 member로 회원정보 저장
			session.setAttribute("member", result);
			session.setAttribute("memberID", result.getId());
			Date date = new Date();
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    String today=sdf.format(date);
		    String startdaytime=today+" 00:00";
		    String enddaytime=today+" 23:59";
		    schedule vo2=new schedule();
		    vo2.setId(result.getId());
		    vo2.setStartdaytime(startdaytime);
		    vo2.setEnddaytime(enddaytime);
		    System.out.println(vo2.toString());
		    ArrayList<schedule> schList=new ArrayList<>();
		    schList=manager.selectTodaySch(vo2);
		    if(schList.size()==0) {
		    	return "main";
		    }else {
		    	model.addAttribute("today", today);
		    	model.addAttribute("schList", schList);
		    	return "timeline";
		    }
		}
	}
	
	//타임라인 페이지로 이동
	@RequestMapping(value = "gotoTimeline", method = RequestMethod.GET)
	public String gotoTimeline(HttpSession session, Model model) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		Date date = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String today=sdf.format(date);
	    String startdaytime=today+" 00:00";
	    String enddaytime=today+" 23:59";
	    schedule vo2=new schedule();
	    vo2.setId((String) session.getAttribute("memberID"));
	    vo2.setStartdaytime(startdaytime);
	    vo2.setEnddaytime(enddaytime);
	    ArrayList<schedule> schList=new ArrayList<>();
	    schList=manager.selectTodaySch(vo2);
	    if(schList.size()==0) {
	    	return "main";
	    }else {
	    	model.addAttribute("today", today);
	    	model.addAttribute("schList", schList);
	    	return "timeline";
	    }
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "gotoCalendar", method = RequestMethod.GET)
	public String gotoCalendar(HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);

		return "main";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//스케쥴 달력에 보여주기selectSchdule
	@RequestMapping(value = "selectSchdule", method = RequestMethod.POST)
	public @ResponseBody ArrayList<schedule> selectSchdule(HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		member vo=(member) session.getAttribute("member");
		String id=vo.getId();
		ArrayList<schedule> result=new ArrayList<>();
		result=manager.selectSchdule(id);
		
	    for(int i=0; i<result.size(); i++) {
	        try {
	        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date endDate = sdf.parse(result.get(i).getEndday());
				Date startDate = sdf.parse(result.get(i).getStartday());
				long diff=endDate.getTime()-startDate.getTime();
				int diffDays =(int) (diff/(24*60*60*1000));
				result.get(i).setDiffDay(diffDays);
	        } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	    }
		
		return result;
	}
	
	//스케쥴 입력하기
	@RequestMapping(value = "addschdule", method = RequestMethod.POST)
	public @ResponseBody String addschdule(schedule vo, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴 입력용:"+vo.toString());
		int result=manager.addschdule(vo);	
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value = "addschdule2", method = RequestMethod.POST)
	public @ResponseBody String addschdule2(schedule vo, HttpSession session, int plusday) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴 입력용:"+vo.toString());
		int result=0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		for(int i= 0; i<plusday; i++) {
			result=manager.addschdule(vo);	
			try {
				Date date = format.parse(vo.getEndday());
				Calendar cal = Calendar.getInstance();
	            cal.setTime(date);
	            cal.add(Calendar.DATE, 1);	
	            date=cal.getTime();
	            System.out.println(date.toString());
	            vo.setEndday( format.format(date));
	             date = format.parse(vo.getStartday());
				 cal = Calendar.getInstance();
	            cal.setTime(date);
	            cal.add(Calendar.DATE, 1);	
	            date=cal.getTime();
	            System.out.println(date.toString());
	            vo.setStartday( format.format(date));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		result=manager.addschdule(vo);	

		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//스케쥴 변경하기
	@RequestMapping(value = "updateschdule", method = RequestMethod.POST)
	public @ResponseBody String updateschdule(schedule vo, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴 변경용:"+vo.toString());
		int result=manager.updateschdule(vo);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//스케쥴 삭제하기
	@RequestMapping(value = "deleteschdule", method = RequestMethod.POST)
	public @ResponseBody String deleteschdule(int schseq, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴 삭제용:"+schseq);
		int result=manager.deleteschdule(schseq);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//스케쥴 완료 체크하기
	@RequestMapping(value = "chkschdule", method = RequestMethod.POST)
	public @ResponseBody String chkschdule(int schseq, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴완료들어오는 시퀀스"+schseq);
		int result=manager.didschdule(schseq);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//스케쥴 완료 해제하기
	@RequestMapping(value = "unchkschdule", method = RequestMethod.POST)
	public @ResponseBody String unchkschdule(int schseq, HttpSession session) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		System.out.println("스케쥴해제들어오는 시퀀스"+schseq);
		int result=manager.didnotschdule(schseq);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//회원정보 수정페이지 이동하기
	@RequestMapping(value = "gotoupdate", method = RequestMethod.GET)
	public String updatemember(Model model) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
	
		return "updatemember";
	}
	
	
	//멤버정보수정하기
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(Model model, member vo) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		int result=manager.updateMember(vo);
		
		return "home";
	}
	
	
	//로그아웃하기
	@RequestMapping(value = "gotologout", method = RequestMethod.GET)
	public String gotologout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//친구 스케쥴 불러오기
	@RequestMapping(value = "selectFriendSchdule", method = RequestMethod.POST)
	public @ResponseBody ArrayList<schedule> selectFriendSchdule(HttpSession session, String friendID) {
		memberDao manager=sqlSession.getMapper(memberDao.class);
		ArrayList<schedule> result=new ArrayList<>();
		result=manager.selectFriendSchdule(friendID);
		
	    for(int i=0; i<result.size(); i++) {
	        try {
	        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date endDate = sdf.parse(result.get(i).getEndday());
				Date startDate = sdf.parse(result.get(i).getStartday());
				long diff=endDate.getTime()-startDate.getTime();
				int diffDays =(int) (diff/(24*60*60*1000));
				result.get(i).setDiffDay(diffDays);
				
				
	        } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	    }
	    
		return result;
	}
	
}

