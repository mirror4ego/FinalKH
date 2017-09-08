package com.kh.web.controller.travel;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.web.model.travel.dto.ImageVO;
import com.kh.web.service.travel.ImageService;

@Controller
public class ImageController {
	

	@Inject
	ImageService imageService;

	// 02. 여행 후기 관련
	@RequestMapping("imageList.do")

	public String imageList(Model model) throws Exception {
		
		 List<ImageVO> list = imageService.imageList();
	     model.addAttribute("list", list);
	     return "mainMain";

	}

	
}
