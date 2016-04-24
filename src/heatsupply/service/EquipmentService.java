package heatsupply.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import heatsupply.model.Equipment;
import heatsupply.util.DB;

public class EquipmentService {
	public void add(Equipment eq){
		Connection conn = DB.createConn();
		String sql = "insert into _equipments values (null, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, eq.getBuilding_id());
			//ps.setString(2, "GeomFromText('POINT(" + eq.getLatitude() + " " + eq.getLongitude() + ")')" );//程序中经纬度都先用String类型
			ps.setString(2, eq.getLatitude());
			ps.setString(3, eq.getLongitude());
			ps.setFloat(4, eq.getHigh_limit());
			ps.setFloat(5, eq.getLow_limit());
			ps.setDate(6, (Date) eq.getDate());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public List<Equipment> list(){
		Connection conn = DB.createConn();
		String sql = "select * from _equipments";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Equipment> equipments = new ArrayList<Equipment>();
		try {
			ResultSet rs =  ps.executeQuery();
			Equipment eq = null;
			while(rs.next()){
				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("equipment_id"));
				eq = new Equipment();
				eq.setId(rs.getInt("id"));
				eq.setBuilding_id(rs.getInt("building_id"));
				eq.setLatitude(rs.getString("latitude"));
				eq.setLongitude(rs.getString("longitude"));
				eq.setHigh_limit(rs.getFloat("high_limit"));
				eq.setLow_limit(rs.getFloat("low_limit"));
				eq.setDate(rs.getDate("date"));
				equipments.add(eq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return equipments;
	}
	
	public void delete(Equipment eq){
		deleteById(eq.getId());
	}
	
	public void deleteById(int id){
		Connection conn = DB.createConn();
		String sql = "delete from _equipments where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public void update(Equipment s){
		/*Connection conn = DB.createConn();
		String sql = "update _equipments set equipment_id = ? where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, s.getEquipment_id());
			ps.setInt(2, s.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);*/
	}
}
