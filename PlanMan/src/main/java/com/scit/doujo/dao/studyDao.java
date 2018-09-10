package com.scit.doujo.dao;

import java.util.ArrayList;

import java.util.Map;

import org.apache.ibatis.session.RowBounds;

public interface studyDao {

	// 1. insert - Group생성
	public int insertGroup(Map<String, String> group);
	
	// 2. update - alert
	public int alert(Map<String, String> group);
	
	// 3. insert - insert member to ChatRoom
	public int insertGroupMember(Map<String, String> groupmember);
	
	// 4. select - 그룹검색
	public ArrayList<Map<String, String>> selectGroup(Map<String, String> group);
	
	// 5. select -�� �׷��� ��������
	public ArrayList<Map<String,String>> selectMyGroup(String id);

	// 6. select -�������� ���� �׷��ȣ ��������
	public int selectLastMakeGroupseq(String id);
	
	// 7. select -�׷��A �� ���B�� �����ϴ��� Ȯ��
	public int selectGroupmember(Map<String, String> groupmember);
	
	// 8. select
	// groupseq�� ����ؼ� �׷����� ��������.
	public Map<String, String> selectOneGroup(int num);
	
	
	//
	//
	//
	//
	
	//insert
	//���� �߰�
	public int insertMQuiz(Map<String, String> quiz);
	public int insertJQuiz(Map<String, String> quiz);
	
	//insert
	//�ױ� �߰��ϱ�
	public int insertTeg(Map<String, String> teg);
	
	//4.find-ã������ �±װ� �����ϴ��� �˾ƺ���
	public int findTeg(Map<String, String> teg);
	
	//5.update
	//�±� ī��Ʈ ����
	public int recountTeg(Map<String, String> teg);
	
	//select-����ڵ帮��Ʈ ���� ��� �̸� ��������
	//����ڵ帮��Ʈ ���� ��� �̸� ��������
	public ArrayList<Map<String, String>> selectAllQuizrecordlist(String id);
	
	//select-�±׿��� ��� ��������
	//select-�±׿��� ��� ��������
	public ArrayList<Map<String, String>> selectAllTeg(String id);
	
	//8.insert-����ڵ帮��Ʈ�� ���ο� ����ڵ� �߰��ϱ�
	public int insertQuizrecordlist(Map<String, String> quiz);
	
	//9.insert-����ڵ忡 ���� �߰��ϱ�
	public int insertQuizrecord(Map<String, String> quiz);
	
	//10.count-����ڵ� �� ��
	public int countQuizrecordlist(String id);
	
	//11.count-�±� �� ��
	public int countTeg(String id);
	
	//12_1.select
	//id�� teg(type�� ���û���)���� quiz �����´�.
	public ArrayList<Map<String, String>> selectTegQuiz(Map<String, String> quiz, RowBounds rb);
	
	//12_2.count
	public int countTegQuiz(Map<String, String> quiz);
	
	//12_3. SELECT
	public ArrayList<Map<String, String>> selectAllTegQuiz(Map<String, String> quiz);
	
	//select-����� ������ȣ�� ����ؼ� ���� �ϳ� ��������
	//select-����� ������ȣ�� ����ؼ� ���� �ϳ� ��������
	public Map<String, String> selectOneQuiz(int num);
	
	//15.find-����ڵ忡�� quizrecordcode-�����ȣ �� ��ġ�ϴ³��� �ִ��� Ȯ��(������ �߰��ϰ�, ������ ������Ʈ�ϱ� ���ؼ�)
	public int findQuizrecord(Map<String, String> quiz);
	
	//16_1.update-����ڵ忡 ���� ������Ʈ
	public int updateCQuizrecord(Map<String, String> quiz);
	
	//16_2.update-����ڵ忡 ���� ������Ʈ
	public int updateWQuizrecord(Map<String, String> quiz);
	
	//17.find-����ڵ帮��Ʈ�� �ڵ���ؼ� �ִ��� ã��.
	public int findQuizrecordlist(String quizrecordcode);
	
	//18.find-���� �����ֱٿ� ���� ���� �ҷ�����
	public int findMaxQuizseq(Map<String, String> quiz);
	
	//19_1.select
	//record�� ����ؼ� ����� ���ϴ� ������ ��������
	public ArrayList<Map<String, String>> selectRecordQuiz(Map<String, String> quiz, RowBounds rb);
	
	//19_2. COUNT
	public int countRecordQuiz(Map<String, String> quiz);
	
	//19_3. SELECT
	public ArrayList<Map<String, String>> selectAllRecordQuiz(Map<String, String> quiz);
	
	//20.selectQuizrecordname��������
	public String selectQuizrecordname(Map<String, String> quiz);
	
	//21_1.SELECT_searching the Quizrecordlist
	public ArrayList<Map<String, String>> selectSearchingQuizrecordlist(Map<String, String> quiz, RowBounds rb);
		
	//21_2.COUNT_searching the Quizrecordlist
	public int countSearchingQuizrecordlist(Map<String, String> quiz);
	
	//1_DUMMY
	public int insertMQuiz2(Map<String, String> quiz);
	public int insertJQuiz2(Map<String, String> quiz);
	
	//22
	public int countQuizrecordlistForTaking(Map<String, String> quiz);
}
