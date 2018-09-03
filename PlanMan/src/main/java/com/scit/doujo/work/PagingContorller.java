package com.scit.doujo.work;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.dao.workDao;
import com.scit.doujo.util.work_PageNavi;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.work.memo;


@Controller
public class PagingContorller {
@Autowired
SqlSession session;

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
	int size = (articles.size()+10)/10;
	
	ArrayList<String[]> result=new ArrayList<String[]>();
	if(page==size) {
		for(int a=(page-1)*10; a<articles.size(); a++) {
			result.add(articles.get(a));
		}
	}
	else {
	for(int a=(page-1)*10; a<page*10; a++) {
		result.add(articles.get(a));
	}
	}
	return result;
	
}
}

HelloComponent article = new HelloComponent();

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search( Model model,String value,HttpSession hs) {
		 String clientId = "R_QmcaTVRocv7D5el105";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "8SepLUgZQs";//애플리케이션 클라이언트 시크릿값";
	        StringBuffer response = null;
	        try {
	        	System.out.println(value);
	            String text = URLEncoder.encode(value, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text+"&display=100"; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
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
	            
	          
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = null;
			try {
				jsonObj = (JSONObject) jsonParser.parse(response.toString());
			} catch (org.json.simple.parser.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONArray memberArray = (JSONArray) jsonObj.get("items");
			
			ArrayList<String[]> result= new ArrayList<String[]>();
			for(int i=0 ; i<memberArray.size() ; i++){
				String[] a= new String[2];
			    JSONObject tempObj = (JSONObject) memberArray.get(i);
			    a[0]=(String) tempObj.get("title");
			    a[1]=(String) tempObj.get("link");
			    result.add(a);

			}
			article.setValue(result);
			work_PageNavi pn = new work_PageNavi(1,result.size());
			model.addAttribute("navi",pn);
			ArrayList<String[]> ab = article.page(1);
			model.addAttribute("result",ab);
			workDao um= session.getMapper(workDao.class);
			member m = (member)hs.getAttribute("member");
			String userid=m.getId();
			List<memo> result2 = um.allMemo(userid);
			model.addAttribute("mlist", result2);
			
		return "work/news";
	}
	@RequestMapping(value = "/goPage", method = RequestMethod.GET)
	public String goPage( Model model,int value,HttpSession hs) {
		ArrayList<String[]> result = article.page(value);
		model.addAttribute("result",result);
		workDao um= session.getMapper(workDao.class);
		member m = (member)hs.getAttribute("member");
		String userid=m.getId();
		List<memo> result2 = um.allMemo(userid);
		model.addAttribute("mlist", result2);
		work_PageNavi pn = new work_PageNavi(value,article.getStaticHello().size());
		model.addAttribute("navi",pn);

		return "work/news";
	}
	
	@RequestMapping(value = "/findKeyword", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String findKeyword( Model model,String search,HttpSession hs) {
	        String secretKey = "8750682406266725427";//애플리케이션 클라이언트 시크릿값";
	        StringBuffer response = null;
	        try {
	            String text = URLEncoder.encode(search, "UTF-8");
	            String apiURL = "http://api.datamixi.com/datamixiApi/keywordextract?key="+secretKey+"&text="+text; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("key", secretKey);
	          
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
				temp = (JSONArray) jsonObj.get("return_object");
			} catch (Exception e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "null";
			}ArrayList<String> terms= new ArrayList<String>();
			for(int i =0; i<temp.size();i++) {
			jsonObj=(JSONObject) temp.get(i);
			String term = (String) jsonObj.get("term");
			StringTokenizer st = new StringTokenizer(term, "|");
			terms.add(st.nextToken());
			}
			workDao um= session.getMapper(workDao.class);
			member m= (member) hs.getAttribute("member");
			String userid =m.getId();
			for(String value: terms) {
				if(value.contains("_")) continue;
				String find= um.findKeyword(userid, value);
				
				if(find!=null) continue;
				else {
				um.insertWord(userid ,value);
				}
			}
			System.out.println(terms.get(0));
		return terms.get(0);
		
	}
}
