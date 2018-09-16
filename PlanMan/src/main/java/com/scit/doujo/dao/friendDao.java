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

	ArrayList<member> listMember(String searchText, int startRecord, int countPerPage);

	int getTotal(String searchText);
	ArrayList<friend> listfriend(String searchText, int startRecord, int countPerPage);

	void updateMember(member friend);

	int getRecommendFriendsCount(Map<String,String> map);

	List<member> getRecommendFriends(Map<String, String> map, RowBounds rb);
	void selectOne(String id);
	int insert(@Param(value="userid")String userid, @Param(value="id")String id);
	void beInserted(String userid, String id);
	void acceptFriend(String userid, String fid);
	List<friend> getMyFriends(Map<String, String> map, RowBounds rb);
	int getMyFriendsCount(Map<String, String> map);
	friend checkFriend(String userid, String id);
	 int insertBoard(board board);
	 List<board> selectAllBoard(String userid);
	 List<board> boardpaging(@Param(value="id") String id, @Param(value="first") int first, @Param(value="second") int second);
}
