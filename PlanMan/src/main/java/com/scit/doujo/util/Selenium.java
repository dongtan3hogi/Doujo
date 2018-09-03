package com.scit.doujo.util;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;


public class Selenium {
	 WebDriver driver;
 public Selenium() {
	
     System.setProperty("webdriver.chrome.driver", "resFiles/chromedriver.exe"); // 다운받은 ChromeDriver 위치를 넣어줍니다.
     driver = new ChromeDriver(); // Driver 생성
		
	 
 }
 public ArrayList<String[]> Search(String value, String type) {
	 String request =null;
	 String[] token = null;
	 String temp ="";
	 token= value.split(" ");
	 for(int i=0; i<token.length; i++) {
		 if(type.equals("google")||type.equals("BBC")||type.equals("yahoo")) {
		 if(token[i].contains("?")) token[i]="%3F";
		 if(i==token.length-1) {
			 temp+=token[i];
			continue;}
		 temp+=token[i]+"+";
		 }else if(type.equals("baidu")) {
			 if(token[i].contains("?")) token[i]="%3F";
			 if(i==token.length-1) {
				 temp+=token[i];
				continue;}
			 temp+=token[i]+"%20";
		 }
	 }
	 
	 if(type.equals("google")) {
	 request = "http://www.google.com/search?q=" + temp + "&num=100";	
	 }else if (type.equals("BBC")) {
		 request="https://www.bbc.co.uk/search?q="+temp+"&filter=news";
	 }else if(type.equals("baidu")) {
		 request = "https://www.baidu.com/s?ie=utf-8&wd="+temp;
	 }else if(type.equals("yahoo")) {
		 request = "https://search.yahoo.co.jp/search?ei=UTF-8&b=11&p="+temp;
	 }
			
    driver.get(request); // URL로 접속하기
    // WebElement coolestWidgetEvah = driver.findElement(By.id("coolestWidgetEvah")); //id로 Element 가져오기
    if(type.equals("BBC")) {
    	WebElement body = driver.findElement(By.tagName("body"));
        int numPage =10;
        for(int i=0; i<numPage; i++) {
        	for(int j=0; j<4; j++) {
        		body.sendKeys(Keys.PAGE_DOWN);
        		try {
					Thread.sleep((long) 300);
				} catch (InterruptedException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
        	try {
        driver.findElement(By.xpath("//a[@class='more']")).click();
        }catch(Exception e) {
        	body.sendKeys(Keys.PAGE_DOWN);
        	try {
				Thread.sleep((long) 300);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        }
        	} 
    }
    }
    ArrayList<String[]> result = new ArrayList<String[]>();
    if(type.equals("google")) {
    	 List<WebElement> cheese = (List<WebElement>) driver.findElements((By.cssSelector("h3.r a[href]"))); //클래스이름으로 Element 가져오기
         System.out.println(cheese.size());
         for(WebElement a : cheese) {
        	 System.out.println(a.toString());
        	 String[] ss = new String[2];
        	 ss[0]=a.getText();
        	 System.out.println(a.getText().toString());
        	 ss[1]= a.getAttribute("href");
        	 System.out.println(a.getAttribute("href").toString());
        	 result.add(ss);
         }
   	 }else if (type.equals("BBC")) {
   		List<WebElement> cheese = (List<WebElement>) driver.findElements((By.cssSelector("h1[itemprop='headline'] a[href]")));
   	 System.out.println(cheese.size());
     for(WebElement a : cheese) {
    	 System.out.println(a.toString());
    	 String[] ss = new String[2];
    	 ss[0]=a.getText();
    	 System.out.println(a.getText().toString());
    	 ss[1]= a.getAttribute("href");
    	 System.out.println(a.getAttribute("href").toString());
    	 result.add(ss);
   	 } 
   	 }else if(type.equals("baidu")) {
   		 for(int i=0; i<10; i++) {
   		 driver.navigate().to(request+"&pn="+i+"1");
    		List<WebElement> cheese = (List<WebElement>) driver.findElements((By.cssSelector("h3.t a[href]")));
    		System.out.println(cheese.size());
            for(WebElement a : cheese) {
           	 System.out.println(a.toString());
           	 String[] ss = new String[2];
           	 ss[0]=a.getText();
           	 System.out.println(a.getText().toString());
           	 ss[1]= a.getAttribute("href");
           	 System.out.println(a.getAttribute("href").toString());
           	 result.add(ss);
            }
   		 }
   	 }else if(type.equals("yahoo")){
   		for(int i=0; i<10; i++) {
      		 driver.navigate().to(request+"?b="+i+"1");
       		List<WebElement> cheese = (List<WebElement>) driver.findElements((By.cssSelector("div.hd > h3 a[href]")));
       		System.out.println(cheese.size());
               for(WebElement a : cheese) {
              	 System.out.println(a.toString());
              	 String[] ss = new String[2];
              	 ss[0]=a.getText();
              	 System.out.println(a.getText().toString());
              	 ss[1]= a.getAttribute("href");
              	 System.out.println(a.getAttribute("href").toString());
              	 result.add(ss);
               }
      		 }
   	 }
   
 driver.quit();  // Driver 종료
	 
	return result;
 }
}