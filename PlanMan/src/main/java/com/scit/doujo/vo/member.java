package com.scit.doujo.vo;

public class member {

	private String id;
	private String password;
	private String nickname;
	private String name;
	private String gender;
	private int age;
	private String job;
	private String hobby;
	private double height;
	private double weight;
	private double daykacl;

	public member(String id, String password, String nickname, String name, String gender, int age, String job,
			String hobby, double height, double weight, double daykacl) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.job = job;
		this.hobby = hobby;
		this.height = height;
		this.weight = weight;
		this.daykacl = daykacl;
	}

	public member() {
		super();
	}

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getDaykacl() {
		return daykacl;
	}

	public void setDaykacl(double daykacl) {
		this.daykacl = daykacl;
	}

	@Override
	public String toString() {
		return "member [id=" + id + ", password=" + password + ", nickname=" + nickname + ", name=" + name + ", gender="
				+ gender + ", age=" + age + ", job=" + job + ", hobby=" + hobby + ", height=" + height + ", weight="
				+ weight + ", daykacl=" + daykacl + "]";
	}

}