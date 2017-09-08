package com.kh.web.model.upload;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

public class FileDTO {
	private String name, pwd, title, content;
	private String fileName;
    private MultipartFile uploadfile;
    private MultipartRequest uploadfile1;
 
   

	public MultipartRequest getUploadfile1() {
		return uploadfile1;
	}

	public void setUploadfile1(MultipartRequest uploadfile1) {
		this.uploadfile1 = uploadfile1;
	}

	public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public String getPwd() {
        return pwd;
    }
 
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
 
    public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
 
    public String getContent() {
        return content;
    }
 
    public void setContent(String content) {
        this.content = content;
    }
 
    public String getFileName() {
        return fileName;
    }
 
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
 
    public MultipartFile getUploadfile() {
        return uploadfile;
    }
 
    public void setUploadfile(MultipartFile uploadfile) {
        this.uploadfile = uploadfile;
    }

}
