package com.scit.doujo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.scit.doujo.vo.work.count;
import com.scit.doujo.vo.work.favorites;
import com.scit.doujo.vo.work.friendquery;
import com.scit.doujo.vo.work.keylist;
import com.scit.doujo.vo.work.memo;
import com.scit.doujo.vo.work.wordCloud;


public interface workDao {
	
	public int insertWord(  String id,  String keyword);
	public List<keylist> keyList(String userid);
	public List<keylist> friendKeyword(String userid);
	public String findKeyword(String id, String keyword);
	public count[] findFriend(friendquery fq );
	public int insertMemo(memo m);
	public memo findMemo(memo m);
	public boolean updateMemo(memo m);
	public int deleteMemo(memo m);
	public List<memo> allMemo(String userid);
	public int deleteKeyword(String userid,String value);
	public int insertFavorites(favorites fv);
	public int deleteFavorites(favorites fv);
	public List<favorites> allFavorites(String userid);
	public String[] memodays (String userid);
	public List<wordCloud> wordList();
}
