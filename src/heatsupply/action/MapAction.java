package heatsupply.action;

import java.util.List;

import heatsupply.model.Teacher;
import heatsupply.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;

public class MapAction extends ActionSupport {
	private List<Teacher> sensors;
	private TeacherService sensorService = new TeacherService();
	private Teacher sensor;
	private int id;
	
	public List<Teacher> getSensors() {
		return sensors;
	}

	public void setSensors(List<Teacher> sensors) {
		this.sensors = sensors;
	}

	public TeacherService getSensorService() {
		return sensorService;
	}

	public void setSensorService(TeacherService sensorService) {
		this.sensorService = sensorService;
	}

	public Teacher getSensor() {
		return sensor;
	}

	public void setSensor(Teacher sensor) {
		this.sensor = sensor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

//	public String add(){
//		System.out.println("id=" + sensor.getId());
//		System.out.println("Sensor_id=" + sensor.getSensor_id());
//		//System.out.println("Sensor_id=" + sensor.Sensor_id);
//		sensorService.add(sensor);
//		return SUCCESS;
//	}
//	
//	public String list(){
//		sensors = sensorService.list();
//		return SUCCESS;
//	}
//	
//	public String update(){
//		sensorService.update(sensor);
//		return SUCCESS;
//	}
//	
//	public String delete(){
//		sensorService.deleteById(id);
//		return SUCCESS;
//	}
//	

	public String show(){
		return SUCCESS;
	}
}
