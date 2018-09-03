package com.scit.doujo.work;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class TranslateController {
	
	@RequestMapping(value = "/translate", method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	public @ResponseBody String translate( Model model,String text,String src, String target) {
		System.out.println(text+src+target);
		String result="";
		String clientId = "R_QmcaTVRocv7D5el105";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "8SepLUgZQs";//애플리케이션 클라이언트 시크릿값";
	        try {
	            text = URLEncoder.encode(text, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            // post request
	            String postParams = "source="+src+"&target="+target+"&text=" + text;
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.writeBytes(postParams);
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = null;
				try {
					jsonObj = (JSONObject) jsonParser.parse(response.toString());
					System.out.println(jsonObj.toString());
				} catch (org.json.simple.parser.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "error발생";
				}
			
				JSONObject memberArray =  (JSONObject)jsonObj.get("message");
				
				 memberArray =  (JSONObject)memberArray.get("result");
				 System.out.println(memberArray.toString());
				result = memberArray.get("translatedText").toString();
				System.out.println(result);
	        } catch (Exception e) {
	        	
	            System.out.println(e);
	           
	            return "error발생";
	        }
		return result;
	}
}
