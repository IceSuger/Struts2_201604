package heatsupply.model;

//import java.sql.Date;
import java.util.Date;
import java.util.List;

public class Teacher{
	//private int id;
	private String uniqueId;
	private String name;
	private String score;
	private String score_percent;
	private double x;
	private double y;
	private String teacherType;
	private String avatarUrl;
	private String intro;
	private String city;
	private List<Experience> experience;
	private List<Success> success;
	private String summary;
	private String studentCount;
	private String teachTimeCount;
	private String baseInfo;
	private List<String> tags;
	private List<Article> articles;
	private List<Course> courses;
	private List<Comment> comments;
	
	public String getUniqueId() {
		return uniqueId;
	}
	public void setUniqueId(String uniqueId) {
		this.uniqueId = uniqueId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getTeacherType() {
		return teacherType;
	}
	public void setTeacherType(String teacherType) {
		this.teacherType = teacherType;
	}
	public String getAvatarUrl() {
		return avatarUrl;
	}
	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
//	public Experience getExperience() {
//		return experience;
//	}
//	public void setExperience(List<Experience> experience2) {
//		this.experience = experience2;
//	}
//	public Success getSuccess() {
//		return success;
//	}
//	public void setSuccess(Success success) {
//		this.success = success;
//	}
	
	public String getSummary() {
		return summary;
	}
	public List<Experience> getExperience() {
		return experience;
	}
	public void setExperience(List<Experience> experience) {
		this.experience = experience;
	}
	public List<Success> getSuccess() {
		return success;
	}
	public void setSuccess(List<Success> success) {
		this.success = success;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(String studentCount) {
		this.studentCount = studentCount;
	}
	public String getTeachTimeCount() {
		return teachTimeCount;
	}
	public void setTeachTimeCount(String teachTimeCount) {
		this.teachTimeCount = teachTimeCount;
	}
	public String getBaseInfo() {
		return baseInfo;
	}
	public void setBaseInfo(String baseInfo) {
		this.baseInfo = baseInfo;
	}
	
//	public Tags getTags() {
//		return tags;
//	}
//	public void setTags(Tags tags) {
//		this.tags = tags;
//	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public String getScore_percent() {
		return score_percent;
	}
	public void setScore_percent(String score_percent) {
		this.score_percent = score_percent;
	}
	
}
