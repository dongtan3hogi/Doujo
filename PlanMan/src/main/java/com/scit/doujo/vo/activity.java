package com.scit.doujo.vo;

public class activity {
	private int actseq;
	private String id;
	private String countday;
	private String act;
	private double kacl;

	public activity(int actseq, String id, String countday, String act, double kacl) {
		super();
		this.actseq = actseq;
		this.id = id;
		this.countday = countday;
		this.act = act;
		this.kacl = kacl;
	}

	public activity() {
		super();
	}

	public int getActseq() {
		return actseq;
	}

	public void setActseq(int actseq) {
		this.actseq = actseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCountday() {
		return countday;
	}

	public void setCountday(String countday) {
		this.countday = countday;
	}

	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public double getKacl() {
		return kacl;
	}

	public void setKacl(double kacl) {
		this.kacl = kacl;
	}

	@Override
	public String toString() {
		return "activity [actseq=" + actseq + ", id=" + id + ", countday=" + countday + ", act=" + act + ", kacl="
				+ kacl + "]";
	}

}