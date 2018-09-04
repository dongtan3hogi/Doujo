package com.scit.doujo.vo;

public class food {
	private double NUTR_CONT3;
	private double NUTR_CONT2;
	private double NUTR_CONT1;
	private int BGN_YEAR;
	private double NUTR_CONT9;
	private double NUTR_CONT8;
	private double FOOD_CD;
	private double NUTR_CONT7;
	private double NUTR_CONT6;
	private double NUTR_CONT5;
	private double NUTR_CONT4;
	private String DESC_KOR;
	private int SERVING_WT;
	private String FDGRP_NM;
	private int NUM;
	private String ANIMAL_PLANT;

	public food(double nUTR_CONT3, double nUTR_CONT2, double nUTR_CONT1, int bGN_YEAR, double nUTR_CONT9,
			double nUTR_CONT8, double fOOD_CD, double nUTR_CONT7, double nUTR_CONT6, double nUTR_CONT5,
			double nUTR_CONT4, String dESC_KOR, int sERVING_WT, String fDGRP_NM, int nUM, String aNIMAL_PLANT) {
		super();
		NUTR_CONT3 = nUTR_CONT3;
		NUTR_CONT2 = nUTR_CONT2;
		NUTR_CONT1 = nUTR_CONT1;
		BGN_YEAR = bGN_YEAR;
		NUTR_CONT9 = nUTR_CONT9;
		NUTR_CONT8 = nUTR_CONT8;
		FOOD_CD = fOOD_CD;
		NUTR_CONT7 = nUTR_CONT7;
		NUTR_CONT6 = nUTR_CONT6;
		NUTR_CONT5 = nUTR_CONT5;
		NUTR_CONT4 = nUTR_CONT4;
		DESC_KOR = dESC_KOR;
		SERVING_WT = sERVING_WT;
		FDGRP_NM = fDGRP_NM;
		NUM = nUM;
		ANIMAL_PLANT = aNIMAL_PLANT;
	}

	public food() {
		super();
	}

	public double getNUTR_CONT3() {
		return NUTR_CONT3;
	}

	public void setNUTR_CONT3(double nUTR_CONT3) {
		NUTR_CONT3 = nUTR_CONT3;
	}

	public double getNUTR_CONT2() {
		return NUTR_CONT2;
	}

	public void setNUTR_CONT2(double nUTR_CONT2) {
		NUTR_CONT2 = nUTR_CONT2;
	}

	public double getNUTR_CONT1() {
		return NUTR_CONT1;
	}

	public void setNUTR_CONT1(double nUTR_CONT1) {
		NUTR_CONT1 = nUTR_CONT1;
	}

	public int getBGN_YEAR() {
		return BGN_YEAR;
	}

	public void setBGN_YEAR(int bGN_YEAR) {
		BGN_YEAR = bGN_YEAR;
	}

	public double getNUTR_CONT9() {
		return NUTR_CONT9;
	}

	public void setNUTR_CONT9(double nUTR_CONT9) {
		NUTR_CONT9 = nUTR_CONT9;
	}

	public double getNUTR_CONT8() {
		return NUTR_CONT8;
	}

	public void setNUTR_CONT8(double nUTR_CONT8) {
		NUTR_CONT8 = nUTR_CONT8;
	}

	public double getFOOD_CD() {
		return FOOD_CD;
	}

	public void setFOOD_CD(double fOOD_CD) {
		FOOD_CD = fOOD_CD;
	}

	public double getNUTR_CONT7() {
		return NUTR_CONT7;
	}

	public void setNUTR_CONT7(double nUTR_CONT7) {
		NUTR_CONT7 = nUTR_CONT7;
	}

	public double getNUTR_CONT6() {
		return NUTR_CONT6;
	}

	public void setNUTR_CONT6(double nUTR_CONT6) {
		NUTR_CONT6 = nUTR_CONT6;
	}

	public double getNUTR_CONT5() {
		return NUTR_CONT5;
	}

	public void setNUTR_CONT5(double nUTR_CONT5) {
		NUTR_CONT5 = nUTR_CONT5;
	}

	public double getNUTR_CONT4() {
		return NUTR_CONT4;
	}

	public void setNUTR_CONT4(double nUTR_CONT4) {
		NUTR_CONT4 = nUTR_CONT4;
	}

	public String getDESC_KOR() {
		return DESC_KOR;
	}

	public void setDESC_KOR(String dESC_KOR) {
		DESC_KOR = dESC_KOR;
	}

	public int getSERVING_WT() {
		return SERVING_WT;
	}

	public void setSERVING_WT(int sERVING_WT) {
		SERVING_WT = sERVING_WT;
	}

	public String getFDGRP_NM() {
		return FDGRP_NM;
	}

	public void setFDGRP_NM(String fDGRP_NM) {
		FDGRP_NM = fDGRP_NM;
	}

	public int getNUM() {
		return NUM;
	}

	public void setNUM(int nUM) {
		NUM = nUM;
	}

	public String getANIMAL_PLANT() {
		return ANIMAL_PLANT;
	}

	public void setANIMAL_PLANT(String aNIMAL_PLANT) {
		ANIMAL_PLANT = aNIMAL_PLANT;
	}

	@Override
	public String toString() {
		return "food [NUTR_CONT3=" + NUTR_CONT3 + ", NUTR_CONT2=" + NUTR_CONT2 + ", NUTR_CONT1=" + NUTR_CONT1
				+ ", BGN_YEAR=" + BGN_YEAR + ", NUTR_CONT9=" + NUTR_CONT9 + ", NUTR_CONT8=" + NUTR_CONT8 + ", FOOD_CD="
				+ FOOD_CD + ", NUTR_CONT7=" + NUTR_CONT7 + ", NUTR_CONT6=" + NUTR_CONT6 + ", NUTR_CONT5=" + NUTR_CONT5
				+ ", NUTR_CONT4=" + NUTR_CONT4 + ", DESC_KOR=" + DESC_KOR + ", SERVING_WT=" + SERVING_WT + ", FDGRP_NM="
				+ FDGRP_NM + ", NUM=" + NUM + ", ANIMAL_PLANT=" + ANIMAL_PLANT + "]";
	}

}