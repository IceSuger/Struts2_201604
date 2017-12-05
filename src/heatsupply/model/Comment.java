package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Comment{
	private String create_time;
	private String score;
	private String content;
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
    
}
