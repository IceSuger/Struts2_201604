package heatsupply.action;

import java.util.List;

import heatsupply.model.Sensor;
import heatsupply.service.SensorService;

import com.opensymphony.xwork2.ActionSupport;

public class MapAction extends ActionSupport {
	private List<Sensor> sensors;
	private SensorService sensorService = new SensorService();
	private Sensor sensor;
	private int id;
	
	public List<Sensor> getSensors() {
		return sensors;
	}

	public void setSensors(List<Sensor> sensors) {
		this.sensors = sensors;
	}

	public SensorService getSensorService() {
		return sensorService;
	}

	public void setSensorService(SensorService sensorService) {
		this.sensorService = sensorService;
	}

	public Sensor getSensor() {
		return sensor;
	}

	public void setSensor(Sensor sensor) {
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
