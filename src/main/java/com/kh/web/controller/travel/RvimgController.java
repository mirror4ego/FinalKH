package com.kh.web.controller.travel;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.web.model.travel.dto.FileBean;

@Controller
public class RvimgController {
	Logger log = Logger.getLogger(this.getClass());

	// 이미지 업로드
	@RequestMapping(value = "/upimg.do")
	public String upimg(FileBean fileBean, HttpServletRequest request, Model model) {
		System.out.println("====업로드시작===============================================");
		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";

		MultipartFile upload = fileBean.getUpload();
		String filename = "";
		String CKEditorFuncNum = "";

		if (upload != null) {
			filename = upload.getOriginalFilename();
			fileBean.setFilename(filename);
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try {
				File file = new File(root_path + attach_path + filename);
				if(!file.exists()){
					file.mkdirs();
				}
				log.info(root_path + attach_path + filename);
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String file_path = attach_path + filename;
		model.addAttribute("file_path", file_path);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "travel/reviewWrite";
	}
	
}
