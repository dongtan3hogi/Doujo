package com.scit.doujo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scit.doujo.vo.board;
import com.scit.doujo.vo.friend;
import com.scit.doujo.vo.member;

public interface friendDao {

	public ArrayList<member> listMember(String searchText, int startRecord, int countPerPage);

	public int getTotal(String searchText);

	public ArrayList<friend> listfriend(String searchText, int startRecord, int countPerPage);

	public void updateMember(member friend);

	public int getRecommendFriendsCount(Map<String,String> map);

	public List<friend> select(String searchItem, String searchWord, int startRecord, int countPerPage);

	public List<friend> select(Map<String, String> map, RowBounds rb);

	public List<member> getRecommendFriends(Map<String, String> map, RowBounds rb);

	public board selectOne(String id);
	
	public int insert(@Param(value="userid")String userid, @Param(value="id")String id);
		
	public void acceptFriend(String userid, String fid);

	public List<friend> getMyFriends(Map<String, String> map, RowBounds rb);

	public int getMyFriendsCount(Map<String, String> map);
	
	public int checkFriend(String userid, String id);

	public ArrayList<friend> selectFriendLsit(String userid);
	
	public int insertBoard(board board);

	public List<board> selectAllBoard(String userid);
	//친구 등록하기(수락하기)
	public int insertMyFriend(friend vo2);
	//친구 목록가져오기
	public ArrayList<Map<String,String>> selectMyFriendList(String userid);

	public List<board> boardpaging(String userid, int first, int second);

	public List<board> selectListBoard(String userid);
	
}
