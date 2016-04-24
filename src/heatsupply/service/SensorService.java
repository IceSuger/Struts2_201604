package heatsupply.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import heatsupply.model.Sensor;
import heatsupply.util.DB;

public class SensorService {
	public void add(Sensor s){
		Connection conn = DB.createConn();
		String sql = "insert into _sensors values (null, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			//ps.setString(1, s.getId());
			ps.setInt(1, s.getEquipment_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public List<Sensor> list(){
		Connection conn = DB.createConn();
		String sql = "select * from _sensors";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Sensor> sensors = new ArrayList<Sensor>();
		try {
			ResultSet rs =  ps.executeQuery();
			Sensor s = null;
			while(rs.next()){
				System.out.println(rs.getInt("id")+"\t"+rs.getInt("equipment_id"));
				s = new Sensor();
				s.setId(rs.getInt("id"));
				s.setEquipment_id(rs.getInt("equipment_id"));
				sensors.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return sensors;
	}
	
	public void delete(Sensor s){
		deleteById(s.getId());
	}
	
	public void deleteById(int id){
		Connection conn = DB.createConn();
		String sql = "delete from _sensors where id = ?";
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
	
	public void update(Sensor s){
		Connection conn = DB.createConn();
		String sql = "update _sensors set equipment_id = ? where id = ?";
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
		DB.close(conn);
	}
}
