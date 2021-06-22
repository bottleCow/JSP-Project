package tLOL.model;

public class Member {
	private int member_num;
	private String member_id;
	private String member_pw;
	private String member_nickname;
	private String member_reg_date;
	private String member_email;
	private String member_del;
	private int member_admin;
	
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(String member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_del() {
		return member_del;
	}
	public void setMember_del(String member_del) {
		this.member_del = member_del;
	}
	public int getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}
}