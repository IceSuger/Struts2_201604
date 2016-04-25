package heatsupply.action;

import heatsupply.model.Equipment;
import heatsupply.service.EquipmentService;

import java.util.List;




import com.opensymphony.xwork2.ActionSupport;

public class EquipmentAction extends ActionSupport {
	private List<Equipment> equipments;
	private EquipmentService equipmentService = new EquipmentService();
	private Equipment equipment;
	private int id;
	
	

	public List<Equipment> getEquipments() {
		return equipments;
	}

	public void setEquipments(List<Equipment> equipments) {
		this.equipments = equipments;
	}

	public EquipmentService getEquipmentService() {
		return equipmentService;
	}

	public void setEquipmentService(EquipmentService equipmentService) {
		this.equipmentService = equipmentService;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String add(){
		equipmentService.add(equipment);
		System.out.println("show_map");
		return "show_map";
	}
	
	public String list(){
		equipments = equipmentService.list();
		return SUCCESS;
	}
	
	public String update(){
		equipmentService.update(equipment);
		return SUCCESS;
	}
	
	public String delete(){
		equipmentService.deleteById(id);
		return SUCCESS;
	}
	
	public String addInput(){
		System.out.println("addInput");
		//equipmentService.add(equipment);
		return "show_map";
	}
}
