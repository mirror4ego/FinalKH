package com.kh.web.service.travel;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.web.controller.travel.TravelController;
import com.kh.web.model.travel.dao.TravelDAO;
import com.kh.web.model.travel.dto.AreaVO;
import com.kh.web.model.travel.dto.BringPlaceOnMapVO;
import com.kh.web.model.travel.dto.ContentCommonVO;
import com.kh.web.model.travel.dto.MapBoundVO;
import com.kh.web.model.travel.dto.PlanDetailVO;
import com.kh.web.model.travel.dto.PlanMainVO;
import com.kh.web.model.travel.dto.PlanRoughVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class TravelServiceImpl implements TravelService {

	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Inject
	TravelDAO travelDao;


	@Override
	public List<AreaVO> list() {
		return travelDao.selectAllArea();
	}

	@Override
	public List<ContentCommonVO> listContentCommon() {
		return travelDao.selectAllContentCommon();
	}

	public List<ContentCommonVO> bringAllInMap(MapBoundVO mapBoundVO) {
		logger.info(String.valueOf(mapBoundVO));
		return travelDao.bringAllInMap(mapBoundVO);
	}

	public List<ContentCommonVO> bringPlaceOnMap(BringPlaceOnMapVO bringPlaceOnMapVO) {
		logger.info(String.valueOf(bringPlaceOnMapVO));
		return travelDao.bringPlaceOnMap(bringPlaceOnMapVO);
	}

	@Override
	public String insertPlanMainRough(PlanMainVO planMainVO, Map<String, Object> map) {

		return travelDao.insertPlanMainRough(planMainVO, map);
	}

	public Map<String, Object> selectPlanMainRough(String planMainNum) {

		logger.info("selectPlanMainRough");
		logger.info(travelDao.selectPlanMain(planMainNum).toString());
		logger.info(travelDao.selectPlanRoughAreaJoin(planMainNum).toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planMain", travelDao.selectPlanMain(planMainNum));
		map.put("planRough", travelDao.selectPlanRoughAreaJoin(planMainNum));

		return map;

	}
	public Map<String, Object> selectPlanDetailContentCommonJoin(String planMainNum) {
		
		logger.info("selectPlanMainDetail");
		logger.info(travelDao.selectPlanMain(planMainNum).toString());
		logger.info(travelDao.selectPlanRoughAreaJoin(planMainNum).toString());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planMain", travelDao.selectPlanMain(planMainNum));
		map.put("planDetail", travelDao.selectPlanDetailContentCommonJoin(planMainNum));
		
		return map;
		
	}

	public String insertPlanRoughDetail(Map<String, Object> map)
			throws JsonParseException, JsonMappingException, IOException {
		String returnString = "false";
		Gson gson = new Gson();
		new ObjectMapper();
		System.out.println(map.get("planRoughObjectArray").toString());
		System.out.println(map.get("planDetailObjectArray").toString());

		PlanRoughVO[] planRoughObjectArray = gson.fromJson(map.get("planRoughObjectArray").toString(),
				PlanRoughVO[].class);
		List<PlanRoughVO> planRoughObjectList = Arrays.asList(planRoughObjectArray);

		PlanDetailVO[] planDetailObjectArray = gson.fromJson(map.get("planDetailObjectArray").toString(),
				PlanDetailVO[].class);
		List<PlanDetailVO> planDetailObjectList = Arrays.asList(planDetailObjectArray);

		// 일단 모든 데이터 삭제
		travelDao.deleteAllPlanDetail(planDetailObjectList.get(0));
		travelDao.deleteAllPlanRough(planRoughObjectList.get(0));

		// 데이터 저장
		for (int i = 0; i < planRoughObjectList.size(); i++) {
			travelDao.insertPlanRough(planRoughObjectList.get(i));
		}

		for (int i = 0; i < (planDetailObjectList.size()); i++) {
			travelDao.insertPlanDetail(planDetailObjectList.get(i));
		}

		returnString = "true";
		return returnString;
	}
	


}
