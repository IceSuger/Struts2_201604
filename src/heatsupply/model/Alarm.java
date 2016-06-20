package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Alarm {
	private int id;
	private String sensor_id;
	private int reason;
	private int bug_cleared;
	private float t;
	private Date time;
	
	public int getReason() {
		return reason;
	}
	public void setReason(int reason) {
		this.reason = reason;
	}
	public int getBug_cleared() {
		return bug_cleared;
	}
	public void setBug_cleared(int bug_cleared) {
		this.bug_cleared = bug_cleared;
	}
	public float getT() {
		return t;
	}
	public void setT(float t) {
		this.t = t;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSensor_id() {
		return sensor_id;
	}
	public void setSensor_id(String sensor_id) {
		this.sensor_id = sensor_id;
	}
	
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
	
}
