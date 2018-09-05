package com.scit.doujo.vo.work;

public class friendquery {
	String id;
	String gender;
	int age;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getgender() {
		return gender;
	}
	public void setgender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public friendquery(String id, String gender, int age) {
		super();
		this.id = id;
		this.gender = gender;
		this.age = age;
	}
	@Override
	public String toString() {
		return "friendquery [id=" + id + ", gender=" + gender + ", age=" + age + "]";
	}
	
}
