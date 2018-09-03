package com.scit.doujo.vo.work;

public class keylist {
	private String keyword;
	private String searchDate;
	@Override
	public String toString() {
		return "keylist [keyword=" + keyword + ", searchDate=" + searchDate + "]";
	}
	public keylist(String keyword, String searchDate) {
		super();
		this.keyword = keyword;
		this.searchDate = searchDate;
	}
	public keylist() {
		super();
	
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getsearchDate() {
		return searchDate;
	}
	public void setsearchDate(String searchDate) {
		this.searchDate = searchDate;
	}
}
