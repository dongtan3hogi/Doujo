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
	//'すべてのユーザー'をページング処理し,特定のページのリストを読み込む。
	public ArrayList<member> listMember(String searchText, int startRecord, int countPerPage);
	//友たち申請
	public void updateMember(member friend);
	//すべてのユーザの数を数える
	public int getRecommendFriendsCount(Map<String,String> map);
	//ユーザが望む友たちを推薦する
	public List<member> getRecommendFriends(Map<String, String> map, RowBounds rb);
	//せたくした掲示物を読み込む
	public board selectOne(String id);
	//友だちの申し出を受諾
	public void acceptFriend(String userid, String fid);
	//' 友達リスト'をページング処理し,特定のページの友人リストを読み込む。
	public List<friend> getMyFriends(Map<String, String> map, RowBounds rb);
	//すべての友たちの数を数える
	public int getMyFriendsCount(Map<String, String> map);
	
	public int checkFriend(String userid, String id);
	//使用者の友達のリスト読み込む
	public ArrayList<friend> selectFriendLsit(String userid);
	//掲示物を保存する
	public int insertBoard(board board);
	//すべての掲示物を１～３づつ読み込む
	public List<board> selectAllBoard(String userid);

	//友達のリストを読み込む
	public ArrayList<Map<String,String>> selectMyFriendList(String userid);
	//すべての掲示物をページング処理
	public List<board> boardpaging(@Param(value="id")String userid, @Param(value="first")int first, @Param(value="second")int second);
	//すべての掲示物を読み込む
	public List<board> selectListBoard(@Param(value="id")String userid);
	public int insertMyFriend(friend f);
}
