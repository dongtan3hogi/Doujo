package com.scit.doujo.dao;

import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;

public interface memberDao {
	
	//회원가입
	public int insertMember(member vo);
	//아이디 중복 확인
	public String idDoubleCheck(String id);
	//로그인하기
	public member doLogin(member vo);
	//스케쥴 추가하기
	public int addschdule(schedule vo);
	
}
