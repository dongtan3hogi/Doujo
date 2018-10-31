package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface studyDao {


	public int insertGroup(Map<String, String> group);
	

	public int alert(Map<String, String> group);
	

	public int insertGroupMember(Map<String, String> groupmember);
	

	public ArrayList<Map<String, String>> selectGroup(Map<String, String> group);
	
	public ArrayList<Map<String,String>> selectMyGroup(String id);

	public int selectLastMakeGroupseq(String id);
	
	public int selectGroupmember(Map<String, String> groupmember);
	
	public Map<String, String> selectOneGroup(int num);
	
	
	//
	//
	//
	//
	
	//insert
	public int insertMQuiz(Map<String, String> quiz);
	public int insertJQuiz(Map<String, String> quiz);
	
	public ArrayList<Map<String, String>> selectAllQuizrecordlist(String id);
	
	public int insertQuizrecordlist(Map<String, String> quiz);
	
	public int insertQuizrecord(Map<String, String> quiz);
	
	public int countQuizrecordlist(String id);

	public Map<String, String> selectOneQuiz(int num);
	
	public int findQuizrecord(Map<String, String> quiz);
	
	public int updateCQuizrecord(Map<String, String> quiz);
	
	public int updateWQuizrecord(Map<String, String> quiz);
	
	public int findQuizrecordlist(String quizrecordcode);
	
	public int findMaxQuizseq(Map<String, String> quiz);
	
	public ArrayList<Map<String, String>> selectRecordQuiz(Map<String, String> quiz, RowBounds rb);
	
	public int countRecordQuiz(Map<String, String> quiz);
	
	public ArrayList<Map<String, String>> selectAllRecordQuiz(Map<String, String> quiz);
	
	public String selectQuizrecordname(Map<String, String> quiz);
	
	public ArrayList<Map<String, String>> selectSearchingQuizrecordlist(Map<String, String> quiz, RowBounds rb);
		
	public int countSearchingQuizrecordlist(Map<String, String> quiz);
	
	public int insertMQuiz2(Map<String, String> quiz);
	public int insertJQuiz2(Map<String, String> quiz);
	
	public int countQuizrecordlistForTaking(Map<String, String> quiz);
}
