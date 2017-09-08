package com.kh.web.model.travel.dto;

public class PlanReplyVO {

	private String planReplyNum; // 댓글 번호
	private String planMainNum; // 게시글 번호
	private String content; // 댓글 내용
	private String email; // 댓글 작성자
	private String regDate; // 댓글 작성일자
	private String updateDate; // 댓글 수정일자
	private String secretReply; // **댓글 숨김 유무 추가

	public PlanReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanReplyVO(String planReplyNum, String planMainNum, String content, String email, String regDate,
			String updateDate, String secretReply) {
		super();
		this.planReplyNum = planReplyNum;
		this.planMainNum = planMainNum;
		this.content = content;
		this.email = email;
		this.regDate = regDate;
		this.updateDate = updateDate;
		this.secretReply = secretReply;
	}

	public String getPlanReplyNum() {
		return planReplyNum;
	}

	public void setPlanReplyNum(String planReplyNum) {
		this.planReplyNum = planReplyNum;
	}

	public String getPlanMainNum() {
		return planMainNum;
	}

	public void setPlanMainNum(String planMainNum) {
		this.planMainNum = planMainNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getSecretReply() {
		return secretReply;
	}

	public void setSecretReply(String secretReply) {
		this.secretReply = secretReply;
	}

	@Override
	public String toString() {
		return "PlanReplyVO [planReplyNum=" + planReplyNum + ", planMainNum=" + planMainNum + ", content=" + content
				+ ", email=" + email + ", regDate=" + regDate + ", updateDate=" + updateDate + ", secretReply="
				+ secretReply + "]";
	}

}
