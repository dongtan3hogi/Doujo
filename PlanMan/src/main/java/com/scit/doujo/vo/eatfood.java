package com.scit.doujo.vo;

public class eatfood {
	private String id;
	private int eatnum;
	private String DESC_KOR;
	private String countday;
	private int SERVING_WT;
	private double NUTR_CONT1;
	private double NUTR_CONT2;
	private double NUTR_CONT3;
	private double NUTR_CONT4;
	private double NUTR_CONT5;
	private double NUTR_CONT6;
	private double NUTR_CONT7;
	private double NUTR_CONT8;
	private double NUTR_CONT9;

	public eatfood(String id, int eatnum, String dESC_KOR, String countday, int sERVING_WT, double nUTR_CONT1,
			double nUTR_CONT2, double nUTR_CONT3, double nUTR_CONT4, double nUTR_CONT5, double nUTR_CONT6,
			double nUTR_CONT7, double nUTR_CONT8, double nUTR_CONT9) {
		super();
		this.id = id;
		this.eatnum = eatnum;
		DESC_KOR = dESC_KOR;
		this.countday = countday;
		SERVING_WT = sERVING_WT;
		NUTR_CONT1 = nUTR_CONT1;
		NUTR_CONT2 = nUTR_CONT2;
		NUTR_CONT3 = nUTR_CONT3;
		NUTR_CONT4 = nUTR_CONT4;
		NUTR_CONT5 = nUTR_CONT5;
		NUTR_CONT6 = nUTR_CONT6;
		NUTR_CONT7 = nUTR_CONT7;
		NUTR_CONT8 = nUTR_CONT8;
		NUTR_CONT9 = nUTR_CONT9;
	}

	public eatfood() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getEatnum() {
		return eatnum;
	}

	public void setEatnum(int eatnum) {
		this.eatnum = eatnum;
	}

	public String getDESC_KOR() {
		return DESC_KOR;
	}

	public void setDESC_KOR(String dESC_KOR) {
		DESC_KOR = dESC_KOR;
	}

	public String getCountday() {
		return countday;
	}

	public void setCountday(String countday) {
		this.countday = countday;
	}

	public int getSERVING_WT() {
		return SERVING_WT;
	}

	public void setSERVING_WT(int sERVING_WT) {
		SERVING_WT = sERVING_WT;
	}

	public double getNUTR_CONT1() {
		return NUTR_CONT1;
	}

	public void setNUTR_CONT1(double nUTR_CONT1) {
		NUTR_CONT1 = nUTR_CONT1;
	}

	public double getNUTR_CONT2() {
		return NUTR_CONT2;
	}

	public void setNUTR_CONT2(double nUTR_CONT2) {
		NUTR_CONT2 = nUTR_CONT2;
	}

	public double getNUTR_CONT3() {
		return NUTR_CONT3;
	}

	public void setNUTR_CONT3(double nUTR_CONT3) {
		NUTR_CONT3 = nUTR_CONT3;
	}

	public double getNUTR_CONT4() {
		return NUTR_CONT4;
	}

	public void setNUTR_CONT4(double nUTR_CONT4) {
		NUTR_CONT4 = nUTR_CONT4;
	}

	public double getNUTR_CONT5() {
		return NUTR_CONT5;
	}

	public void setNUTR_CONT5(double nUTR_CONT5) {
		NUTR_CONT5 = nUTR_CONT5;
	}

	public double getNUTR_CONT6() {
		return NUTR_CONT6;
	}

	public void setNUTR_CONT6(double nUTR_CONT6) {
		NUTR_CONT6 = nUTR_CONT6;
	}

	public double getNUTR_CONT7() {
		return NUTR_CONT7;
	}

	public void setNUTR_CONT7(double nUTR_CONT7) {
		NUTR_CONT7 = nUTR_CONT7;
	}

	public double getNUTR_CONT8() {
		return NUTR_CONT8;
	}

	public void setNUTR_CONT8(double nUTR_CONT8) {
		NUTR_CONT8 = nUTR_CONT8;
	}

	public double getNUTR_CONT9() {
		return NUTR_CONT9;
	}

	public void setNUTR_CONT9(double nUTR_CONT9) {
		NUTR_CONT9 = nUTR_CONT9;
	}

	@Override
	public String toString() {
		return "eatfood [id=" + id + ", eatnum=" + eatnum + ", DESC_KOR=" + DESC_KOR + ", countday=" + countday
				+ ", SERVING_WT=" + SERVING_WT + ", NUTR_CONT1=" + NUTR_CONT1 + ", NUTR_CONT2=" + NUTR_CONT2
				+ ", NUTR_CONT3=" + NUTR_CONT3 + ", NUTR_CONT4=" + NUTR_CONT4 + ", NUTR_CONT5=" + NUTR_CONT5
				+ ", NUTR_CONT6=" + NUTR_CONT6 + ", NUTR_CONT7=" + NUTR_CONT7 + ", NUTR_CONT8=" + NUTR_CONT8
				+ ", NUTR_CONT9=" + NUTR_CONT9 + "]";
	}

}
