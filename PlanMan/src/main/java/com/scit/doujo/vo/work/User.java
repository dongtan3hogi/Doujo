package com.scit.doujo.vo.work;

public class User {
	String id;
	String password;
	String name;
	String sex;
	int age;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public User(String id, String password, String name, String sex, int age) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.age = age;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", name=" + name + ", sex=" + sex + ", age=" + age + "]";
	}
	
}
