package com.kh.web.model.upload;

import org.springframework.web.multipart.MultipartFile;

public class VO {
	private MultipartFile imgFile;
	
	public MultipartFile getImgFile(){
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile){
		this.imgFile = imgFile;
	}
}
