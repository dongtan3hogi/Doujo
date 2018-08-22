package com.scit.doujo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	
	@RequestMapping(value = "gotoSample01", method = RequestMethod.GET)
	public String gotoSample01() {
		return "sample/sample01";
	}
	
	//메인페이지 이동
	@RequestMapping(value = "gotoMain", method = RequestMethod.GET)
	public String gotoMain() {
	
		return "main";
	}
}
