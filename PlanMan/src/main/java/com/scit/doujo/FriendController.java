package com.scit.doujo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.doujo.util.work_PageNavi;
import com.scit.doujo.work.PagingContorller.HelloComponent;

@Controller
public class FriendController {

	@Component
	public class HelloComponent {
		private ArrayList<String[]> articles;
		private void setValue(ArrayList<String[]> hello) {
			articles = hello;
		}
		public ArrayList<String[]> getStaticHello() {
			return articles; // spring.profiles.active is default
		}
		public ArrayList<String[]> page(int page) {
			int size = (articles.size() + 3) / 3;
			ArrayList<String[]> result = new ArrayList<String[]>();
			if (page == size) {
				for (int a = (page - 1) * 3; a < articles.size(); a++) {
					result.add(articles.get(a));
				}
			} else {
				for (int a = (page - 1) * 3; a < page * 3; a++) {
					result.add(articles.get(a));
				}
			}
			return result;
		}
	}
	HelloComponent article = new HelloComponent();

	@RequestMapping(value = "/goFriendMain", method = RequestMethod.GET)
	public String goFriendMain(HttpSession hs, Model model) {
		return "friendMain";
	}

	@RequestMapping(value = "/searchMeeting", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> searchMeeting(String search) {
		String USER_AGENT = "Mozilla/5.0";

		String request = "http://search.onoffmix.com/event?s=%23" + search;
		System.out.println(request);
		Connection conn = Jsoup.connect(request).header("Content-Type", "application/json;charset=UTF-8")
				.userAgent(USER_AGENT).method(Connection.Method.GET).ignoreContentType(true);

		Document doc = null;
		try {
			doc = conn.get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		List<Element> a = doc.select("ul.todayEvent");
		System.out.println(a.size());
		ArrayList<String[]> result = new ArrayList<String[]>();
		for (int i = 0; i < a.size(); i++) {
			String[] ds = new String[3];
			String link = a.get(i).select("li.eventThumbnail a").attr("href");
			String image = a.get(i).select("li.eventThumbnail img").attr("src");
			String title = a.get(i).select("li.eventThumbnail img").attr("alt");
			ds[0] = link;
			ds[1] = image;
			ds[2] = title;

			result.add(ds);
		}
		article.setValue(result);
		work_PageNavi pn = new work_PageNavi(10,1,result.size());
		Map<String ,Object> data = null;
		ArrayList<String[]> ab = article.page(1);
		data.put("meeting", ab);
		data.put("navi",pn);

		return data;

	}

}