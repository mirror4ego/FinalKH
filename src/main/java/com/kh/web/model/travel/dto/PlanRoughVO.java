package com.kh.web.model.travel.dto;

public class PlanRoughVO {

	private String planRoughNum;
	private String planMainNum;
	private String areaCode;
	private String planDay;

	public PlanRoughVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanRoughVO(String planRoughNum, String planMainNum, String areaCode, String planDay) {
		super();
		this.planRoughNum = planRoughNum;
		this.planMainNum = planMainNum;
		this.areaCode = areaCode;
		this.planDay = planDay;
	}

	public String getPlanRoughNum() {
		return planRoughNum;
	}

	public void setPlanRoughNum(String planRoughNum) {
		this.planRoughNum = planRoughNum;
	}

	public String getPlanMainNum() {
		return planMainNum;
	}

	public void setPlanMainNum(String planMainNum) {
		this.planMainNum = planMainNum;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getPlanDay() {
		return planDay;
	}

	public void setPlanDay(String planDay) {
		this.planDay = planDay;
	}

	@Override
	public String toString() {
		return "PlanRoughVO [planRoughNum=" + planRoughNum + ", planMainNum=" + planMainNum + ", areaCode=" + areaCode
				+ ", planDay=" + planDay + "]";
	}

}
