package com.scit.doujo.vo.work;

public class count {
	private String id;
	private int cc;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public count(String id, int cc) {
		super();
		this.id = id;
		this.cc = cc;
	}
	@Override
	public String toString() {
		return "friend [id=" + id + ", cc=" + cc + "]";
	}
	public count() {
		super();
	}
	
}
