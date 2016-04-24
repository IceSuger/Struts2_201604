package heatsupply.model;

import java.util.Date;

public class Equipment {
	private int id;
	private int building_id;
	private String latitude;
	private String longitude;
	private float high_limit;
	private float low_limit;
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public float getHigh_limit() {
		return high_limit;
	}
	public void setHigh_limit(float high_limit) {
		this.high_limit = high_limit;
	}
	public float getLow_limit() {
		return low_limit;
	}
	public void setLow_limit(float low_limit) {
		this.low_limit = low_limit;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
