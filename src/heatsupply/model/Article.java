package heatsupply.model;

//import java.sql.Date;
import java.util.Date;

public class Article{
	//#文章id
    private String articleId;
    //#文章标题
    private String title;
    //#文章作者的唯一id
    private String autherId;
    //#文章作者
    private String auther;
    //#发表时间
    private String publishTime;
    //#文章内容
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
