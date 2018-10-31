package com.scit.doujo.dao;

import java.util.ArrayList;

import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.schedule;

public interface memberDao {
	

	public int insertMember(member vo);

	public String idDoubleCheck(String id);

	public member doLogin(member vo);

	public ArrayList<schedule> selectSchdule(String id);

	public int addschdule(schedule vo);

	public int updateschdule(schedule vo);

	public int deleteschdule(int schseq);

	public ArrayList<schedule> selectTodaySch(schedule vo);

	public ArrayList<schedule> selectEventByType(schedule result);

	public int didschdule(int schseq);

	public int didnotschdule(int schseq);

	public int didschcount(schedule result);

	public int allschcount(schedule result);

	public void deletemember(member member);

	public int updateMember(member vo);

	public ArrayList<schedule> selectFriendSchdule(String friendID);

	public member selectOneMember(String sendid);

	public int idDoubleCheck2(String id);
	
	
}
