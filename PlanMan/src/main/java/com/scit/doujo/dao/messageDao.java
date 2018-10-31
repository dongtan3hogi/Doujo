package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface messageDao {

	public ArrayList<Map<String, String>> selectNewMessage(Map<String, String> message);
	

	public int countNewMessage(Map<String, String> message);
	
	

	public ArrayList<Map<String, String>> selectNewNorMessage(Map<String, String> message); 
	

	public int insertMessage(Map<String, String> message); 
	

	public int updateTypeNewToNor(Map<String, String> message); 	
}
