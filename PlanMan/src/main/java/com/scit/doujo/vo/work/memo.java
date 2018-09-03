package com.scit.doujo.vo.work;

public class memo {
	String id;
	String memo;
	String startdate;
	String enddate;
	public memo(String id, String memo, String startdate, String enddate) {
		super();
		this.id = id;
		this.memo = memo;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public memo() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	@Override
	public String toString() {
		return "{\"id\":" + "\""+id + "\""+ ", \"memo\":" +  "\""+memo+ "\"" + ", \"startdate\":" +  "\""+startdate + "\""+ ", \"enddate\":" + "\""+ enddate+ "\"" + "}";
	}
	
	
}
