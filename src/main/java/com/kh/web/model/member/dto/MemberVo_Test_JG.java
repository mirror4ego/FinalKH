package com.kh.web.model.member.dto;

public class MemberVo_Test_JG {
	private String email;
	private String password;
	private String userid;
	private String gradename;
	
	public MemberVo_Test_JG(String email, String password, String userid, String gradename) {
		super();
		this.email = email;
		this.password = password;
		this.userid = userid;
		this.gradename = gradename;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	@Override
	public String toString() {
		return "MemberVo_Test_JG [email=" + email + ", password=" + password + ", userid=" + userid + ", gradename="
				+ gradename + "]";
	}
	public MemberVo_Test_JG() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
