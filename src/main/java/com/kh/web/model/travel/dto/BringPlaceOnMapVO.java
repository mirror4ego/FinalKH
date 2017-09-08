package com.kh.web.model.travel.dto;

public class BringPlaceOnMapVO {
	private String eastBP;
	private String westBP;
	private String southBP;
	private String northBP;
	private String areaCodeOption;
	private String contentTypeIdOption;
	private String titleOption;

	public BringPlaceOnMapVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BringPlaceOnMapVO(String eastBP, String westBP, String southBP, String northBP, String locOption,
			String contentTypeIdOption, String titleOption, String areaCodeOption) {
		super();
		this.eastBP = eastBP;
		this.westBP = westBP;
		this.southBP = southBP;
		this.northBP = northBP;
		this.areaCodeOption = areaCodeOption;
		this.contentTypeIdOption = contentTypeIdOption;
		this.titleOption = titleOption;
	}

	public String getEastBP() {
		return eastBP;
	}

	public void setEastBP(String eastBP) {
		this.eastBP = eastBP;
	}

	public String getWestBP() {
		return westBP;
	}

	public void setWestBP(String westBP) {
		this.westBP = westBP;
	}

	public String getSouthBP() {
		return southBP;
	}

	public void setSouthBP(String southBP) {
		this.southBP = southBP;
	}

	public String getNorthBP() {
		return northBP;
	}

	public void setNorthBP(String northBP) {
		this.northBP = northBP;
	}

	public String getAreaCodeOption() {
		return areaCodeOption;
	}

	public void setAreaCodeOption(String areaCodeOption) {
		this.areaCodeOption = areaCodeOption;
	}

	public String getContentTypeIdOption() {
		return contentTypeIdOption;
	}

	public void setContentTypeIdOption(String contentTypeIdOption) {
		this.contentTypeIdOption = contentTypeIdOption;
	}

	public String getTitleOption() {
		return titleOption;
	}

	public void setTitleOption(String titleOption) {
		this.titleOption = titleOption;
	}

	@Override
	public String toString() {
		return "bringPlaceOnMapVO [eastBP=" + eastBP + ", westBP=" + westBP + ", southBP=" + southBP + ", northBP="
				+ northBP + ", areaCodeOption=" + areaCodeOption + ", contentTypeIdOption=" + contentTypeIdOption
				+ ", titleOption=" + titleOption + "]";
	}

}
