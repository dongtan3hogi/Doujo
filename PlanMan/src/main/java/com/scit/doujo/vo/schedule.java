package com.scit.doujo.vo;

public class schedule {

	private String id;
	private String eventtype;
	private String eventtitle;
	private String eventcontent;
	private String startday;
	private String endday;

	public schedule(String id, String eventtype, String eventtitle, String eventcontent, String startday,
			String endday) {
		super();
		this.id = id;
		this.eventtype = eventtype;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.startday = startday;
		this.endday = endday;
	}

	public schedule() {
		super();
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

	@Override
	public String toString() {
		return "schedule [id=" + id + ", eventtype=" + eventtype + ", eventtitle=" + eventtitle + ", eventcontent="
				+ eventcontent + ", startday=" + startday + ", endday=" + endday + "]";
	}

}