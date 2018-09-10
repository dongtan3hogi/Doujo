package com.scit.doujo.util;

/**
 * �Խ��� ����¡ ó�� Ŭ����
 */
public class PageNavigator2 {
	//������ ���� ���� 
	private int countPerPage2;		//�������� �۸�� ��
	private int pagePerGroup2;		//�׷�� ������ �� 
	private int currentPage2;		//���� ������ (�ֱ� ���� 1���� ����)
	private int totalRecordsCount2;	//��ü �� ��
	private int totalPageCount2;		//��ü ������ ��
	private int currentGroup2;		//���� �׷� (�ֱ� �׷��� 0���� ����)
	private int startPageGroup2;		//���� �׷��� ù ������
	private int endPageGroup2;		//���� �׷��� ������ ������
	private int startRecord2;		//��ü ���ڵ� �� ���� ������ ù ���� ��ġ (0���� ����)
	
	/*
	 * ������
	 */
	public PageNavigator2(int countPerPage2, int pagePerGroup2, int currentPage2, int totalRecordsCount2) {
		//�������� �� ��, �׷�� ������ ��, ���� ������, ��ü �� ���� ���޹���
		this.countPerPage2 = countPerPage2;
		this.pagePerGroup2 = pagePerGroup2;
		this.totalRecordsCount2 = totalRecordsCount2;
		
		//��ü ������ ��
		totalPageCount2 = (totalRecordsCount2 + countPerPage2 - 1) / countPerPage2;

		//���޵� ���� �������� 1���� ������ ������������ 1�������� ����
		if (currentPage2 < 1)	currentPage2 = 1;
		//���޵� ���� �������� ������ ���������� ũ�� ������������ ������ �������� ����
		if (currentPage2 > totalPageCount2)	currentPage2 = totalPageCount2;
		
		this.currentPage2 = currentPage2;

		//���� �׷�
		currentGroup2 = (currentPage2 - 1) / pagePerGroup2;
		
		//���� �׷��� ù ������
		startPageGroup2 = currentGroup2 * pagePerGroup2 + 1;
		//���� �׷��� ù �������� 1���� ������ 1�� ó��
		startPageGroup2 = startPageGroup2 < 1 ? 1 : startPageGroup2;
		//���� �׷��� ������ ������
		endPageGroup2 = startPageGroup2 + pagePerGroup2 - 1;
		//���� �׷��� ������ �������� ��ü ������ ������ ������ ��ü������ ���� ����������.
		endPageGroup2 = endPageGroup2 < totalPageCount2 ? endPageGroup2 : totalPageCount2;

		//��ü ���ڵ� �� ���� ������ ù ���� ��ġ
		startRecord2 = (currentPage2 - 1) * countPerPage2;			
	}

	/*
	 * Getters and Setters
	 */
	public int getCountPerPage() {
		return countPerPage2;
	}

	public void setCountPerPage(int countPerPage2) {
		this.countPerPage2 = countPerPage2;
	}

	public int getPagePerGroup() {
		return pagePerGroup2;
	}

	public void setPagePerGroup(int pagePerGroup2) {
		this.pagePerGroup2 = pagePerGroup2;
	}

	public int getCurrentPage() {
		return currentPage2;
	}

	public void setCurrentPage(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	public int getTotalRecordsCount() {
		return totalRecordsCount2;
	}

	public void setTotalRecordsCount(int totalRecordsCount2) {
		this.totalRecordsCount2 = totalRecordsCount2;
	}

	public int getTotalPageCount() {
		return totalPageCount2;
	}

	public void setTotalPageCount(int totalPageCount2) {
		this.totalPageCount2 = totalPageCount2;
	}

	public int getCurrentGroup() {
		return currentGroup2;
	}

	public void setCurrentGroup(int currentGroup2) {
		this.currentGroup2 = currentGroup2;
	}

	public int getStartPageGroup() {
		return startPageGroup2;
	}

	public void setStartPageGroup(int startPageGroup2) {
		this.startPageGroup2 = startPageGroup2;
	}

	public int getEndPageGroup() {
		return endPageGroup2;
	}

	public void setEndPageGroup(int endPageGroup2) {
		this.endPageGroup2 = endPageGroup2;
	}

	public int getstartRecord2() {
		return startRecord2;
	}

	public void setstartRecord2(int startRecord2) {
		this.startRecord2 = startRecord2;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage2=" + countPerPage2 + ", pagePerGroup2=" + pagePerGroup2 + ", currentPage2="
				+ currentPage2 + ", totalRecordsCount2=" + totalRecordsCount2 + ", totalPageCount2=" + totalPageCount2
				+ ", currentGroup2=" + currentGroup2 + ", startPageGroup2=" + startPageGroup2 + ", endPageGroup2="
				+ endPageGroup2 + ", startRecord2=" + startRecord2 + "]";
	}
	
}