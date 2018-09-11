package com.scit.doujo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;

public interface friendDao {

	ArrayList<member> listMember(String searchText, int startRecord, int countPerPage);

	int getTotal(String searchText);

	

	ArrayList<friend> listfriend(String searchText, int startRecord, int countPerPage);

	void updateMember(member friend);

	int getRecommendFriendsCount(Map<String,String> map);

	List<friend> select(String searchItem, String searchWord, int startRecord, int countPerPage);

	List<friend> select(Map<String, String> map, RowBounds rb);

	List<member> getRecommendFriends(Map<String, String> map, RowBounds rb);

	int deletemember(member member);
	
	public int delMember(String id);
	
	public int insertMember(member member);

	void selectOne(String id);

	int insert(@Param(value="userid")String userid, @Param(value="id")String id);
	void beInserted(String userid, String id);
	
	void acceptFriend(String userid, String fid);

	List<friend> getMyFriends(Map<String, String> map, RowBounds rb);

	int getMyFriendsCount(Map<String, String> map);
	friend checkFriend(String userid, String id);
}
