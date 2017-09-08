package com.kh.web.model.travel.dto;

public class PlanMainVO {

	private String planMainNum;
	private String title;
	private String startDay;
	private String completion;
	private String email;

	public PlanMainVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanMainVO(String planMainNum, String title, String startDay, String completion, String email) {
		super();
		this.planMainNum = planMainNum;
		this.title = title;
		this.startDay = startDay;
		this.completion = completion;
		this.email = email;
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

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
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

	@Override
	public String toString() {
		return "PlanMainVO [planMainNum=" + planMainNum + ", title=" + title + ", startDay=" + startDay
				+ ", completion=" + completion + ", email=" + email + "]";
	}

}
