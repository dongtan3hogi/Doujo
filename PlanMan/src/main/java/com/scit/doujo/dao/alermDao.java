package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface alermDao {
	
	//1.INSERT
	//일단 group가입신청에 필요한 양식으로 만들었는데 다른 구조가 필요하면 다시 만드는것도 좋을듯.
	//시간처리는 일단 패스함.
	//GROUPALERM에 최적화
	public int insertGroupJoin(Map<String, String> alerm);
	
	
	//2.SELECT
	//해당 ID의 모든 알람을 가져오기.
	public ArrayList<Map<String, String>> selectAlerm(Map<String, String> alerm);
	
	//3.DELETE
	public int deleteAlerm(Map<String, String> alerm);
	
	//4.COUNT
	//alerm을 입력하기 전 이미 해당 alerm이 존재하는지 확인하기.
	//GROUPALERM에 최적화
	public int countGroupJoinCheck(Map<String, String> alerm);
	
	
}	
