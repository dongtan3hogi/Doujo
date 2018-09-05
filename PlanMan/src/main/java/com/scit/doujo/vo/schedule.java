package com.scit.doujo.vo;

public class schedule {

	private int schseq;
	private String id;
	private String eventtype;
	private String eventtitle;
	private String eventcontent;
	private String startday;
	private String endday;
	private String startdaytime;
	private String enddaytime;
	private String starttime;
	private String endtime;
	private String weekMonday;
	private String weekSunday;
	private int diffDay;
	private int doornot;

	public schedule(int schseq, String id, String eventtype, String eventtitle, String eventcontent, String startday,
			String endday, String startdaytime, String enddaytime, String starttime, String endtime, String weekMonday,
			String weekSunday, int diffDay, int doornot) {
		super();
		this.schseq = schseq;
		this.id = id;
		this.eventtype = eventtype;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.startday = startday;
		this.endday = endday;
		this.startdaytime = startdaytime;
		this.enddaytime = enddaytime;
		this.starttime = starttime;
		this.endtime = endtime;
		this.weekMonday = weekMonday;
		this.weekSunday = weekSunday;
		this.diffDay = diffDay;
		this.doornot = doornot;
	}

	public schedule() {
		super();
	}

	public int getSchseq() {
		return schseq;
	}

	public void setSchseq(int schseq) {
		this.schseq = schseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEventtype() {
		return eventtype;
	}

	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}

	public String getEventtitle() {
		return eventtitle;
	}

	public void setEventtitle(String eventtitle) {
		this.eventtitle = eventtitle;
	}

	public String getEventcontent() {
		return eventcontent;
	}

	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	public String getStartdaytime() {
		return startdaytime;
	}

	public void setStartdaytime(String startdaytime) {
		this.startdaytime = startdaytime;
	}

	public String getEnddaytime() {
		return enddaytime;
	}

	public void setEnddaytime(String enddaytime) {
		this.enddaytime = enddaytime;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getWeekMonday() {
		return weekMonday;
	}

	public void setWeekMonday(String weekMonday) {
		this.weekMonday = weekMonday;
	}

	public String getWeekSunday() {
		return weekSunday;
	}

	public void setWeekSunday(String weekSunday) {
		this.weekSunday = weekSunday;
	}

	public int getDiffDay() {
		return diffDay;
	}

	public void setDiffDay(int diffDay) {
		this.diffDay = diffDay;
	}

	public int getDoornot() {
		return doornot;
	}

	public void setDoornot(int doornot) {
		this.doornot = doornot;
	}

	@Override
	public String toString() {
		return "schedule [schseq=" + schseq + ", id=" + id + ", eventtype=" + eventtype + ", eventtitle=" + eventtitle
				+ ", eventcontent=" + eventcontent + ", startday=" + startday + ", endday=" + endday + ", startdaytime="
				+ startdaytime + ", enddaytime=" + enddaytime + ", starttime=" + starttime + ", endtime=" + endtime
				+ ", weekMonday=" + weekMonday + ", weekSunday=" + weekSunday + ", diffDay=" + diffDay + ", doornot="
				+ doornot + "]";
	}

}