package com.kh.web.model.itinerary.dto;

public class PlanAreaVO {
	private String planMainNum;
	private String areaCode;
	private String areaName;
	private String areaImage;
	
	public PlanAreaVO(String planMainNum, String areaCode, String areaName, String areaImage) {
		super();
		this.planMainNum = planMainNum;
		this.areaCode = areaCode;
		this.areaName = areaName;
		this.areaImage = areaImage;
	}
	public PlanAreaVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaImage() {
		return areaImage;
	}
	public void setAreaImage(String areaImage) {
		this.areaImage = areaImage;
	}
	@Override
	public String toString() {
		return "PlanAreaVO [planMainNum=" + planMainNum + ", areaCode=" + areaCode + ", areaName=" + areaName
				+ ", areaImage=" + areaImage + "]";
	}
	
	
}
