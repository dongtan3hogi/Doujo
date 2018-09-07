package com.scit.doujo.vo.work;

public class favorites {
	String id;
	String title;
	String locations;
	public favorites(String id, String locations) {
		super();
		this.id = id;
		this.locations = locations;
	}

	public favorites() {
		super();
	}

	

	@Override
	public String toString() {
		return "favorites [id=" + id + ", title=" + title + ", locations=" + locations + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocations() {
		return locations;
	}

	public void setLocations(String locations) {
		this.locations = locations;
	}

	public favorites(String id, String title, String locations) {
		super();
		this.id = id;
		this.title = title;
		this.locations = locations;
	}
}
