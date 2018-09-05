package com.scit.doujo.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class naverNews {
	private HttpURLConnection con;
	public naverNews() {
		super();
		
	}
	public ArrayList<String[]> search(String value,int number ){
		String clientId = "R_QmcaTVRocv7D5el105";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "8SepLUgZQs";//애플리케이션 클라이언트 시크릿값";
        StringBuffer response = null;
        try {
        	System.out.println(value);
            String text = URLEncoder.encode(value, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text+"&display="+number; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            con = (HttpURLConnection)url.openConnection();
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
			String[] a= new String[3];
		    JSONObject tempObj = (JSONObject) memberArray.get(i);
		    a[0]=(String) tempObj.get("title");
		    a[1]=(String) tempObj.get("link");
		    a[2]=(String) tempObj.get("description");
		    result.add(a);

		}
		return result;
		
	}
}
