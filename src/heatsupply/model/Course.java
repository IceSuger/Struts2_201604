package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Course{
	//#课程列表中的原始信息
    private String briefRawData;
    //#课程所属的老师的uniqueId
    private String teacherUniqueId;
    //课程详情页url
    private String detail_url;
    //课程名
    private String name;
    //课程图
    private String portrait;
    //简介
    private String introduce;
    //课程编号
    private String courseId;
    
	public String getBriefRawData() {
		return briefRawData;
	}
	public void setBriefRawData(String briefRawData) {
		this.briefRawData = briefRawData;
	}
	public String getTeacherUniqueId() {
		return teacherUniqueId;
	}
	public void setTeacherUniqueId(String teacherUniqueId) {
		this.teacherUniqueId = teacherUniqueId;
	}
	public String getDetail_url() {
		return detail_url;
	}
	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPortrait() {
		return portrait;
	}
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
    
    
}
