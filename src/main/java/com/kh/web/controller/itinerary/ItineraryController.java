package com.kh.web.controller.itinerary;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.web.model.itinerary.dto.PlanAreaVO;
import com.kh.web.model.itinerary.dto.PlanMainMemberVO;
import com.kh.web.service.itinerary.ItineraryService;
import com.kh.web.service.travel.TravelService;


@Controller
@RequestMapping("/itinerary/*")
public class ItineraryController {

	private static final Logger logger = LoggerFactory.getLogger(ItineraryController.class);
	
	@Inject
	ItineraryService itineraryService;
	@Inject
	TravelService travelService;
	// 01 여행일정 목록
	//
	@RequestMapping("list.do")
	public String ItineraryList(Model model2){
	// controller => service => dao 요청
		// 리스트로 만들기
		List<PlanMainMemberVO> list2 = itineraryService.itineraryList();
		List<PlanAreaVO> list3 = itineraryService.areaList();
		model2.addAttribute("list", list2);
		model2.addAttribute("list2", list3);
		return "itinerary/itineraryMain";
	}

	@RequestMapping(value = "showPlan.do")
	public ModelAndView showPlan(HttpServletRequest request, HttpSession session) {
		logger.info("makePlan.do");
		logger.info(request.getParameter("planMainNum"));
		Gson gson = new Gson();
		//travelService.selectPlanMainRough(request.getParameter("planMainNum").toString());
		System.out.println(travelService.selectPlanMainRough(request.getParameter("planMainNum").toString()));
		ModelAndView mav = new ModelAndView("travel/makePlan");
		mav.addObject("list",
				gson.toJson(travelService.selectPlanMainRough(request.getParameter("planMainNum").toString())));
		mav.addObject("listDetail",
				gson.toJson(travelService.selectPlanDetailContentCommonJoin(request.getParameter("planMainNum").toString())));
		System.out.println(mav.getModel());
		return mav;
	}
}


