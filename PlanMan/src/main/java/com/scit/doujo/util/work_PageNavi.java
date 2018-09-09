package com.scit.doujo.util;

public class work_PageNavi {	//얘는 디비에 갔다오는 애는 아니다. 
	// 멤버선언
	private int COUNT_PER_PAGE ;	//페이지 당 레코드 수
	private final int PAGE_PER_GROUP = 5;	//그룹 당 페이지 수
	private int currentPage;				//현재 페이지
	private int totalRecordCount;			//전체 레코드 수 
	private int totalPageCount;				//전체 페이지 수
	private int currentGroup;				//현재 그룹
	private int startPageGroup;				//현재 그룹의 시작페이지
	private int endPageGroup;				//현재 그룹의 끝페이지
	private int startRecord;				//전체 레코드 중 현재 페이지의 첫 글
	// srow, erow 계산하지 않고, mybatis의 기능의 RowBounds 사용				
	// 생성자
	public work_PageNavi(int count_per_page,int currentPage, int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
		this.COUNT_PER_PAGE = count_per_page;
		//전체 페이지 수 계산
		// 전체 글개수 152개라면 ? 총 페이지 16페이지
		// 전체 글개수 150개라면 ? 총 페이지 15 페이지
		totalPageCount = (totalRecordCount + COUNT_PER_PAGE - 1) / COUNT_PER_PAGE;
		
		//< 눌러서 앞 페이지를 요청할 경우 currentPage가 1 페이지 미만
		if(currentPage < 1) this.currentPage = 1;
		if(currentPage > totalPageCount) currentPage = totalPageCount;
		this.currentPage = currentPage;
		
		// 현재 그룹 계산 : currentPage = 4 일 경우  currentGroup = 0 이다. 즉 0번 그룹에 속한다. 
		currentGroup = (currentPage - 1) / PAGE_PER_GROUP;
		
		//현재 그룹의 첫 페이지, 마지막 페이지, 첫 레코드 번호 계산
		startPageGroup = currentGroup * PAGE_PER_GROUP + 1;
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
		
		//현재 그룹의 마지막 페이지 
		endPageGroup = startPageGroup + PAGE_PER_GROUP - 1;
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup: totalPageCount;
		
		// 전체 레코드 중에서 현재 페이지의 첫 글의 위치
		startRecord = (currentPage - 1) * COUNT_PER_PAGE;
	}	
	// setter/getter/toString
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getCountPerPage() {
		return COUNT_PER_PAGE;
	}

	public int getPagePerGroup() {
		return PAGE_PER_GROUP;
	}

	@Override
	public String toString() {
		return "PageNavigator [COUNT_PER_PAGE=" + COUNT_PER_PAGE + ", PAGE_PER_GROUP=" + PAGE_PER_GROUP + ", currentPage="
				+ currentPage + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
}
