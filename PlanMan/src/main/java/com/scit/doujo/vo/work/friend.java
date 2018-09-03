package com.scit.doujo.vo.work;

public class friend {
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
	public friend(String id, int cc) {
		super();
		this.id = id;
		this.cc = cc;
	}
	@Override
	public String toString() {
		return "friend [id=" + id + ", cc=" + cc + "]";
	}
	public friend() {
		super();
	}
	
}
