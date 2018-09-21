package com.scit.doujo.vo.work;

public class wordCloud {
String keyword;
int count;
@Override
public String toString() {
	return "wordCloud [keyword=" + keyword + ", count=" + count + "]";
}
public wordCloud() {
	super();
}
public wordCloud(String keyword, int count) {
	super();
	this.keyword = keyword;
	this.count = count;
}
public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
}
