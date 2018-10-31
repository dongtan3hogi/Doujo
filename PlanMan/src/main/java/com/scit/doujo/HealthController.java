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
import com.scit.doujo.util.naverNews;
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
	
	@RequestMapping(value = "/gotoHealth", method = RequestMethod.GET)
	public String gotoHealth(String eventtitle, HttpSession session, Model model) {
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
		System.out.println("카운트데이"+countday);
		Calendar cal = Calendar.getInstance();
		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		
		ArrayList<schedule> schList=new ArrayList<>();
		String message="";	
		mynut vo=new mynut();
		vo.setId(id);
		switch(weekday) {
		case 1:
			String weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"1");
			cal.add(cal.DATE, -6);
			String weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 2:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 6);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"2");
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 3:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 5);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"3");
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 4:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 4);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"4");
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 5:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 3);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"5");
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		case 6:
			System.out.println(cal.getTime());
			cal.add(cal.DATE, 2);
			weekSunday =formatter.format(cal.getTime());
			System.out.println(weekSunday+"6");
			cal.add(cal.DATE, -6);
			weekMonday=formatter.format(cal.getTime());
			System.out.println(weekMonday);
			result.setWeekMonday(weekMonday);
			result.setWeekSunday(weekSunday);
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
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
			vo.setWeekMonday(weekMonday);
			vo.setWeekSunday(weekSunday);
			schList=manager2.selectEventByType(result);
			break;
		default:
			break;
		}
		
		vo=manager.selectWeekNut(vo);
		
		if(vo!=null) {
			int kacl = vo.getKacl();
			int carbo = vo.getCarbo();
			int protein = vo.getProtein();
			int fat = vo.getFat();
			int sugar = vo.getSugar();
			int sodium = vo.getSodium();
			int cholesterol = vo.getCholesterol();
			int fatty = vo.getFatty();
			int transfat = vo.getTransfat();
		
			System.out.println("kacl/"+kacl+"carbo/"+carbo+"protein/"+protein+"fat/"+fat+"sugar/"+sugar+"sodium/"+sodium+"cholesterol/"+cholesterol+"fatty/"+fatty+"transfat/"+transfat);
			int[] nutinfo= {kacl, carbo, protein, fat, sugar, sodium, cholesterol, fatty, transfat};
			int max=nutinfo[0];
			
			for(int i=0; i<nutinfo.length; i++) {
				if(max<nutinfo[i]) {
					max=nutinfo[i];
				}
			}
			
			System.out.println("최대값"+max);
			if(max<=80) {
				message="現在、食べ物の摂取量が全体的に不足します。 食べ物を摂取してください。";
			}else if(max<=120) {
				message="健康な食生活をしていらっしゃいます。 これからもずっと維持してください。";
			}else if(max==kacl) {
				message="過度なカロリー摂取は、体重増加を誘導して肥満を誘発します。 肥満は万病の温床がです。 運動を通じてカロリーを減らしてください。";
			}else if(max==carbo) {
				message="炭水化物中毒が疑われるですね。 過度に摂取すれば、肥満に原因になります。 全粒粉パン、豆、玄米、野菜、果物、堅果類のグリセミック指数が低い食品を摂取すればいいんです。";
			}else if(max==protein) {
				message="タンパク質を過剰摂取することになれば、タンパク質分解過程で内因性窒素、老廃物が多く形成されて、老廃物を濾過する機能を担当する腎臓に過度な負担を与えることができます。 何でも適当に食べることをお勧めします。";
			}else if(max==fat) {
				message="過度な脂肪の摂取は各種の成人病を発生させるだけでなく、睡眠障害、頭脳活動にも悪影響をもたらします。 低脂肪食品を食べることをおすすめします。";
			}else if(max==sugar) {
				message="過度な党の摂取は肥満、糖尿、心臓や脳血管疾患及び虫歯の原因になります。 糖類含有量が高い飲み物は避けてください。";
			}else if(max==sodium) {
				message="ナトリウムを過度に摂取すれば、血流量が増えて血圧が高く、心臓疾患、心血管疾患による死亡率が上がります。 野菜と果物をたくさん摂取してスープ類の食べ物の摂取量を減らしてください。";
			}else if(max==cholesterol) {
				message="コレステロールの過多摂取市脳卒中と心臓病などの生命と直接的な関連がある致命的な疾患が生じる恐れがある。 コレステロールが必要以上に多ければ、血管を弱くしてこのように致命的な心臓や脳血管疾患の発生確率を高める。";
			}else if(max==fatty) {
				message="飽和脂肪酸、過多摂取市、心血管疾患の発病率が上がります。 バター、牛乳、肉や卵などの動物性食品に多く含まれているので、摂取時の注意してください。";
			}else if(max==transfat) {
				message="トランス脂肪過多摂取市、心血管疾患の発病率が上がります。 焼いたり油で揚げた食べ物が代表的です。 また、一部の食堂や屋台で使用する水素化植物性油脂にも多量のトランス脂肪が含まれているので注意してください。";
			}
		}else {
			message="今週の献立情報がまだ入力されていません。 健康な一週になってください。";
		}
		System.out.println(message);
		
		naverNews n = new naverNews();
	    ArrayList<String[]> article = n.search("쿡기자의 건강톡톡", 5);
	    model.addAttribute("article",article );
		
		model.addAttribute("message", message);
		session.setAttribute("schList", schList);
		session.setAttribute("eventtitle", eventtitle);
		return "health/healthMain";
	}
	
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
	
	@RequestMapping(value = "/gotoActivity", method = RequestMethod.GET)
	public String gotoActivity(Model model) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		return "health/addActivity";
	}
	
	@RequestMapping(value = "/chkBodyInfo", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/deleteMeal", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/gotoNutrition", method = RequestMethod.GET)
	public String gotoNutrition(Model model, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		Date date=new Date();
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		String countday=formatter.format(date);
		
		mynut vo=dayNutritionCal(id, countday);
		if(vo==null) {
			model.addAttribute("countday", countday);
			return "health/myNutrition";
		}
		vo.setId(id);
		vo.setCountday(countday);
		
		mynut result = manager.selectTodayMynut(vo);
		if(result==null) {
			int check=manager.insertMyNut(vo);
			System.out.println("daynut 새로 추가");
			model.addAttribute("mynut", result);
			model.addAttribute("countday", countday);
			return "health/myNutrition";
		}else {
			int check=manager.updateMyNut(vo);
			System.out.println(result.toString());
			System.out.println("daynut 업데이트");
			model.addAttribute("mynut", result);
			model.addAttribute("countday", countday);
			return "health/myNutrition";
		}
		
	}
	
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
	
	@RequestMapping(value = "/showWeekNut", method = RequestMethod.POST)
	public String showWeekNut(Model model, HttpSession session, String countday) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		
		
		int weekday=cal.get(cal.DAY_OF_WEEK);
		System.out.println("위크데이"+weekday);
		mynut result=new mynut();
		result.setId(id);
		result.setCountday(countday);
		
		switch(weekday) {
			case 1:
				String weekSunday =formatter.format(cal.getTime());
				System.out.println(weekSunday);
				cal.add(cal.DATE, -6);
				String weekMonday=formatter.format(cal.getTime());
				System.out.println(weekMonday);
				result.setWeekMonday(weekMonday);
				result.setWeekSunday(weekSunday);
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
				System.out.println(result.toString());
				System.out.println(id+"아이디");
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
				result=manager.selectWeekNut(result);
				if(result==null) {
					model.addAttribute("countday", countday);
					return "health/weekMyNut";
				}
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
	
	@RequestMapping(value = "showMonthNut", method = RequestMethod.POST)
	public String showMonthNut(Model model, HttpSession session, String countday) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		String id=(String) session.getAttribute("memberID");
		mynut result=new mynut();
		SimpleDateFormat formatter=new SimpleDateFormat("YYYY-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
		String monthendday=formatter.format(cal.getTime());
		System.out.println(monthendday);
		cal.set(Calendar.DATE, 1);
		String monthstartday=formatter.format(cal.getTime());
		System.out.println(monthstartday);
		result.setMonthstartday(monthstartday);
		result.setMonthendday(monthendday);
		result.setId(id);
		
		result=manager.selectMonthNut(result);
		if(result==null) {
			model.addAttribute("countday", countday);
			return "health/monthMyNut";
		}
		System.out.println(result.toString());
		model.addAttribute("mynut", result);
		model.addAttribute("countday", countday);
		return "health/monthMyNut";
	}
	
	@RequestMapping(value = "gotoShowHospital", method = RequestMethod.GET)
	public String gotoShowHospital(Model model, HttpSession session) {
		healthDao manager=sqlSession.getMapper(healthDao.class);
		
		return "health/showHospital";
	}
	

	
}
