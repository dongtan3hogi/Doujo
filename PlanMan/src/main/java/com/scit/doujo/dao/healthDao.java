package com.scit.doujo.dao;

import java.util.ArrayList;

import com.scit.doujo.vo.activity;
import com.scit.doujo.vo.eatfood;
import com.scit.doujo.vo.food;
import com.scit.doujo.vo.member;
import com.scit.doujo.vo.mynut;
import com.scit.doujo.vo.schedule;

public interface healthDao {

	//키 및 몸무게 입력여부확인하기
	public int selectBodyInfo(String id);
	//키, 몸무게 입력하기
	public int updateBodyInfo(member vo);
	//음식리스트 불러오기
	public ArrayList<food> selectFood(String FDGRP_NM);
	//음식 한개 가져오기
	public food selectOneFood(int nUM);
	//식사한 음식 추가하기
	public int insertEatfood(eatfood vo2);
	//사용자가 먹은 식단표 가져오기
	public ArrayList<eatfood> selectEatfood(eatfood vo);
	//식단표에서 음식 삭제하기
	public int deleteOneMeal(int eatnum);
	//활동입력하기
	public int insertActKacl(activity vo);
	//활동 모두 가져오기
	public ArrayList<activity> selectActList(eatfood vo);
	//하루 음식 영양분 모두 더한 값 가져오기 
	public eatfood sumDayNut(eatfood vo);
	//오늘의 영양소 가져오기
	public mynut selectTodayMynut(mynut vo2);
	//MyNut 입력하기
	public int insertMyNut(mynut vo);
	//MyNut 업데이트 하기
	public int updateMyNut(mynut vo);
	//나의 권장 칼로리 가져오기
	public int selectMyKacl(String id);
	//이번주 영양정보 가져오기
	public mynut selectWeekNut(mynut result);
	//이번달 영양정보 가져오기
	public mynut selectMonthNut(mynut result);
	

	//public void insertInputFood(food object);
	//음식불러오기
	
}
