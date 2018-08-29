package com.scit.doujo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

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
import com.scit.doujo.vo.food;

@Controller
public class HealthController {
		
	@Autowired
	SqlSession sqlSession;
	
	//헬스 메인페이지로 이동
	@RequestMapping(value = "/gotoHealth", method = RequestMethod.GET)
	public String gotoHealth(String eventtitle, HttpSession session) {
		System.out.println("잘들어왔니?"+eventtitle);
		session.setAttribute("eventtitle", eventtitle);
		return "health/healthMain";
	}
	
	//식단 입력 페이지로 이동
	@RequestMapping(value = "/gotoMeal", method = RequestMethod.GET)
	public String gotoMeal() {
		
		return "health/addMeal";
	}
	
	/*
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
