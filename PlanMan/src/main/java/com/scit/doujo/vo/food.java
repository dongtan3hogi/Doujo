package com.scit.doujo.vo;

public class food {
	private String NUTR_CONT3;
	private String NUTR_CONT2;
	private String NUTR_CONT1;
	private String BGN_YEAR;
	private String NUTR_CONT9;
	private String NUTR_CONT8;
	private String FOOD_CD;
	private String NUTR_CONT7;
	private String NUTR_CONT6;
	private String NUTR_CONT5;
	private String NUTR_CONT4;
	private String DESC_KOR;
	private String SERVING_WT;
	private String FDGRP_NM;
	private String NUM;
	private String ANIMAL_PLANT;

	public food(String nUTR_CONT3, String nUTR_CONT2, String nUTR_CONT1, String bGN_YEAR, String nUTR_CONT9,
			String nUTR_CONT8, String fOOD_CD, String nUTR_CONT7, String nUTR_CONT6, String nUTR_CONT5,
			String nUTR_CONT4, String dESC_KOR, String sERVING_WT, String fDGRP_NM, String nUM, String aNIMAL_PLANT) {
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

	public String getNUTR_CONT3() {
		return NUTR_CONT3;
	}

	public void setNUTR_CONT3(String nUTR_CONT3) {
		NUTR_CONT3 = nUTR_CONT3;
	}

	public String getNUTR_CONT2() {
		return NUTR_CONT2;
	}

	public void setNUTR_CONT2(String nUTR_CONT2) {
		NUTR_CONT2 = nUTR_CONT2;
	}

	public String getNUTR_CONT1() {
		return NUTR_CONT1;
	}

	public void setNUTR_CONT1(String nUTR_CONT1) {
		NUTR_CONT1 = nUTR_CONT1;
	}

	public String getBGN_YEAR() {
		return BGN_YEAR;
	}

	public void setBGN_YEAR(String bGN_YEAR) {
		BGN_YEAR = bGN_YEAR;
	}

	public String getNUTR_CONT9() {
		return NUTR_CONT9;
	}

	public void setNUTR_CONT9(String nUTR_CONT9) {
		
		NUTR_CONT9 = nUTR_CONT9;
		
	}

	public String getNUTR_CONT8() {
		return NUTR_CONT8;
	}

	public void setNUTR_CONT8(String nUTR_CONT8) {
		NUTR_CONT8 = nUTR_CONT8;
	}

	public String getFOOD_CD() {
		return FOOD_CD;
	}

	public void setFOOD_CD(String fOOD_CD) {
		FOOD_CD = fOOD_CD;
	}

	public String getNUTR_CONT7() {
		return NUTR_CONT7;
	}

	public void setNUTR_CONT7(String nUTR_CONT7) {
		NUTR_CONT7 = nUTR_CONT7;
	}

	public String getNUTR_CONT6() {
		return NUTR_CONT6;
	}

	public void setNUTR_CONT6(String nUTR_CONT6) {
		NUTR_CONT6 = nUTR_CONT6;
	}

	public String getNUTR_CONT5() {
		return NUTR_CONT5;
	}

	public void setNUTR_CONT5(String nUTR_CONT5) {
		NUTR_CONT5 = nUTR_CONT5;
	}

	public String getNUTR_CONT4() {
		return NUTR_CONT4;
	}

	public void setNUTR_CONT4(String nUTR_CONT4) {
		NUTR_CONT4 = nUTR_CONT4;
	}

	public String getDESC_KOR() {
		return DESC_KOR;
	}

	public void setDESC_KOR(String dESC_KOR) {
		DESC_KOR = dESC_KOR;
	}

	public String getSERVING_WT() {
		return SERVING_WT;
	}

	public void setSERVING_WT(String sERVING_WT) {
		SERVING_WT = sERVING_WT;
	}

	public String getFDGRP_NM() {
		return FDGRP_NM;
	}

	public void setFDGRP_NM(String fDGRP_NM) {
		FDGRP_NM = fDGRP_NM;
	}

	public String getNUM() {
		return NUM;
	}

	public void setNUM(String nUM) {
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