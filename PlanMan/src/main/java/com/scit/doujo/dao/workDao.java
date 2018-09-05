package com.scit.doujo.dao;

import java.util.List;

import com.scit.doujo.vo.work.count;
import com.scit.doujo.vo.work.friendquery;
import com.scit.doujo.vo.work.keylist;
import com.scit.doujo.vo.work.memo;


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
	
}
