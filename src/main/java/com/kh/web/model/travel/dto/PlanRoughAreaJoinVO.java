package com.kh.web.model.travel.dto;

public class PlanRoughAreaJoinVO {

	private String planRoughNum;
	private String planMainNum;
	private String areaCode;
	private String planDay;
	private String areaName;
	private String areaMapX;
	private String areaMapY;
	private String areaImage;

	public PlanRoughAreaJoinVO(String planRoughNum, String planMainNum, String areaCode, String planDay,
			String areaName, String areaMapX, String areaMapY, String areaImage) {
		super();
		this.planRoughNum = planRoughNum;
		this.planMainNum = planMainNum;
		this.areaCode = areaCode;
		this.planDay = planDay;
		this.areaName = areaName;
		this.areaMapX = areaMapX;
		this.areaMapY = areaMapY;
		this.areaImage = areaImage;
	}

	public PlanRoughAreaJoinVO() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaMapX() {
		return areaMapX;
	}

	public void setAreaMapX(String areaMapX) {
		this.areaMapX = areaMapX;
	}

	public String getAreaMapY() {
		return areaMapY;
	}

	public void setAreaMapY(String areaMapY) {
		this.areaMapY = areaMapY;
	}

	public String getAreaImage() {
		return areaImage;
	}

	public void setAreaImage(String areaImage) {
		this.areaImage = areaImage;
	}

	@Override
	public String toString() {
		return "PlanRoughAreaJoinVO [planRoughNum=" + planRoughNum + ", planMainNum=" + planMainNum + ", areaCode="
				+ areaCode + ", planDay=" + planDay + ", areaName=" + areaName + ", areaMapX=" + areaMapX
				+ ", areaMapY=" + areaMapY + ", areaImage=" + areaImage + "]";
	}

}
