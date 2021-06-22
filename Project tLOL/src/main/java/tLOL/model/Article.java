package tLOL.model;

public class Article {
	private int board_num;
	private int article_num;
	private int member_num;
	private String article_title;
	private String article_content;
	private String article_date;
	private int article_read;
	private String article_del;
	// additional data
	private String member_nickname;
	private String board_name;
	private int article_recom;
	private int comment_count;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getArticle_num() {
		return article_num;
	}
	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public String getArticle_date() {
		return article_date;
	}
	public void setArticle_date(String article_date) {
		this.article_date = article_date;
	}
	public int getArticle_read() {
		return article_read;
	}
	public void setArticle_read(int article_read) {
		this.article_read = article_read;
	}
	public int getArticle_recom() {
		return article_recom;
	}
	public void setArticle_recom(int article_recom) {
		this.article_recom = article_recom;
	}
	public String getArticle_del() {
		return article_del;
	}
	public void setArticle_del(String article_del) {
		this.article_del = article_del;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
}
