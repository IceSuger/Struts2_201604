package heatsupply.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.HashSet;

import org.apache.struts2.components.Set;

import com.google.gson.Gson;

import heatsupply.model.Sensor;
import heatsupply.model.Record;
import heatsupply.util.DB;

public class SensorService {
	private RecordService recordService = new RecordService();
	
	public void add(Sensor eq){
		Connection conn = DB.createConn();
		String sql = "insert into _sensors values ( ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, eq.getBuilding_id());
			//ps.setString(2, "GeomFromText('POINT(" + eq.getLatitude() + " " + eq.getLongitude() + ")')" );//程序中经纬度都先用String类型
			ps.setString(2, eq.getLongitude());
			ps.setString(3, eq.getLatitude());
			ps.setFloat(4, eq.getHigh_limit());
			ps.setFloat(5, eq.getLow_limit());
			ps.setTimestamp(6, (new Timestamp(eq.getDate().getTime())));
			ps.setString(7, eq.getPosition_detail());
			ps.setInt(8, eq.getLevel());
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
		List<Sensor> Sensors = new ArrayList<Sensor>();
		try {
			ResultSet rs =  ps.executeQuery();
			Sensor eq = null;
			while(rs.next()){
				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("Sensor_id"));
				eq = new Sensor();
				//eq.setId(rs.getInt("id"));
				eq.setBuilding_id(rs.getString("building_id"));
				eq.setLatitude(rs.getString("latitude"));
				eq.setLongitude(rs.getString("longitude"));
				eq.setHigh_limit(rs.getFloat("high_limit"));
				eq.setLow_limit(rs.getFloat("low_limit"));
				eq.setDate(rs.getDate("date"));
				eq.setPosition_detail(rs.getString("position_detail"));
				eq.setLevel(rs.getInt("level"));
				Sensors.add(eq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Sensors;
	}
	
	public Sensor find(String building_id){
		Connection conn = DB.createConn();
		String sql = "select * from _sensors where building_id= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		Sensor eq = new Sensor();
		try {
			ps.setString(1, building_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				//eq.setId(rs.getInt("id"));
				eq.setBuilding_id(rs.getString("building_id"));
				eq.setLatitude(rs.getString("latitude"));
				eq.setLongitude(rs.getString("longitude"));
				eq.setHigh_limit(rs.getFloat("high_limit"));
				eq.setLow_limit(rs.getFloat("low_limit"));
				eq.setDate(rs.getDate("date"));
				eq.setPosition_detail(rs.getString("position_detail"));
				eq.setLevel(rs.getInt("level"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return eq;
	}
	
	public void delete(Sensor eq){
		deleteById(eq.getBuilding_id());
	}
	
	public void deleteById(String building_id){
		Connection conn = DB.createConn();
		String sql = "delete from _sensors where building_id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, building_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public void update(Sensor s){
		/*Connection conn = DB.createConn();
		String sql = "update _Sensors set Sensor_id = ? where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, s.getSensor_id());
			ps.setInt(2, s.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);*/
	}
	
	public List<Object> listPoints(int level){
		Connection conn = DB.createConn();
		String sql = "select * from _sensors where level=?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Sensor> Sensors = new ArrayList<Sensor>();
		List<Object> points = new ArrayList<Object>();
		Gson gson = new Gson();
		
		try {
			ps.setInt(1, level);
			ResultSet rs =  ps.executeQuery();
			Sensor eq = null;
			while(rs.next()){
				Map<String,String> map = new HashMap<String,String>();
				//map.put("id", String.valueOf(rs.getInt("id")));
				map.put("building_id", rs.getString("building_id"));
				map.put("lng", rs.getString("longitude"));
				map.put("lat", rs.getString("latitude"));
				//map.put("count", String.valueOf((Math.random()*40+60)));
				Record r = recordService.latest(rs.getString("building_id"));
				map.put("count", String.valueOf(r.getTemperature()*2.5));
				
				points.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		//System.out.println(gson.toJson(points).toString());
		//return gson.toJson(points).toString();
		return points;
	}
	
	public List<String> listUnusedIds(){
		
		//遍历所有Sensor，拿到building id，加入set1
		Connection conn = DB.createConn();
		String sql = "select * from _sensors";
		PreparedStatement ps = DB.prepare(conn, sql);
		HashSet<String> set1 =new HashSet<String>();
		
		try {
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				set1.add(rs.getString("building_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		
		//遍历当天的全部record，拿到sensor_id，判断在不在set1中，不在的，放入set2
		//sql = "select * from _records where time < ";//想只访问今天的record，但sql语句暂时不会
		sql = "select * from _records";
		ps = DB.prepare(conn, sql);
		HashSet<String> set2 =new HashSet<String>();
		String temp=null;
		
		try {
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				temp = rs.getString("sensor_id");
				if( !set1.contains(temp) )
				{
					set2.add(temp);
				};
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		//把set2转成list，返回
		List<String> unusedIds = new ArrayList<String>(set2); 
		
		return unusedIds;
	}
}
