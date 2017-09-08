package com.kh.web.controller.travel;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.kh.web.model.travel.dto.BringPlaceOnMapVO;
import com.kh.web.model.travel.dto.MapBoundVO;
import com.kh.web.model.travel.dto.PlanMainVO;
import com.kh.web.model.travel.dto.PlanReplyVO;
import com.kh.web.service.travel.PlanReplyPager;
import com.kh.web.service.travel.PlanReplyService;
import com.kh.web.service.travel.TravelService;
import com.kh.web.util.JsonResponseUtil;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/travel/*") // 모든맵핑은 /travel/를 상속
public class TravelController {
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Resource(name = "uploadPath")
	String uploadPath;
	@Inject
	TravelService travelService;
	@Inject	
	PlanReplyService planReplyService;

	@RequestMapping("createPlan.do")
	public String createPlan(Model model) {
		logger.info("createPlan.do");
		// 일단 첫 로딩시에 전체 area 데이터를 가져와서 맵에 마커 정보를 띄운다
		model.addAttribute("list", travelService.list());
		return "travel/createPlan";
	}

	@RequestMapping(value = "makePlan.do")
	public ModelAndView makePlan(HttpServletRequest request, HttpSession session) {
		logger.info("makePlan.do");
		logger.info(request.getParameter("planMainNum"));
		Gson gson = new Gson();
		travelService.selectPlanMainRough(request.getParameter("planMainNum").toString());
		System.out.println(travelService.selectPlanMainRough(request.getParameter("planMainNum").toString()));
		ModelAndView mav = new ModelAndView("travel/makePlan");
		mav.addObject("list",
				gson.toJson(travelService.selectPlanMainRough(request.getParameter("planMainNum").toString())));
		System.out.println(mav.getModel());
		return mav;
	}

	@RequestMapping("travelTip.do")
	public String travelTip(HttpServletRequest request) {
		logger.info("travelTip.do");
		// model.addAttribute("list", travelService.listContentCommon());
		return "travel/travelTip";
	}
	@RequestMapping("howToUse.do")
	public String howToUse(HttpServletRequest request) {
		logger.info("howToUse.do");
		// model.addAttribute("list", travelService.listContentCommon());
		return "travel/howToUse";
	}
	@RequestMapping("sightRough.do")
	public String sightRough(HttpServletRequest request) {
		logger.info("sightRough.do");
		// model.addAttribute("list", travelService.listContentCommon());
		return "travel/sightRough";
	}
	@RequestMapping("sightDetail.do")
	public String sightDetail(HttpServletRequest request) {
		logger.info("sightDetail.do");

		// model.addAttribute("list", travelService.listContentCommon());
		return "travel/sightDetail";
	}
	@RequestMapping("gallery.do")
	public String gallery(HttpServletRequest request) {
		logger.info("gallery.do");
		// model.addAttribute("list", travelService.listContentCommon());
		return "travel/gallery";
	}

	@ResponseBody
	@RequestMapping(value = "bringAllInMap.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<Object> bringAllInMap(HttpServletRequest request, @RequestBody MapBoundVO mapBoundVO) {
		logger.info("bringAllInMap.do");
		logger.info(String.valueOf(mapBoundVO));
		Object result = travelService.bringAllInMap(mapBoundVO);

		return JsonResponseUtil.getJSONResponse(result);
	}
	@ResponseBody
	@RequestMapping(value = "bringPlaceOnMap.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<Object> bringPlaceOnMap(HttpServletRequest request, @RequestBody BringPlaceOnMapVO bringPlaceOnMapVO) {
		logger.info("bringPlaceOnMap.do");
		logger.info(String.valueOf(bringPlaceOnMapVO));
		Object result = travelService.bringPlaceOnMap(bringPlaceOnMapVO);
		
		return JsonResponseUtil.getJSONResponse(result);
	}

	@ResponseBody
	@RequestMapping(value = "insertPlanMainRough.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String insertPlanMainRough(HttpSession session, HttpServletRequest request,
			@RequestBody Map<String, Object> map) {

		session.getAttribute("email");
		map.get("title");
		map.get("datePicker");

		PlanMainVO planMainVO = new PlanMainVO();

		planMainVO.setCompletion("0");
		planMainVO.setTitle(map.get("title").toString());
		planMainVO.setStartDay(map.get("datePicker").toString());
		planMainVO.setEmail(session.getAttribute("email").toString());
		System.out.println(planMainVO.toString());

		travelService.insertPlanMainRough(planMainVO, map);
		String returnString = planMainVO.getPlanMainNum();

		return returnString;
	}

	@ResponseBody
	@RequestMapping(value = "insertPlanDetail.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String insertDetail(HttpSession session, HttpServletRequest request, @RequestBody Map<String, Object> map) {

		session.getAttribute("email");
		map.get("title");
		map.get("datePicker");

		PlanMainVO planMainVO = new PlanMainVO();

		planMainVO.setCompletion("0");
		planMainVO.setTitle(map.get("title").toString());
		planMainVO.setStartDay(map.get("datePicker").toString());
		planMainVO.setEmail(session.getAttribute("email").toString());
		System.out.println(planMainVO.toString());

		travelService.insertPlanMainRough(planMainVO, map);
		String returnString = planMainVO.getPlanMainNum();

		return returnString;
	}

	@ResponseBody
	@RequestMapping(value = "insertPlanRoughDetail.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public void insertPlanRoughDetail(HttpSession session, HttpServletRequest request, @RequestBody Map<String, Object> map) throws JsonParseException, JsonMappingException, IOException {
		session.getAttribute("email");
		travelService.insertPlanRoughDetail(map);

	}
	
	@RequestMapping("mainMain.do")
	public String mainMain() throws Exception {
		logger.info("travel/mainMain.do");
		return "mainMain"; // views/travel/reviewList.jsp로 포워드
	}
	
	@RequestMapping("insertPlanReplyRest.do")
	public ResponseEntity<String> insertPlanReplyRest(@RequestBody PlanReplyVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		logger.info(vo.toString());
		try {
			String email = (String) session.getAttribute("email");
			vo.setEmail(email);
			planReplyService.insertPlanReply(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("planReplyList.do")
	@ResponseBody // 리턴데이터를 json으로 변환(RestController사용시 @ResponseBody생략가능)
	public List<PlanReplyVO> planReplyList(@RequestParam String planMainNum, @RequestParam(defaultValue="1") int curPage, HttpSession session){
		// 페이징 처리
		int count = Integer.parseInt(planReplyService.count(planMainNum)); // 댓글 갯수
		PlanReplyPager pager = new PlanReplyPager(count, curPage);
		// 현재 페이지의 페이징 시작 번호
		int start = pager.getPageBegin();
		// 현재 페이지의 페이징  끝 번호
		int end = pager.getPageEnd();
		System.out.println(count);
		System.out.println(start);
		System.out.println(end);
		List<PlanReplyVO> list = planReplyService.planReplyList(planMainNum, start, end, session);
		System.out.println(list);
		// list를 리턴
		return list;
	}
	
	

}
