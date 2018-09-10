package com.scit.doujo.vo;

public class friend {
    private String userid;
    private String friendid;
    private String nickname;
    private String gender;
    private int age;
    private String job;
    private String hobby;
    private int type; 

public friend() {
	
}

public friend(String userid, String friendid, String nickname, String gender, int age, String job, String hobby,
		int type) {
	super();
	this.userid = userid;
	this.friendid = friendid;
	this.nickname = nickname;
	this.gender = gender;
	this.age = age;
	this.job = job;
	this.hobby = hobby;
	this.type = type;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getFriendid() {
	return friendid;
}

public void setFriendid(String friendid) {
	this.friendid = friendid;
}

public String getNickname() {
	return nickname;
}

public void setNickname(String nickname) {
	this.nickname = nickname;
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

public int getType() {
	return type;
}

public void setType(int type) {
	this.type = type;
}

@Override
public String toString() {
	return "friend [userid=" + userid + ", friendid=" + friendid + ", nickname=" + nickname + ", gender=" + gender
			+ ", age=" + age + ", job=" + job + ", hobby=" + hobby + ", type=" + type + "]";
   }
   
}
