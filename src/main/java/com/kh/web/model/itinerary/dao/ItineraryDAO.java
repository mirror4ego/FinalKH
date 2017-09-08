package com.kh.web.model.itinerary.dao;

import java.util.List;

import com.kh.web.model.itinerary.dto.PlanAreaVO;
import com.kh.web.model.itinerary.dto.PlanMainMemberVO;

public interface ItineraryDAO {
	// 리스트
	public List<PlanMainMemberVO> itineraryList();
	//리스트에 포함될 AreaName
	public List<PlanAreaVO> areaList();
}