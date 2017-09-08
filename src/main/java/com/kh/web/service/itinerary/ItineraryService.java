package com.kh.web.service.itinerary;

import java.util.List;

import com.kh.web.model.itinerary.dto.PlanAreaVO;
import com.kh.web.model.itinerary.dto.PlanMainMemberVO;


public interface ItineraryService {
	//일정 목록
	public List<PlanMainMemberVO> itineraryList();
	//리스트에 포함될 AreaName
	public List<PlanAreaVO> areaList();
}

