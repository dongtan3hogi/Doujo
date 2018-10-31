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
	//キーワード追加
	public int insertWord(  String id,  String keyword);
	//しようしゃのきーわーどのリストを読み込む
	public List<keylist> keyList(String userid);
	//私と似た人のキーワードを読み込む
	public List<keylist> friendKeyword(String userid);
	//わたしのきーわーどをみつける
	public String findKeyword(String id, String keyword);
	//私のキーワードと同じキーワードをおおく検索した人のリスト読み込む
	public count[] findFriend(friendquery fq );
	//メモ保存
	public int insertMemo(memo m);
	//特定の日のメモを読み込む
	public memo findMemo(memo m);
	//メモを修正する
	public boolean updateMemo(memo m);
	//めもをさくじょする
	public int deleteMemo(memo m);
	//使用者のすべてのメモを読み込む
	public List<memo> allMemo(String userid);
	
	//使用者のキーワードの記録を削除する
	public int deleteKeyword(String userid,String value);
	//お気に入りを保存する
	public int insertFavorites(favorites fv);
	//お気に入りを削除する
	public int deleteFavorites(favorites fv);
	//お気に入りを全部読み込む
	public List<favorites> allFavorites(String userid);
	//メモが入力されたすべての日を読み込む
	public String[] memodays (String userid);
	//wordcloud機能ためにすべてのユーザーのきーわーどを総合して検索した回数が高いキーワードをお見せ。
	public List<wordCloud> wordList();
}
