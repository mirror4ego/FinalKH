package com.kh.web.controller.travel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.web.model.travel.dto.ReviewVO;
import com.kh.web.service.travel.ReviewService;
import com.kh.web.service.travel.reviewPager;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Inject
	ReviewService reviewService;

	// 여행 후기 관련	
	// 작성
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
	public String reviewWrite() {
		logger.info("작성 시작");
		return "travel/reviewWrite";
	}

	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewVO vo,HttpSession session) throws Exception {
		logger.info("작성 저장 시작");
		// session에 저장된 userId를 writer에 저장
		String email = (String) session.getAttribute("email");
		// vo에 writer를 세팅
		vo.setEmail(email);
		System.out.println("글 주인 : "+email);

		reviewService.create(vo);		
		return "redirect:reviewList.do";
	}
	
	//리스트
	@RequestMapping("/reviewList.do")
	public ModelAndView reviewList(@RequestParam(defaultValue = "subject") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {
		logger.info("리스트 시작");
		// 페이지 나누기 관련 처리
		reviewPager reviewPager = new reviewPager(curPage);
		int start = reviewPager.getPageBegin();
		int end = reviewPager.getPageEnd();

		List<ReviewVO> list =reviewService.listAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색키워드
		map.put("reviewPager", reviewPager);
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		/*
		 * mav.addObject("list", list); // 데이터를 저장 mav.addObject("count",
		 * count); mav.addObject("searchOption", searchOption);
		 * mav.addObject("keyword", keyword);
		 */
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("travel/reviewList"); // 뷰를 List.jsp로 설정
		return mav; // // jsp로 List가 전달된다.
	}
	
	// 보기
	@RequestMapping(value="/review.do", method = RequestMethod.GET)
	public ModelAndView review(@RequestParam int boardnum, @RequestParam int curPage, @RequestParam String searchOption,
			@RequestParam String keyword, HttpSession session) throws Exception{
		logger.info("보기 시작");
		
		reviewService.increaseViewcnt(boardnum, session); //조회수 증가
		ModelAndView mav = new ModelAndView();
		mav.setViewName("travel/review");
		mav.addObject("dto", reviewService.read(boardnum));
		System.out.println("읽기 : "+reviewService.read(boardnum));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		logger.info("mav:", mav);
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/reviewUpdate.do", method = RequestMethod.GET)
	public ModelAndView Update(@RequestParam(value="boardnum") int boardnum, HttpSession session) throws Exception{
		logger.info("수정 시작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("travel/reviewmodify");
		mav.addObject("dto", reviewService.read(boardnum));
		System.out.println("읽기 : "+reviewService.read(boardnum));
		return mav;
	}
	@RequestMapping(value="/reinUpdate.do", method = RequestMethod.POST)
	public String reinUpdate(@ModelAttribute ReviewVO vo) throws Exception{
		reviewService.update(vo);
		logger.info("수정 완료 : "+vo);
		return "redirect:reviewList.do";
	}
	
	
	// 삭제
	@RequestMapping(value="/reviewDelete.do", method = RequestMethod.GET)
	public String delete(@RequestParam(value="boardnum") int boardnum) throws Exception{
		logger.info("번호 왔나? : "+boardnum);
		System.out.println("글번호 : "+boardnum);
		reviewService.delete(boardnum);
		return "redirect:reviewList.do";
	}
						
}