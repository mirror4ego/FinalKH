package com.kh.web.model.travel.dto; 
  
import java.util.Date; 
  
public class ReviewVO { 
	private int boardnum;			// 게시글 번호
	private String subject;		// 게시글 제목
	private String writer;		//	작성자
	private String content;		// 게시글 내용	
	private Date regdate;		// 게시글 작성일자 util.Date
	private int viewcount;		// 게시글 조회수
	private int recnt;			// 게시글 댓글의 수 
	private String show;		// 게시글 삭제 상태 유무(y, n)
	private String email;
	
	
	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getSubject() {
		return subject;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
		
} 