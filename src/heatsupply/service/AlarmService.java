package heatsupply.service;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import heatsupply.model.Alarm;
import heatsupply.util.DB;

public class AlarmService {
	public void add(Alarm alarm){
		Connection conn = DB.createConn();
		String sql = "insert into _alarms values (null, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, alarm.getSensor_id());
			ps.setFloat(3, alarm.getT());
			ps.setTimestamp(2, (new Timestamp(alarm.getTime().getTime())));
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		
		//接下来判断温度是否超过限制，超过则向_alarm表写一条数据
		sql = "select top 1 * from _Sensors where building_id = ?";
		ps = DB.prepare(conn, sql);
		//Sensor eq = null;
		float high = 0, low = 0;
		try {
			ps.setString(1, alarm.getSensor_id());
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				high = rs.getFloat("high_limit");
				low = rs.getFloat("low_limit");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DB.close(ps);
		
		if(alarm.getT() > high)
		{
			sql = "select * from _alarms where sensor_id=? and reason=1 and bug_cleared=0";
			ps = DB.prepare(conn, sql);
			try {
				ResultSet rs =  ps.executeQuery();
				if(!rs.next()){
					
					//高温报警
					sql = "insert into _alarms values (null, ?, ?, ?, ?, ?)";
					PreparedStatement ps1 = DB.prepare(conn, sql);
					try {
						ps.setString(1, alarm.getSensor_id());
						ps.setInt(2, 1);//1表示高温报警
						ps.setTimestamp(3, (new Timestamp(new Date().getTime())));
						ps.setInt(4, 0);//0表示否 false
						ps.setFloat(5, alarm.getT());
						ps.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DB.close(ps);
					DB.close(ps1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(alarm.getT() < low)
		{
			sql = "select * from _alarms where sensor_id=? and reason=2 and bug_cleared=0";
			ps = DB.prepare(conn, sql);
			try {
				ResultSet rs =  ps.executeQuery();
				if(!rs.next()){
					//低温报警
					sql = "insert into _alarms values (null, ?, ?, ?, ?, ?)";
					PreparedStatement ps1 = DB.prepare(conn, sql);
					try {
						ps.setString(1, alarm.getSensor_id());
						ps.setInt(2, 2);//2表示低温报警
						ps.setTimestamp(3, (new Timestamp(new Date().getTime())));
						ps.setInt(4, 0);//0表示否 false
						ps.setFloat(5, alarm.getT());
						ps.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DB.close(ps);
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
		DB.close(conn);
	}
	
	public List<Alarm> list(){
		Connection conn = DB.createConn();
		String sql = "select * from _alarms";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Alarm> Alarms = new ArrayList<Alarm>();
		try {
			ResultSet rs =  ps.executeQuery();
			Alarm alarm = null;
			while(rs.next()){
				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("Alarm_id"));
				alarm = new Alarm();
				alarm.setId(rs.getInt("id"));
				alarm.setBug_cleared(rs.getInt("bug_cleared"));
				alarm.setReason(rs.getInt("reason"));
				alarm.setSensor_id(rs.getString("sensor_id"));
				alarm.setT(rs.getFloat("t"));
				alarm.setTime(rs.getTime("time"));
				Alarms.add(alarm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Alarms;
	}
	
	public List<Alarm> find(String sensor_id){
		Connection conn = DB.createConn();
		String sql = "select * from _alarms where sensor_id= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Alarm> Alarms = new ArrayList<Alarm>();
		try {
			ps.setString(1, sensor_id);
			ResultSet rs =  ps.executeQuery();
			Alarm alarm = null;
			while(rs.next()){
				alarm = new Alarm();
				//alarm.setId(rs.getString("id"));
				alarm.setSensor_id(sensor_id);//(rs.getString("building_id"));
				alarm.setT(rs.getFloat("t"));
				alarm.setTime(rs.getTime("time"));
				Alarms.add(alarm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Alarms;
	}

	public Alarm latest(String sensor_id) {
		Connection conn = DB.createConn();
		String sql = "select top 1 * from _alarms where sensor_id=? order by id DESC";
		PreparedStatement ps = DB.prepare(conn, sql);
		Alarm alarm = new Alarm();
		try {
			ps.setString(1, sensor_id);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				//alarm = new Alarm();
				alarm.setId(rs.getInt("id"));
				alarm.setSensor_id(sensor_id);//(rs.getString("building_id"));
				alarm.setT(rs.getFloat("t"));
				alarm.setTime(rs.getTime("time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return alarm;
	}
	

	public List<Alarm> fetch() {
		Connection conn = DB.createConn();
		String sql = "select * from _alarms where bug_cleared=0";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Alarm> Alarms = new ArrayList<Alarm>();
		try {
			//ps.setString(1, sensor_id);
			//ps.setInt(2, reason);
			ResultSet rs =  ps.executeQuery();
			Alarm alarm = null;
			while(rs.next()){
				alarm = new Alarm();
				//alarm.setId(rs.getString("id"));
				alarm.setBug_cleared(0);
				alarm.setId(rs.getInt("id"));
				alarm.setSensor_id(rs.getString("sensor_id"));//(rs.getString("building_id"));
				alarm.setT(rs.getFloat("t"));
				alarm.setTime(rs.getTime("time"));
				alarm.setReason(rs.getInt("reason"));
				Alarms.add(alarm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return Alarms;
	}

	public void bug_clear(int id) {
		Connection conn = DB.createConn();
		String sql = "update _alarms set bug_cleared = 1 where id = ?";
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
	


}
