package heatsupply.service;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import heatsupply.model.Record;
import heatsupply.util.DB;

public class RecordService {
	public void add(Record r){
		Connection conn = DB.createConn();
		String sql = "insert into _records values (null, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, r.getSensor_id());
			ps.setFloat(3, r.getTemperature());
			ps.setTimestamp(2, (new Timestamp(r.getTime().getTime())));
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		
		//接下来判断温度是否超过限制，超过则向_alarm表写一条数据
		sql = "select * from _sensors where building_id = ? limit 1";//或者 top 1 *？
		ps = DB.prepare(conn, sql);
		//Sensor eq = null;
		float high = 0, low = 0;
		try {
			ps.setString(1, r.getSensor_id());
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				high = rs.getFloat("high_limit");
				low = rs.getFloat("low_limit");
//				System.out.println("高温低温限制！！");
//				System.out.println(high);
//				System.out.println(low);
//				System.out.println(r.getTemperature());
				//----
				if(r.getTemperature() > high)
				{
					//System.out.println("高温要报警 雷欧");
					sql = "select * from _alarms where sensor_id=? and reason=1 and bug_cleared=0";
					PreparedStatement ps0 = DB.prepare(conn, sql);
					try {
						ps0.setString(1, r.getSensor_id());
						ResultSet rs1 =  ps0.executeQuery();
						if(!rs1.next()){
							//System.out.println("表中无该高温故障记录，添加！");
							//高温报警
							sql = "insert into _alarms values (null, ?, ?, ?, ?, ?)";
							PreparedStatement ps1 = DB.prepare(conn, sql);
							try {
								ps1.setString(1, r.getSensor_id());
								ps1.setInt(2, 1);//1表示高温报警
								ps1.setTimestamp(3, (new Timestamp(new Date().getTime())));
								ps1.setInt(4, 0);//0表示否 false
								ps1.setFloat(5, r.getTemperature());
								ps1.executeUpdate();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							DB.close(ps0);
							DB.close(ps1);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				else if(r.getTemperature() < low)
				{
					sql = "select * from _alarms where sensor_id=? and reason=2 and bug_cleared=0";
					PreparedStatement ps0 = DB.prepare(conn, sql);
					try {
						ps0.setString(1, r.getSensor_id());
						ResultSet rs1 =  ps0.executeQuery();
						if(!rs1.next()){
							//低温报警
							sql = "insert into _alarms values (null, ?, ?, ?, ?, ?)";
							PreparedStatement ps1 = DB.prepare(conn, sql);
							try {
								ps1.setString(1, r.getSensor_id());
								ps1.setInt(2, 2);//2表示低温报警
								ps1.setTimestamp(3, (new Timestamp(new Date().getTime())));
								ps1.setInt(4, 0);//0表示否 false
								ps1.setFloat(5, r.getTemperature());
								ps1.executeUpdate();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							DB.close(ps0);
							DB.close(ps1);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DB.close(ps);
				}
				else
				{
					//不报警
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DB.close(ps);
		DB.close(conn);
	}
	
	public void add1(Record r){
		//System.out.println(r.getId());
		System.out.println(r.getSensor_id());
		System.out.println(r.getTemperature());
		System.out.println(r.getTime());
	}
	
	public List<Record> list(){
		Connection conn = DB.createConn();
		String sql = "select * from _records";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Record> Records = new ArrayList<Record>();
		try {
			ResultSet rs =  ps.executeQuery();
			Record r = null;
			while(rs.next()){
				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("Record_id"));
				r = new Record();
				r.setSensor_id(rs.getString("sensor_id"));
				r.setTemperature(rs.getFloat("temperature"));
				r.setTime(rs.getTime("time"));
				Records.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Records;
	}
//	
//	public List<RecordMaxMinInHour> listMaxAndMin(String sensor_id, String date){
//		Connection conn = DB.createConn();
//		//String sql = "select * from _records where sensor_id=? and time like '"+date+"%'";
//		String sql = "select id, min(temperature) as min,max(temperature) as max, sensor_id, time, HOUR(time) as hour from _records where sensor_id=? and time like '"+date+"%' GROUP BY HOUR(time)";
//		PreparedStatement ps = DB.prepare(conn, sql);
//		List<RecordMaxMinInHour> Records = new ArrayList<RecordMaxMinInHour>();
//		try {
//			ps.setString(1, sensor_id);
//			ResultSet rs =  ps.executeQuery();
//			RecordMaxMinInHour r = null;
//			while(rs.next()){
//				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("Record_id"));
//				r = new RecordMaxMinInHour();
//				r.setId(rs.getInt("id"));
//				r.setSensor_id(rs.getString("sensor_id"));
//				r.setMax(rs.getFloat("max"));
//				r.setMin(rs.getFloat("min"));
//				r.setTime(rs.getTime("time"));
//				r.setHour(rs.getInt("hour"));
//				Records.add(r);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		DB.close(ps);
//		DB.close(conn);
//		return Records;
//	}
	
	public List<Record> find(String sensor_id){
		Connection conn = DB.createConn();
		String sql = "select * from _records where sensor_id= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Record> Records = new ArrayList<Record>();
		try {
			ps.setString(1, sensor_id);
			ResultSet rs =  ps.executeQuery();
			Record r = null;
			while(rs.next()){
				r = new Record();
				//r.setId(rs.getString("id"));
				r.setSensor_id(sensor_id);//(rs.getString("building_id"));
				r.setTemperature(rs.getFloat("temperature"));
				r.setTime(rs.getTime("time"));
				Records.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Records;
	}

	public Record latest(String sensor_id) {
		Connection conn = DB.createConn();
		String sql = "select * from _records where sensor_id= ? order by id desc limit 1";
		//String sql = "select top 1 * from _records where sensor_id= ? order by id desc";
		PreparedStatement ps = DB.prepare(conn, sql);
		Record r = new Record();
		try {
			//System.out.println(sensor_id);
			ps.setString(1, sensor_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				//r = new Record();
				r.setId(rs.getInt("id"));
				r.setSensor_id(sensor_id);//(rs.getString("building_id"));
				r.setTemperature(rs.getFloat("temperature"));
				r.setTime(rs.getTime("time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return r;
	}
	
	/*public void delete(Record r){
		deleteById(r.getId());
	}*/
	
	/*public void deleteById(int id){
		Connection conn = DB.createConn();
		String sql = "delete from _Records where id = ?";
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
	}*/

}
