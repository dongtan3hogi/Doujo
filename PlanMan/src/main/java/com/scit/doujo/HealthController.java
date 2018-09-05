package com.scit.doujo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.healthDao;
import com.scit.doujo.dao.memberDao;
import com.scit.doujo.vo.activity;
import com.scit.doujo.vo.eatfood;
import com.scit.doujo.vo.food;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.mynut;
import com.scit.doujo.vo.schedule;

@Controller
public class HealthController {
		
	@Autowired
	SqlSession sqlSession;
	
	//헬스 메인페이지로 이동
	@RequestMapping(value = "/gotoHealth", method = RequestMethod.GET)
	public String gotoHealth(String eventtitle, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		memberDao manager2=sqlSession.getMapper(memberDao.class);
		String id=(String) session.getAttribute("memberID");
		schedule result=new schedule();
		String eventtype="health";
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
		
		session.setAttribute("schList", schList);
		session.setAttribute("eventtitle", eventtitle);
		return "health/healthMain";
	}
	
	//식단 입력 페이지로 이동
	@RequestMapping(value = "/gotoMeal", method = RequestMethod.GET)
	public String gotoMeal(Model model, String FDGRP_NM) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		ArrayList<food> foodList=new ArrayList<>();
		if(FDGRP_NM==null) {
			FDGRP_NM="가공유류";
		}
		System.out.println("가져올 식품군"+FDGRP_NM);
		foodList=manager.selectFood(FDGRP_NM);
		System.out.println("음식목록 갯수 :"+foodList.size());
		model.addAttribute("foodgroup", FDGRP_NM);
		model.addAttribute("foodList", foodList);
		return "health/addMeal";
	}
	
	//활동 입력 페이지로 이동하기
	@RequestMapping(value = "/gotoActivity", method = RequestMethod.GET)
	public String gotoActivity(Model model) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		return "health/addActivity";
	}
	
	//몸무게 및 키 입력여부 확인하기
	@RequestMapping(value = "/chkBodyInfo", method = RequestMethod.GET)
	public @ResponseBody String chkBodyInfo(HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		member vo=(member) session.getAttribute("member");
		String id=vo.getId();
		System.out.println(id+"아이디보내라");
		int result=manager.selectBodyInfo(id);
		System.out.println(result+"=키몸무게 체크 (1이면 입력 안되어있음  / 0이면 입력되있음)");
		if(result>0) {
			return "empty";
		}else {
			return "success";
		}
	}
	
	//키, 몸무게 입력하기 addHeightWeight
	@RequestMapping(value = "/addHeightWeight", method = RequestMethod.POST)
	public String addHeightWeight(double height, double weight, HttpSession session) {
		System.out.println("키 :" + height + ", 몸무게 : " + weight);
		healthDao manager=sqlSession.getMapper(healthDao.class);
		member vo=(member) session.getAttribute("member");
		vo.setHeight(height);
		vo.setWeight(weight);
		double daykacl=0;
		System.out.println(vo.getGender()+"male이면 남성 , female이면 여성");
		if (vo.getGender().equals("male")) {
			daykacl = ((height / 100) * (height / 100) * 22) * 35;// 남자: 표준체중에 따른 1일권장칼로리계산
			vo.setDaykacl(daykacl);
		} else {
			daykacl = ((height / 100) * (height / 100) * 21) * 35;// 여자: 표준체중에 따른 1일권장칼로리계산
			vo.setDaykacl(daykacl);
		}
		int result=manager.updateBodyInfo(vo);
		if(result==0) {
			System.out.println("키 몸무게 입력에 실패하였습니다.");
		}else {
			System.out.println("키와 몸무게가 입력되었습니다.");
		}
		
		return "health/healthMain";
	}
	
	//섭취 음식 등록하기
	@RequestMapping(value = "/addMeal", method = RequestMethod.POST)
	public @ResponseBody String addMeal(int NUM, int SERVING_WT, String countday, HttpSession session) {
		System.out.println(NUM+"/"+SERVING_WT+"/"+countday);
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		food vo=manager.selectOneFood(NUM);
		System.out.println("기존용량"+vo.getSERVING_WT());
		double rate=(double) SERVING_WT/vo.getSERVING_WT();
		System.out.println("계산비율"+rate);
		eatfood vo2=new eatfood();
		vo2.setId(id);
		vo2.setDESC_KOR(vo.getDESC_KOR());
		vo2.setCountday(countday);
		vo2.setSERVING_WT(SERVING_WT);
		vo2.setNUTR_CONT1(vo.getNUTR_CONT1()*rate);
		vo2.setNUTR_CONT2(vo.getNUTR_CONT2()*rate);
		vo2.setNUTR_CONT3(vo.getNUTR_CONT3()*rate);
		vo2.setNUTR_CONT4(vo.getNUTR_CONT4()*rate);
		vo2.setNUTR_CONT5(vo.getNUTR_CONT5()*rate);
		vo2.setNUTR_CONT6(vo.getNUTR_CONT6()*rate);
		vo2.setNUTR_CONT7(vo.getNUTR_CONT7()*rate);
		vo2.setNUTR_CONT8(vo.getNUTR_CONT8()*rate);
		vo2.setNUTR_CONT9(vo.getNUTR_CONT9()*rate);
		int result=manager.insertEatfood(vo2);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}	
	}
	
	//식단표 보러가기
	@RequestMapping(value = "/showtoMeal", method = RequestMethod.GET)
	public String showtoMeal(HttpSession session, String countday, Model model) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		eatfood vo=new eatfood();
		String id=(String) session.getAttribute("memberID");
		vo.setId(id);
		vo.setCountday(countday);
		System.out.println("showmeal아이디확인 : "+vo.getId());
		System.out.println("showmeal날짜들어오는지 확인 : "+vo.getCountday());
		ArrayList<eatfood> eatfoodList=new ArrayList<>();
		eatfoodList=manager.selectEatfood(vo);
		System.out.println(eatfoodList.size());
		if(eatfoodList.size()==0) {
			System.out.println("해당 날짜에 식사한 음식이 없음!!");
			return "redirect:/gotoMeal";
		}else {
			System.out.println(vo.getCountday()+"날짜에 식사한 음식 목록 보여주기!");
			System.out.println(eatfoodList.get(0).toString());
			model.addAttribute("eatfoodList", eatfoodList);
			return "health/eatTable";
		}
		
	}
	
	//식단표 음식 삭제하기
	@RequestMapping(value = "/deleteMeal", method = RequestMethod.GET)
	public String deleteMeal(HttpSession session, String countday, int eatnum, Model model) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		int result=manager.deleteOneMeal(eatnum);		
		eatfood vo=new eatfood();
		String id=(String) session.getAttribute("memberID");
		vo.setId(id);
		vo.setCountday(countday);
		ArrayList<eatfood> eatfoodList=new ArrayList<>();
		eatfoodList=manager.selectEatfood(vo);
		if(eatfoodList.size()==0) {
			return "redirect:/gotoMeal";
		}
		System.out.println("ㅇㅇ과연"+eatfoodList.size());
		model.addAttribute("eatfoodList", eatfoodList);
		return "health/eatTable";
		
	}
	
	//활동 입력하기 칼로리 추가하기
	@RequestMapping(value = "addKacl", method = RequestMethod.POST)
	public @ResponseBody String AddKacl(activity vo, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		vo.setId(id);
		System.out.println("활동 입력용 vo : "+vo.toString());
		int result=manager.insertActKacl(vo);
		
		if(result!=0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//My Nut 페이지로 이동하기
	@RequestMapping(value = "/gotoNutrition", method = RequestMethod.GET)
	public String gotoNutrition(Model model, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		Date date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		String countday=formatter.format(date);
		
		mynut vo=dayNutritionCal(id, countday);
		if(vo==null) {
			return "redirect:/gotoHealth";
		}
		vo.setId(id);
		vo.setCountday(countday);
		
		mynut result = manager.selectTodayMynut(vo);
		if(result==null) {
			int check=manager.insertMyNut(vo);
			System.out.println("daynut 새로 추가");
		}else {
			int check=manager.updateMyNut(vo);
			System.out.println(result.toString());
			System.out.println("daynut 업데이트");
		}
		
		model.addAttribute("mynut", result);
		model.addAttribute("countday", countday);
		return "health/myNutrition";
	}
	
	// 1일치 영양정보 계산하기
	public mynut dayNutritionCal(String id, String countday) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		eatfood vo = new eatfood();
		vo.setId(id);
		vo.setCountday(countday);
		double plusKacl = 0.0;
		ArrayList<activity> actList=new ArrayList<>();
		actList = manager.selectActList(vo);
		if(actList!=null) {
			for(int i=0; i<actList.size(); i++) {
				plusKacl += actList.get(i).getKacl();
			}
		}
		eatfood result = manager.sumDayNut(vo);
		int mykacl=manager.selectMyKacl(id);
		
		double daykacl = mykacl + plusKacl;
		double daycarbo = 460; //g
		double dayprotein = 55; //g
		double dayfat = 160; //g
		double daysugar = 50; //g
		double daysodium = 2000; //mg
		double daycholesterol = 300; //mg
		double dayfatty = 15; //g
		double daytransfat = 2; //g
		if(result!=null) {
			int kacl = (int) ((result.getNUTR_CONT1() / daykacl) * 100);
			int carbo = (int) ((result.getNUTR_CONT2() / daycarbo) * 100);
			int protein = (int) ((result.getNUTR_CONT3() / dayprotein) * 100);
			int fat = (int) ((result.getNUTR_CONT4() / dayfat) * 100);
			int sugar = (int) ((result.getNUTR_CONT5() / daysugar) * 100);
			int sodium = (int) ((result.getNUTR_CONT6() / daysodium) * 100);
			int cholesterol = (int) ((result.getNUTR_CONT7() / daycholesterol) * 100);
			int fatty = (int) ((result.getNUTR_CONT8() / dayfatty) * 100);
			int transfat = (int) ((result.getNUTR_CONT9() / daytransfat) * 100);

			mynut result2=new mynut();
			result2.setKacl(kacl);
			result2.setCarbo(carbo);
			result2.setProtein(protein);
			result2.setFat(fat);
			result2.setSugar(sugar);
			result2.setSodium(sodium);
			result2.setCholesterol(cholesterol);
			result2.setFatty(fatty);
			result2.setTransfat(transfat);
			
			return result2;
		}else {
			return null;
		}
	}
	
	//이번주 영양정보 페이지로 이동하기
	@RequestMapping(value = "/showWeekNut", method = RequestMethod.GET)
	public String showWeekNut(Model model, HttpSession session, String countday) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Calendar cal = Calendar.getInstance();
		String year=countday.split("-")[0];
		String month=countday.split("-")[1];
		String day=countday.split("-")[2];
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.MONTH-1, Integer.parseInt(month));
		cal.set(Calendar.DATE, Integer.parseInt(day));		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		System.out.println("위크데이"+weekday);
		mynut result=new mynut();
		result.setId(id);
		result.setCountday(countday);
		
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				System.out.println(result.toString());
				System.out.println(id+"아이디");
				break;
			default:
				break;
		}
			
		model.addAttribute("mynut", result);
		model.addAttribute("countday", countday);
		return "health/weekMyNut";
	}
	
	// 이번달 영양정보
	@RequestMapping(value = "showMonthNut", method = RequestMethod.GET)
	public String showMonthNut(Model model, HttpSession session, String countday) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		mynut result=new mynut();
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Calendar cal = Calendar.getInstance();
		String year=countday.split("-")[0];
		String month=countday.split("-")[1];
		String day=countday.split("-")[2];
		cal.set(Calendar.MONTH-1, Integer.parseInt(month));
		cal.set(Calendar.DATE, Integer.parseInt(day));
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		String monthendday=formatter.format(cal.getTime());
		System.out.println(monthendday);
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		String monthstartday=formatter.format(cal.getTime());
		System.out.println(monthstartday);
		result.setMonthstartday(monthstartday);
		result.setMonthendday(monthendday);
		result.setId(id);
		
		result=manager.selectMonthNut(result);
		System.out.println(result.toString());
		model.addAttribute("mynut", result);
		model.addAttribute("countday", countday);
		return "health/monthMyNut";
	}
	
	//병원약국 정보 보러 가기
	@RequestMapping(value = "gotoShowHospital", method = RequestMethod.GET)
	public String gotoShowHospital(Model model, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		return "health/showHospital";
	}
	
	/*데이터셋 파일 불러와서 등록하기 
	@RequestMapping(value = "/goSearch", method = RequestMethod.GET)
	   public String goSearch(Model model, String value) {   
	     healthDao manager=sqlSession.getMapper(healthDao.class);
	 		 
		 System.out.println(value);
	       String secretKey = "8750682406266725427";//애플리케이션 클라이언트 시크릿값";
	           StringBuffer response = null;
	           try {
	              // String text = URLEncoder.encode(search, "UTF-8");
	               String apiURL = "http://openapi.foodsafetykorea.go.kr/api/ab2fdc44d6684a05af71/I0750/json/34001/35000"; // json 결과
	               //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	               URL url = new URL(apiURL);
	               HttpURLConnection con = (HttpURLConnection)url.openConnection();
	               con.setRequestMethod("POST");
	              // con.setRequestProperty("key", secretKey);
	             
	               int responseCode = con.getResponseCode();
	               BufferedReader br;
	               System.out.println(responseCode);
	               if(responseCode==200) { // 정상 호출
	                   br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	               } else {  // 에러 발생
	                   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	               }
	               String inputLine;
	               response = new StringBuffer();
	              
	               while ((inputLine = br.readLine()) != null) {
	                   response.append(inputLine);
	               }
	               br.close();
	             System.out.println(response.toString());  
	             
	           } catch (Exception e) {
	               System.out.println(e);
	           }
	         JSONParser jsonParser = new JSONParser();
	         JSONObject jsonObj = null;
	         JSONArray temp=null;
	         try {
	            jsonObj = (JSONObject) jsonParser.parse(response.toString());
	      
	            jsonObj = (JSONObject) jsonObj.get("I0750");
	            System.out.println("11");
	            temp = (JSONArray) jsonObj.get("row");
	            System.out.println("11");

	         } catch (Exception e) {
	            
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            return "null";
	         }
	         for(int i =0; i<temp.size();i++) {
		         jsonObj=(JSONObject) temp.get(i);
		         food vo=new food();
		         String flag="N/A";
		         String flag2="TRACE";
		         String flag3="null";
		         if(((String)jsonObj.get("NUTR_CONT1")).equals(flag)||((String)jsonObj.get("NUTR_CONT1")).equals(flag2)||((String)jsonObj.get("NUTR_CONT1")).equals(flag3)) {
		        	 vo.setNUTR_CONT1("0");
		         }else {
			         vo.setNUTR_CONT1((String)jsonObj.get("NUTR_CONT1"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT2")).equals(flag)||((String)jsonObj.get("NUTR_CONT2")).equals(flag2)||((String)jsonObj.get("NUTR_CONT2")).equals(flag3)) {
		        	 vo.setNUTR_CONT2("0");
		         }else {
		        	 vo.setNUTR_CONT2((String)jsonObj.get("NUTR_CONT2"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT3")).equals(flag)||((String)jsonObj.get("NUTR_CONT3")).equals(flag2)||((String)jsonObj.get("NUTR_CONT3")).equals(flag3)) {
		        	 vo.setNUTR_CONT3("0");
		         }else {
		        	 vo.setNUTR_CONT3((String)jsonObj.get("NUTR_CONT3"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT4")).equals(flag)||((String)jsonObj.get("NUTR_CONT4")).equals(flag2)||((String)jsonObj.get("NUTR_CONT4")).equals(flag3)) {
		        	 vo.setNUTR_CONT4("0");  	 
		         }else {
		        	 vo.setNUTR_CONT4((String)jsonObj.get("NUTR_CONT4"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT5")).equals(flag)||((String)jsonObj.get("NUTR_CONT5")).equals(flag2)||((String)jsonObj.get("NUTR_CONT5")).equals(flag3)) {
		        	 vo.setNUTR_CONT5("0"); 
		        	 
		         }else {
		        	 vo.setNUTR_CONT5((String)jsonObj.get("NUTR_CONT5"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT6")).equals(flag)||((String)jsonObj.get("NUTR_CONT6")).equals(flag2)||((String)jsonObj.get("NUTR_CONT6")).equals(flag3)) {
		        	 vo.setNUTR_CONT6("0");	 
		         }else {
		        	 vo.setNUTR_CONT6((String)jsonObj.get("NUTR_CONT6"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT7")).equals(flag)||((String)jsonObj.get("NUTR_CONT7")).equals(flag2)||((String)jsonObj.get("NUTR_CONT7")).equals(flag3)) {
		        	 vo.setNUTR_CONT7("0");	 
		         }else {
		        	 vo.setNUTR_CONT7((String)jsonObj.get("NUTR_CONT7"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT8")).equals(flag)||((String)jsonObj.get("NUTR_CONT8")).equals(flag2)||((String)jsonObj.get("NUTR_CONT8")).equals(flag3)) {
		        	 vo.setNUTR_CONT8("0");
		         }else {
		        	 vo.setNUTR_CONT8((String)jsonObj.get("NUTR_CONT8"));
		         }
		         if(((String)jsonObj.get("NUTR_CONT9")).equals(flag)||((String)jsonObj.get("NUTR_CONT9")).equals(flag2)||((String)jsonObj.get("NUTR_CONT9")).equals(flag3)) {
		        	 vo.setNUTR_CONT9("0");
		         }else {
			         vo.setNUTR_CONT9((String)jsonObj.get("NUTR_CONT9"));
		         }
		         if(((String)jsonObj.get("SERVING_WT")).equals(flag)||((String)jsonObj.get("SERVING_WT")).equals(flag2)||((String)jsonObj.get("SERVING_WT")).equals(flag3)) {
			         vo.setSERVING_WT("0");
		         }else {
			         vo.setSERVING_WT((String)jsonObj.get("SERVING_WT"));
		         }
		         
		         vo.setANIMAL_PLANT((String)jsonObj.get("ANIMAL_PLANT"));
		         vo.setBGN_YEAR((String)jsonObj.get("BGN_YEAR"));
		         vo.setDESC_KOR((String)jsonObj.get("DESC_KOR"));
		         vo.setFDGRP_NM((String)jsonObj.get("FDGRP_NM"));
		         vo.setFOOD_CD((String)jsonObj.get("FOOD_CD"));
		         vo.setNUM((String)jsonObj.get("NUM"));
		         
		         System.out.println(vo.toString());
		         manager.insertInputFood(vo);
	         }
	         
	     
	         
	      return "health/addMeal";
	   }*/
	
}
