package com.scit.doujo.vo;

public class mynut {
	private String id;
	private String countday;
	private String weekMonday;
	private String weekSunday;
	private String monthstartday;
	private String monthendday;
	private int kacl;
	private int carbo;
	private int protein;
	private int fat;
	private int sugar;
	private int sodium;
	private int cholesterol;
	private int fatty;
	private int transfat;

	public mynut(String id, String countday, String weekMonday, String weekSunday, String monthstartday,
			String monthendday, int kacl, int carbo, int protein, int fat, int sugar, int sodium, int cholesterol,
			int fatty, int transfat) {
		super();
		this.id = id;
		this.countday = countday;
		this.weekMonday = weekMonday;
		this.weekSunday = weekSunday;
		this.monthstartday = monthstartday;
		this.monthendday = monthendday;
		this.kacl = kacl;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.sodium = sodium;
		this.cholesterol = cholesterol;
		this.fatty = fatty;
		this.transfat = transfat;
	}

	public mynut() {
		super();
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

	public String getMonthstartday() {
		return monthstartday;
	}

	public void setMonthstartday(String monthstartday) {
		this.monthstartday = monthstartday;
	}

	public String getMonthendday() {
		return monthendday;
	}

	public void setMonthendday(String monthendday) {
		this.monthendday = monthendday;
	}

	public int getKacl() {
		return kacl;
	}

	public void setKacl(int kacl) {
		this.kacl = kacl;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getSodium() {
		return sodium;
	}

	public void setSodium(int sodium) {
		this.sodium = sodium;
	}

	public int getCholesterol() {
		return cholesterol;
	}

	public void setCholesterol(int cholesterol) {
		this.cholesterol = cholesterol;
	}

	public int getFatty() {
		return fatty;
	}

	public void setFatty(int fatty) {
		this.fatty = fatty;
	}

	public int getTransfat() {
		return transfat;
	}

	public void setTransfat(int transfat) {
		this.transfat = transfat;
	}

	@Override
	public String toString() {
		return "mynut [id=" + id + ", countday=" + countday + ", weekMonday=" + weekMonday + ", weekSunday="
				+ weekSunday + ", monthstartday=" + monthstartday + ", monthendday=" + monthendday + ", kacl=" + kacl
				+ ", carbo=" + carbo + ", protein=" + protein + ", fat=" + fat + ", sugar=" + sugar + ", sodium="
				+ sodium + ", cholesterol=" + cholesterol + ", fatty=" + fatty + ", transfat=" + transfat + "]";
	}

}
