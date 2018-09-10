package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface messageDao {
	/* takeid가 보내는 사람 */
	// 1. 가장 최신의 new 타입 메세지를 가져온다.
	// parameter: takeid
	// return 	: 
	public ArrayList<Map<String, String>> selectNewMessage(Map<String, String> message);
	
	// 2. new 타입의 메세지의 수를 가져온다.
	// parameter: giveid, takeid
	// return 	: count(*)
	public int countNewMessage(Map<String, String> message);
	
	
	// 3. new 타입과 nor 타입의 메세지를 가져온다.
	// parameter: giveid, takeid
	// return 	: *
	public ArrayList<Map<String, String>> selectNewNorMessage(Map<String, String> message); 
	
	
	// 4. 메세지입력.
	// parameter: *
	// return 	: *
	public int insertMessage(Map<String, String> message); 
	
	// 5. nor타입의 메세지를 new 타입의 메세지로 바꾼다.
	// parameter: 
	// return 	: 
	public int updateTypeNewToNor(Map<String, String> message); 	
}
