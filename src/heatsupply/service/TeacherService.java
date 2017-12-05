package heatsupply.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.HashSet;

import org.apache.struts2.components.Set;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import heatsupply.model.Article;
import heatsupply.model.Comment;
import heatsupply.model.Course;
import heatsupply.model.Experience;
import heatsupply.model.Success;
import heatsupply.model.Tags;
import heatsupply.model.Teacher;
import heatsupply.model.Record;
import heatsupply.util.DB;

public class TeacherService {
	private RecordService recordService = new RecordService();
	
	public void add(Teacher eq){
		Connection conn = DB.createConn();
		String sql = "insert into _teachers_bj values ( ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, eq.getBuilding_id());
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
	
	public List<Teacher> list(){
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Teacher> Sensors = new ArrayList<Teacher>();
		try {
			ResultSet rs =  ps.executeQuery();
			Teacher eq = null;
			while(rs.next()){
				//System.out.println(rs.getInt("id")+"\t"+rs.getInt("Sensor_id"));
				eq = new Teacher();
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
	
//	public Teacher find(String uniqueId){
//		Connection conn = DB.createConn();
//		String sql = "select * from _teachers_bj where uniqueId= ?";
//		PreparedStatement ps = DB.prepare(conn, sql);
//		Teacher eq = new Teacher();
//		try {
//			ps.setString(1, uniqueId);
//			ResultSet rs =  ps.executeQuery();
//			while(rs.next()){
//				//eq.setId(rs.getInt("id"));
//				eq.setBuilding_id(rs.getString("building_id"));
//				eq.setLatitude(rs.getString("latitude"));
//				eq.setLongitude(rs.getString("longitude"));
//				eq.setHigh_limit(rs.getFloat("high_limit"));
//				eq.setLow_limit(rs.getFloat("low_limit"));
//				eq.setDate(rs.getDate("date"));
//				eq.setPosition_detail(rs.getString("position_detail"));
//				eq.setLevel(rs.getInt("level"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		DB.close(ps);
//		DB.close(conn);
//		return eq;
//	}
	
	public Teacher findBrief(String uniqueId){
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj where uniqueId= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		Teacher tc = new Teacher();
		try {
			ps.setString(1, uniqueId);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				//eq.setId(rs.getInt("id"));
				tc.setName(rs.getString("name"));
				tc.setScore(rs.getString("score"));
				tc.setUniqueId(rs.getString("uniqueId"));
				tc.setAvatarUrl(rs.getString("avatarUrl"));
//				String tmp = rs.getString("avatarUrl");
//				tc.setAvatarUrl(tmp.substring(2, tmp.length()-2));
				tc.setIntro(rs.getString("intro"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return tc;
	}
	
	public Teacher findDetail(String uniqueId){
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj where uniqueId= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		Teacher tc = new Teacher();
		try {
			ps.setString(1, uniqueId);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				//eq.setId(rs.getInt("id"));
				tc.setName(rs.getString("name"));
				tc.setScore(rs.getString("score"));
//				//总分转为百分数，便于在页面上画图
//				NumberFormat nt = NumberFormat.getPercentInstance();
//				String score_precent = nt.format(Double.valueOf(tc.getScore())/5.0);
//				tc.setScore_percent(score_precent);
				tc.setUniqueId(rs.getString("uniqueId"));
				tc.setAvatarUrl(rs.getString("avatarUrl"));
				tc.setIntro(rs.getString("intro"));
				tc.setBaseInfo(rs.getString("baseInfo"));
				tc.setCity(rs.getString("city"));
				//转换成experience类的list
				////String expstr = rs.getString("experience");
				////List<Experience> experience = gson.fromJson(expstr, Experience.class);
				String expstr = rs.getString("experience");
				List<Experience> experience = new ArrayList<Experience>();
				JsonArray jsonArray = parser.parse(expstr).getAsJsonArray();
				System.out.println(jsonArray);
				for(JsonElement elem : jsonArray)
				{
					
					experience.add(gson.fromJson(elem, Experience.class));
				}
				tc.setExperience(experience);
				
				tc.setStudentCount(rs.getString("studentCount"));
				//转换成success类的list
				String sucstr = rs.getString("success");
//				Success success = gson.fromJson(sucstr, Success.class);
//				tc.setSuccess(success);
				List<Success> success = new ArrayList<Success>();
				jsonArray = parser.parse(sucstr).getAsJsonArray();
				for(JsonElement elem : jsonArray)
				{
					System.out.println(elem);
					success.add(gson.fromJson(elem, Success.class));
				}
				tc.setSuccess(success);
				
				tc.setSummary(rs.getString("summary"));
				//转换成String的list
				String tagstr = rs.getString("tags");
//				Tags tags = gson.fromJson(tagstr, Tags.class);
//				tc.setTags(tags);
				List<String> tags = new ArrayList<String>();
				jsonArray = parser.parse(tagstr).getAsJsonArray();
				for(JsonElement elem : jsonArray)
				{
					tags.add(gson.fromJson(elem, String.class));
				}
				tc.setTags(tags);
				
				tc.setTeacherType(rs.getString("teacherType"));
				tc.setTeachTimeCount(rs.getString("teachTimeCount"));
				tc.setX(rs.getDouble("x"));
				tc.setY(rs.getDouble("y"));
				//再根据uniqueId查_courses表和_articles表分别得到对应项，作为list存过来
				tc.setArticles(findArticlesByUniqueid(uniqueId));
				List<Course> courses = findCoursesByUniqueid(uniqueId);
				tc.setCourses(courses);
				//有了课程列表，根据每个课程的id去获取跟该老师有关的评论
				List<Comment> comments = new ArrayList<Comment>();
				for(Course c : courses)
				{
					String courseId = c.getCourseId();
					System.out.println(courseId);
					comments.addAll(findCommentsByCourseid(courseId));
				}
				tc.setComments(comments);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return tc;
	}
	
	private Collection<? extends Comment> findCommentsByCourseid(String courseId) {
		Connection conn = DB.createConn();
		String sql = "select * from _comments_bj where comment_course_number= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Comment> comments = new ArrayList<Comment>();
		try {
			ps.setString(1, courseId);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				Comment c = new Comment();
				c.setContent(rs.getString("content"));
				c.setCreate_time(rs.getString("create_time"));
				//System.out.println(c.getCreate_time());
				c.setScore(rs.getString("score"));
				comments.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return comments;
	}

	private List<Course> findCoursesByUniqueid(String uniqueId) {
		Connection conn = DB.createConn();
		String sql = "select * from _courses_bj where teacherUniqueId= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Course> courses = new ArrayList<Course>();
		try {
			ps.setString(1, uniqueId);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				Course c = new Course();
				c.setCourseId(rs.getString("number"));
				c.setDetail_url(rs.getString("detail_url"));
				c.setIntroduce(rs.getString("introduce"));
				c.setName(rs.getString("name"));
				c.setPortrait(rs.getString("portrait"));
				c.setTeacherUniqueId(rs.getString("teacherUniqueId"));
				courses.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return courses;
	}

	private List<Article> findArticlesByUniqueid(String uniqueId) {
		Connection conn = DB.createConn();
		String sql = "select * from _articles_bj where autherId= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Article> articles = new ArrayList<Article>();
		try {
			ps.setString(1, uniqueId);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()){
				Article a = new Article();
				a.setArticleId(rs.getString("articleId"));
				a.setAuther(rs.getString("auther"));
				a.setAutherId(rs.getString("autherId"));
				a.setContent(rs.getString("content"));
				a.setPublishTime(rs.getString("publishTime"));
				a.setTitle(rs.getString("title"));
				articles.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return articles;
	}

	public void delete(Teacher eq){
		deleteById(eq.getBuilding_id());
	}
	
	public void deleteById(String building_id){
		Connection conn = DB.createConn();
		String sql = "delete from _teachers_bj where building_id = ?";
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
	
	public void update(Teacher s){
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
	
	/*public List<Object> listPoints(int level){
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj where level=?";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Teacher> Sensors = new ArrayList<Teacher>();
		List<Object> points = new ArrayList<Object>();
		Gson gson = new Gson();
		
		try {
			ps.setInt(1, level);
			ResultSet rs =  ps.executeQuery();
			Teacher eq = null;
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
	}*/
	
	/**
	 * 输入老师类别、当前查询的位置中心、区域范围大小（距中心的公里数），返回一定区域内的老师们对应的地图point。
	 * @return List<Map<String,Object>>
	 */
	public List<Object> listPoints(String teacherType, double centerX, double centerY, double dist)
	{
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj WHERE\n" +
						"sqrt(\n" +
						"		(\n" +
						"			(\n" +
						"				(" + centerX + " - x) * PI() * 12656 * cos(((" + centerY + " + y) / 2) * PI() / 180) / 180\n" +
						"			) * (\n" +
						"				(" + centerX + " - x) * PI() * 12656 * cos(((" + centerY + " + y) / 2) * PI() / 180) / 180\n" +
						"			)\n" +
						"		) + (\n" +
						"			(\n" +
						"				(" + centerY + " - y) * PI() * 12656 / 180\n" +
						"			) * (\n" +
						"				(" + centerY + " - y) * PI() * 12656 / 180\n" +
						"			)\n" +
						"		)\n" +
						"	) < " + dist + " AND\n" +
						"_teachers_bj.teacherType LIKE '%" + teacherType + "%'";
		System.out.println(sql);
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Teacher> teachers = new ArrayList<Teacher>();
		List<Object> points = new ArrayList<Object>();
		
		try {
			ResultSet rs =  ps.executeQuery();
			Teacher tc = null;
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				//map.put("id", String.valueOf(rs.getInt("id")));
				map.put("uniqueId", rs.getString("uniqueId"));
				map.put("x", rs.getDouble("x"));
				map.put("y", rs.getDouble("y"));
				map.put("name", rs.getString("name"));
				map.put("score", rs.getString("score"));
				
				points.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return points;
	}
	
	public List<String> listUnusedIds(){
		
		//遍历所有Sensor，拿到building id，加入set1
		Connection conn = DB.createConn();
		String sql = "select * from _teachers_bj";
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
