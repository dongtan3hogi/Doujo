package com.scit.doujo.vo.work;

public class friendquery {
	String id;
	String sex;
	int age;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public friendquery(String id, String sex, int age) {
		super();
		this.id = id;
		this.sex = sex;
		this.age = age;
	}
	@Override
	public String toString() {
		return "friendquery [id=" + id + ", sex=" + sex + ", age=" + age + "]";
	}
	
}
