package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Course{
	//#�γ��б��е�ԭʼ��Ϣ
    private String briefRawData;
    //#�γ���������ʦ��uniqueId
    private String teacherUniqueId;
    //�γ�����ҳurl
    private String detail_url;
    //�γ���
    private String name;
    //�γ�ͼ
    private String portrait;
    //���
    private String introduce;
    //�γ̱��
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
