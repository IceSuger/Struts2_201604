package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Article{
	//#����id
    private String articleId;
    //#���±���
    private String title;
    //#�������ߵ�Ψһid
    private String autherId;
    //#��������
    private String auther;
    //#����ʱ��
    private String publishTime;
    //#��������
    private String content;
    
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAutherId() {
		return autherId;
	}
	public void setAutherId(String autherId) {
		this.autherId = autherId;
	}
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
