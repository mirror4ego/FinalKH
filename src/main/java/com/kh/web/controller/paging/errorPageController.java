package com.kh.web.controller.paging;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.web.controller.member.MemberController2;

@Controller
@RequestMapping("/paging/*")
public class errorPageController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
	
	@RequestMapping("400.do")
	public String pageError400(HttpServletRequest request, Model model) {
		logger.info("page error code 400");
		pageErrorLog(request);
		model.addAttribute("msg" , "400 - server가 요청사항을 이해 못함");
		return "/paging/paging";
	}
	@RequestMapping("403.do")
	public String pageError403(HttpServletRequest request, Model model) {
		logger.info("page error code 403");
		pageErrorLog(request);
		model.addAttribute("msg" , "403 - 접근 금지");
		return "/paging/paging";
	}
	@RequestMapping("404.do")
	public String pageError404(HttpServletRequest request, Model model) {
		logger.info("page error code 404");
		pageErrorLog(request);
		model.addAttribute("msg" , "404 - 페이지 존재 x");
		return "/paging/paging";
	}
	@RequestMapping("405.do")
	public String pageError405(HttpServletRequest request, Model model) {
		logger.info("page error code 405");
		pageErrorLog(request);
		model.addAttribute("msg" , "405 - 메소드 허용 x");
		return "/paging/paging";
	}
	@RequestMapping("500.do")
	public String pageError500(HttpServletRequest request, Model model) {
		logger.info("page error code 500");
		pageErrorLog(request);
		model.addAttribute("msg" , "500 - server 내부  or DB 오류 발생");
		return "/paging/paging";
	}
	@RequestMapping("503.do")
	public String pageError503(HttpServletRequest request, Model model) {
		logger.info("page error code 503");
		pageErrorLog(request);
		model.addAttribute("msg" , "503 - 서비스 이용 불가");
		return "/paging/paging";
	}
	
	private void pageErrorLog(HttpServletRequest request) {
		logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
	}
}
