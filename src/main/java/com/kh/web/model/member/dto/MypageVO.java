package com.kh.web.model.member.dto;

import org.springframework.web.multipart.MultipartFile;

public class MypageVO {
 
	private String id;
	private String travel_name;
	
	//�븿踰�
	private String albumname;
	private String albumpath;
	private String orgname;
	private String newname;
	private MultipartFile uploadfile;
	
	
	//李⑦듃
	private int flight;
	private int transfer;
	private int hotel;
	private int meal;
	private int tour;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTravel_name() {
		return travel_name;
	}
	public void setTravel_name(String travel_name) {
		this.travel_name = travel_name;
	}
	public String getAlbumpath() {
		return albumpath;
	}
	public void setAlbumpath(String albumpath) {
		this.albumpath = albumpath;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getNewname() {
		return newname;
	}
	public void setNewname(String newname) {
		this.newname = newname;
	}
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getFlight() {
		return flight;
	}
	public void setFlight(int flight) {
		this.flight = flight;
	}
	public int getTransfer() {
		return transfer;
	}
	public void setTransfer(int transfer) {
		this.transfer = transfer;
	}
	public int getHotel() {
		return hotel;
	}
	public void setHotel(int hotel) {
		this.hotel = hotel;
	}
	public int getMeal() {
		return meal;
	}
	public void setMeal(int meal) {
		this.meal = meal;
	}
	public int getTour() {
		return tour;
	}
	public void setTour(int tour) {
		this.tour = tour;
	}

}
