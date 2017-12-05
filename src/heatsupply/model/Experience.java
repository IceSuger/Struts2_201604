package heatsupply.model;

//import java.sql.Date;
import java.util.Date;
import java.util.List;

public class Experience{
	private String title;
	private List<String> content;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
	public List<String> getContent() {
		return content;
	}
	public void setContent(List<String> content) {
		this.content = content;
	}
	
}
