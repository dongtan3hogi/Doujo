package com.scit.doujo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "home";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value = "gotoSignIn", method = RequestMethod.GET)
	public String GotoSignIn() {
	
		return "singIn";
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value = "gotoLogin", method = RequestMethod.GET)
	public String GotoLogin() {
	
		return "login";
	}
}
