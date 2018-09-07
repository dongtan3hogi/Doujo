package com.scit.doujo.dao;

import java.util.ArrayList;

import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;

public interface memberDao {
	
	//회원가입
	public int insertMember(member vo);
	//아이디 중복 확인
	public String idDoubleCheck(String id);
	//로그인하기
	public member doLogin(member vo);
	//스케쥴 가져오기
	public ArrayList<schedule> selectSchdule(String id);
	//스케쥴 추가하기
	public int addschdule(schedule vo);
	//스케쥴 변경하기	
	public int updateschdule(schedule vo);
	//스케쥴 삭제하기
	public int deleteschdule(int schseq);
	//오늘 스케쥴 가져오기
	public ArrayList<schedule> selectTodaySch(schedule vo);
	//스케쥴 타입별로 이번주 스케쥴 가져오기
	public ArrayList<schedule> selectEventByType(schedule result);
	//스케쥴 완료 확인하기
	public int didschdule(int schseq);
	//스케쥴 완료 해제하기
	public int didnotschdule(int schseq);
	//완료한 스케쥴 개수 가져오기
	public int didschcount(schedule result);
	//타입별 스케쥴 개수 가져오기
	public int allschcount(schedule result);
	
	
}
