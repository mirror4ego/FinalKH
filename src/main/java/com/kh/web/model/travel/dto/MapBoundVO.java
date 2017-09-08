package com.kh.web.model.travel.dto;

public class MapBoundVO {
	private String eastBP;
	private String westBP;
	private String southBP;
	private String northBP;

	public MapBoundVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapBoundVO(String eastBP, String westBP, String southBP, String northBP) {
		super();
		this.eastBP = eastBP;
		this.westBP = westBP;
		this.southBP = southBP;
		this.northBP = northBP;
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

	@Override
	public String toString() {
		return "MapBoundVO [eastBP=" + eastBP + ", westBP=" + westBP + ", southBP=" + southBP + ", northBP=" + northBP
				+ "]";
	}

}
