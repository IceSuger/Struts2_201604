package heatsupply.action;

import heatsupply.model.Sensor;
import heatsupply.service.SensorService;

import java.util.List;






import com.opensymphony.xwork2.ActionSupport;

public class SensorAction extends ActionSupport {
	private List<Sensor> Sensors;
	private SensorService SensorService = new SensorService();
	private Sensor Sensor;
	
	private List<Object> points;
	private List<String> unusedIds;
	private String building_id;
	private int level;
	

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

	public List<Sensor> getSensors() {
		return Sensors;
	}

	public void setSensors(List<Sensor> Sensors) {
		this.Sensors = Sensors;
	}

	public SensorService getSensorService() {
		return SensorService;
	}

	public void setSensorService(SensorService SensorService) {
		this.SensorService = SensorService;
	}

	public Sensor getSensor() {
		return Sensor;
	}

	public void setSensor(Sensor Sensor) {
		this.Sensor = Sensor;
	}

	public String getBuilding_id() {
		return building_id;
	}

	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}

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
		points = SensorService.listPoints(level);
		return SUCCESS;
		//return "return_json";
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
