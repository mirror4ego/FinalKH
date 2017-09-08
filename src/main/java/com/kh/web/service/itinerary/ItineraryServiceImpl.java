package com.kh.web.service.itinerary;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.web.model.itinerary.dao.ItineraryDAO;
import com.kh.web.model.itinerary.dto.PlanAreaVO;
import com.kh.web.model.itinerary.dto.PlanMainMemberVO;

@Service
public class ItineraryServiceImpl implements ItineraryService{
	
	@Inject
	ItineraryDAO itineraryDao;
	
	@Override
	public List<PlanMainMemberVO> itineraryList(){
		return itineraryDao.itineraryList();
	}
	@Override
	public List<PlanAreaVO> areaList() {
		return itineraryDao.areaList();
	}
}
