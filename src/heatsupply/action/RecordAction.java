package heatsupply.action;

import heatsupply.model.Record;
import heatsupply.model.RecordMaxMinInHour;
import heatsupply.service.RecordService;

import java.util.Date;
import java.util.List;











import com.opensymphony.xwork2.ActionSupport;

public class RecordAction extends ActionSupport {
	private int id;
	private Record record;
	private List<Record> records;
	private RecordService recordService = new RecordService();
	private String sensor_id;
	private String date;
	private List<RecordMaxMinInHour> recordsMaxMin;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public List<Record> getRecords() {
		return records;
	}

	public void setRecords(List<Record> records) {
		this.records = records;
	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public String add(){
		recordService.add(record);
		//System.out.println("A record added.");
		return "record_added";
	}
	
	/*public String find(){
		record = recordService.find(sensor_id);
		return SUCCESS;
	}*/
	
	public String latest(){
		record = recordService.latest(sensor_id);
		return SUCCESS;
	}
	
	public String listMaxAndMin(){
		recordsMaxMin = recordService.listMaxAndMin(sensor_id, date);
		return SUCCESS;
	}
	
	public String history(){
		recordsMaxMin = recordService.listMaxAndMin(sensor_id, date);
		return SUCCESS;
	}
	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<RecordMaxMinInHour> getRecordsMaxMin() {
		return recordsMaxMin;
	}

	public void setRecordsMaxMin(List<RecordMaxMinInHour> recordsMaxMin) {
		this.recordsMaxMin = recordsMaxMin;
	}

	public String getSensor_id() {
		return sensor_id;
	}

	public void setSensor_id(String sensor_id) {
		this.sensor_id = sensor_id;
	}

	public String list(){
		records = recordService.list();
		return SUCCESS;
	}
	
	
	/*public String delete(){
		System.out.println("DELETE: "+id);
		recordService.deleteById(id);
		return "record_list";
	}*/
	
	public String addInput(){
		System.out.println("addInput");
		//recordService.add(record);
		return "show_map";
	}
}
