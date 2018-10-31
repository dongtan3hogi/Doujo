package com.scit.doujo.dao;

import java.util.ArrayList;

import com.scit.doujo.vo.activity;
import com.scit.doujo.vo.eatfood;
import com.scit.doujo.vo.food;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.mynut;
import com.scit.doujo.vo.schedule;

public interface healthDao {


	public int selectBodyInfo(String id);

	public int updateBodyInfo(member vo);

	public ArrayList<food> selectFood(String FDGRP_NM);

	public food selectOneFood(int nUM);

	public int insertEatfood(eatfood vo2);

	public ArrayList<eatfood> selectEatfood(eatfood vo);

	public int deleteOneMeal(int eatnum);

	public int insertActKacl(activity vo);

	public ArrayList<activity> selectActList(eatfood vo);

	public eatfood sumDayNut(eatfood vo);

	public mynut selectTodayMynut(mynut vo2);

	public int insertMyNut(mynut vo);
	
	public int updateMyNut(mynut vo);

	public int selectMyKacl(String id);

	public mynut selectWeekNut(mynut result);

	public mynut selectMonthNut(mynut result);
	
	

	//public void insertInputFood(food object);
	//음식불러오기
	
}
