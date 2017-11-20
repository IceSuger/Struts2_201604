package heatsupply.action;

import heatsupply.model.Teacher;
import heatsupply.service.SensorService;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class SensorAction extends ActionSupport {
	private List<Teacher> Sensors;
	private SensorService SensorService = new SensorService();
	private Teacher Sensor;
	
	private List<Object> points;
	private List<String> unusedIds;
	private String building_id;
	private int level;
	
	public String getTeacherType() {
		return teacherType;
	}

	public void setTeacherType(String teacherType) {
		this.teacherType = teacherType;
	}

	public double getDist() {
		return dist;
	}

	public void setDist(double dist) {
		this.dist = dist;
	}

	private String teacherType;
	private double centerX;
	private double centerY;
	private double dist;

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public List<String> getUnusedIds() {
		return unusedIds;
	}

	public void setUnusedIds(List<String> unusedIds) {
		this.unusedIds = unusedIds;
	}

	public List<Teacher> getSensors() {
		return Sensors;
	}

	public void setSensors(List<Teacher> Sensors) {
		this.Sensors = Sensors;
	}

	public SensorService getSensorService() {
		return SensorService;
	}

	public void setSensorService(SensorService SensorService) {
		this.SensorService = SensorService;
	}

	public Teacher getSensor() {
		return Sensor;
	}

	public void setSensor(Teacher Sensor) {
		this.Sensor = Sensor;
	}

	public String getBuilding_id() {
		return building_id;
	}

	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}

	/*
	 * END OF GETTER & SETTER
	 */
	
	public String add(){
		SensorService.add(Sensor);
		System.out.println("show_map");
		return "show_map";
	}
	
	public String find(){
		Sensor = SensorService.find(building_id);
		return SUCCESS;
	}
	
	public String list(){
		Sensors = SensorService.list();
		return SUCCESS;
	}
	
	public String update(){
		SensorService.update(Sensor);
		return SUCCESS;
	}
	
	public String delete(){
		System.out.println("DELETE: "+building_id);
		SensorService.deleteById(building_id);
		return "Sensor_list";
	}
	
	
	public List<Object> getPoints() {
		return points;
	}

	public void setPoints(List<Object> points) {
		this.points = points;
	}

	public String listPoints(){
		points = SensorService.listPoints(teacherType, centerX, centerY, dist);
		return SUCCESS;
		//return "return_json";
	}
	public double getCenterX() {
		return centerX;
	}

	public void setCenterX(double centerX) {
		this.centerX = centerX;
	}

	public double getCenterY() {
		return centerY;
	}

	public void setCenterY(double centerY) {
		this.centerY = centerY;
	}

	public String addInput(){
		System.out.println("addInput");
		//SensorService.add(Sensor);
		return "show_map";
	}
	
	public String listUnusedIds(){
		unusedIds = SensorService.listUnusedIds();
		System.out.println(unusedIds);
		return SUCCESS;
	}
}
