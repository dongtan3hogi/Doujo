package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface alermDao {
	
	
	public int insertGroupJoin(Map<String, String> alerm);
	
	
	
	public ArrayList<Map<String, String>> selectAlerm(Map<String, String> alerm);
	
	
	public int deleteAlerm(Map<String, String> alerm);
	

	public int countGroupJoinCheck(Map<String, String> alerm);
	
	
	public int insertFriendJoin(Map<String, String> alerm);


	public int insertScheduleAlerm(Map<String, String> alerm);
	

	public Map<String, String> selectAlermUserSeq(int alermseq);
	
}	
