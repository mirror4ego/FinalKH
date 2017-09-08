package com.kh.web.model.member.dto;

public class MypageCalVO {
	private String planMainNum;
	private String email;
	private String contentId;
	private String startTime;
	private String endTime;
	private String title;
	private String startday;
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getPlanMainNum() {
		return planMainNum;
	}
	public void setPlanMainNum(String planMainNum) {
		this.planMainNum = planMainNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
