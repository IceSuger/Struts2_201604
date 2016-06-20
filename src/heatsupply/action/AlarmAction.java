package heatsupply.action;

import heatsupply.model.Alarm;
import heatsupply.service.AlarmService;

import java.util.List;









import com.opensymphony.xwork2.ActionSupport;

public class AlarmAction extends ActionSupport {
	private int id;
	private Alarm alarm;
	private List<Alarm> alarms;
	private AlarmService AlarmService = new AlarmService();
	private String sensor_id;
	private int reason;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Alarm getAlarm() {
		return alarm;
	}

	public void setAlarm(Alarm alarm) {
		this.alarm = alarm;
	}

	public List<Alarm> getAlarms() {
		return alarms;
	}

	public void setAlarms(List<Alarm> alarms) {
		this.alarms = alarms;
	}

	public AlarmService getAlarmService() {
		return AlarmService;
	}

	public void setAlarmService(AlarmService AlarmService) {
		this.AlarmService = AlarmService;
	}

	public String add(){
		AlarmService.add(alarm);
		System.out.println("An alarm added.");
		return "alarm_added";
	}
	
	/*public String find(){
		alarm = AlarmService.find(sensor_id);
		return SUCCESS;
	}*/
	
	public String latest(){
		alarm = AlarmService.latest(sensor_id);
		return SUCCESS;
	}
	
	public String getSensor_id() {
		return sensor_id;
	}

	public void setSensor_id(String sensor_id) {
		this.sensor_id = sensor_id;
	}

	public int getReason() {
		return reason;
	}

	public void setReason(int reason) {
		this.reason = reason;
	}

	public String fetch(){
		alarms = AlarmService.fetch();
		return SUCCESS;
	}
	
	public String list(){
		alarms = AlarmService.list();
		return SUCCESS;
	}
	
	public String bug_clear(){
		AlarmService.bug_clear(id);
		return "alarm_list";
	}
	/*public String delete(){
		System.out.println("DELETE: "+id);
		AlarmService.deleteById(id);
		return "Alarm_list";
	}*/
	
	public String addInput(){
		System.out.println("addInput");
		//AlarmService.add(alarm);
		return "show_map";
	}
}
