package com.kh.web.dbParse;

import com.google.gson.annotations.SerializedName;

public class DataEnumContentGallary {

	@SerializedName("galContentId")
	private String galContentId;
	@SerializedName("galContentTypeId")
	private String galContentTypeId;
	@SerializedName("galCreatedtime")
	private String galCreatedtime;
	@SerializedName("galModifiedtime")
	private String galModifiedtime;
	@SerializedName("galPhotographer")
	private String galPhotographer;
	@SerializedName("galPhotographyLocation")
	private String galPhotographyLocation;
	@SerializedName("galPhotographyMonth")
	private String galPhotographyMonth;
	@SerializedName("galSearchKeyword")
	private String galSearchKeyword;
	@SerializedName("galTitle")
	private String galTitle;
	@SerializedName("galViewCount")
	private String galViewCount;
	@SerializedName("galWebImageUrl")
	private String galWebImageUrl;
	public String getGalContentId() {
		return galContentId;
	}
	public void setGalContentId(String galContentId) {
		this.galContentId = galContentId;
	}
	public String getGalContentTypeId() {
		return galContentTypeId;
	}
	public void setGalContentTypeId(String galContentTypeId) {
		this.galContentTypeId = galContentTypeId;
	}
	public String getGalCreatedtime() {
		return galCreatedtime;
	}
	public void setGalCreatedtime(String galCreatedtime) {
		this.galCreatedtime = galCreatedtime;
	}
	public String getGalModifiedtime() {
		return galModifiedtime;
	}
	public void setGalModifiedtime(String galModifiedtime) {
		this.galModifiedtime = galModifiedtime;
	}
	public String getGalPhotographer() {
		return galPhotographer;
	}
	public void setGalPhotographer(String galPhotographer) {
		this.galPhotographer = galPhotographer;
	}
	public String getGalPhotographyLocation() {
		return galPhotographyLocation;
	}
	public void setGalPhotographyLocation(String galPhotographyLocation) {
		this.galPhotographyLocation = galPhotographyLocation;
	}
	public String getGalPhotographyMonth() {
		return galPhotographyMonth;
	}
	public void setGalPhotographyMonth(String galPhotographyMonth) {
		this.galPhotographyMonth = galPhotographyMonth;
	}
	public String getGalSearchKeyword() {
		return galSearchKeyword;
	}
	public void setGalSearchKeyword(String galSearchKeyword) {
		this.galSearchKeyword = galSearchKeyword;
	}
	public String getGalTitle() {
		return galTitle;
	}
	public void setGalTitle(String galTitle) {
		this.galTitle = galTitle;
	}
	public String getGalViewCount() {
		return galViewCount;
	}
	public void setGalViewCount(String galViewCount) {
		this.galViewCount = galViewCount;
	}
	public String getGalWebImageUrl() {
		return galWebImageUrl;
	}
	public void setGalWebImageUrl(String galWebImageUrl) {
		this.galWebImageUrl = galWebImageUrl;
	}
	@Override
	public String toString() {
		return "DataEnumContentGallary [galContentId=" + galContentId + ", galContentTypeId=" + galContentTypeId
				+ ", galCreatedtime=" + galCreatedtime + ", galModifiedtime=" + galModifiedtime + ", galPhotographer="
				+ galPhotographer + ", galPhotographyLocation=" + galPhotographyLocation + ", galPhotographyMonth="
				+ galPhotographyMonth + ", galSearchKeyword=" + galSearchKeyword + ", galTitle=" + galTitle
				+ ", galViewCount=" + galViewCount + ", galWebImageUrl=" + galWebImageUrl + "]";
	}




}
