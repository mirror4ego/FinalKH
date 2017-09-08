package com.kh.web.dbParse;

import com.google.gson.annotations.SerializedName;

public class DataEnumContentNature {

	@SerializedName("addr")
	private String Addr;
	@SerializedName("areacode")
	private String AreaCode;
	@SerializedName("contentid")
	private String ContentId;
	@SerializedName("createdtime")
	private String CreatedTime;
	@SerializedName("mainimage")
	private String MainImage;
	@SerializedName("modifiedtime")
	private String ModifiedTime;
	@SerializedName("readcount")
	private String ReadCount;
	@SerializedName("sigungucode")
	private String SiGunGuCode;
	@SerializedName("subtitle")
	private String SubTitle;
	@SerializedName("summary")
	private String Summary;
	@SerializedName("tel")
	private String Tel;
	@SerializedName("telname")
	private String TelName;
	@SerializedName("title")
	private String Title;
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getAreaCode() {
		return AreaCode;
	}
	public void setAreaCode(String areaCode) {
		AreaCode = areaCode;
	}
	public String getContentId() {
		return ContentId;
	}
	public void setContentId(String contentId) {
		ContentId = contentId;
	}
	public String getCreatedTime() {
		return CreatedTime;
	}
	public void setCreatedTime(String createdTime) {
		CreatedTime = createdTime;
	}
	public String getMainImage() {
		return MainImage;
	}
	public void setMainImage(String mainImage) {
		MainImage = mainImage;
	}
	public String getModifiedTime() {
		return ModifiedTime;
	}
	public void setModifiedTime(String modifiedTime) {
		ModifiedTime = modifiedTime;
	}
	public String getReadCount() {
		return ReadCount;
	}
	public void setReadCount(String readCount) {
		ReadCount = readCount;
	}
	public String getSiGunGuCode() {
		return SiGunGuCode;
	}
	public void setSiGunGuCode(String siGunGuCode) {
		SiGunGuCode = siGunGuCode;
	}
	public String getSubTitle() {
		return SubTitle;
	}
	public void setSubTitle(String subTitle) {
		SubTitle = subTitle;
	}
	public String getSummary() {
		return Summary;
	}
	public void setSummary(String summary) {
		Summary = summary;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
	public String getTelName() {
		return TelName;
	}
	public void setTelName(String telName) {
		TelName = telName;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	@Override
	public String toString() {
		return "DataEnumContentNature [Addr=" + Addr + ", AreaCode=" + AreaCode + ", ContentId=" + ContentId
				+ ", CreatedTime=" + CreatedTime + ", MainImage=" + MainImage + ", ModifiedTime=" + ModifiedTime
				+ ", ReadCount=" + ReadCount + ", SiGunGuCode=" + SiGunGuCode + ", SubTitle=" + SubTitle + ", Summary="
				+ Summary + ", Tel=" + Tel + ", TelName=" + TelName + ", Title=" + Title + "]";
	}

	
	
}
