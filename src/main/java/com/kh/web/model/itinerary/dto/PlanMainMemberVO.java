package com.kh.web.model.itinerary.dto;

import java.util.Date;

public class PlanMainMemberVO {
	private String planMainNum;
	private String title;
	private Date startDay;
	private String completion;
	private String email;
	private String userId;
	
	public PlanMainMemberVO(String planMainNum, String title, Date startDay, String completion, String email, String userId) {
		super();
		this.planMainNum = planMainNum;
		this.title = title;
		this.startDay = startDay;
		this.completion = completion;
		this.email = email;
		this.userId = userId;
	}
	public PlanMainMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPlanMainNum() {
		return planMainNum;
	}
	public void setPlanMainNum(String planMainNum) {
		this.planMainNum = planMainNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDay() {
		return startDay;
	}
	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}
	public String getCompletion() {
		return completion;
	}
	public void setCompletion(String completion) {
		this.completion = completion;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "PlanMainVO [planMainNum=" + planMainNum + ", title=" + title + ", startDay=" + startDay
				+ ", completion=" + completion + ", email=" + email + ", userId=" + userId + "]";
	}
	
	
	
	
	
	
}