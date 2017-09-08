package com.kh.web.service.travel;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.kh.web.model.travel.dto.AreaVO;
import com.kh.web.model.travel.dto.BringPlaceOnMapVO;
import com.kh.web.model.travel.dto.ContentCommonVO;
import com.kh.web.model.travel.dto.MapBoundVO;
import com.kh.web.model.travel.dto.PlanMainVO;

public interface TravelService {
	public List<AreaVO> list();

	public List<ContentCommonVO> listContentCommon();

	public List<ContentCommonVO> bringAllInMap(MapBoundVO mapBoundVO);

	public List<ContentCommonVO> bringPlaceOnMap(BringPlaceOnMapVO bringPlaceOnMapVO);

	public String insertPlanMainRough(PlanMainVO planMainVO, Map<String, Object> map);

	public Map<String, Object> selectPlanMainRough(String planMainNum);
	public Map<String, Object> selectPlanDetailContentCommonJoin(String planMainNum);

	public String insertPlanRoughDetail(Map<String, Object> map)
			throws JsonParseException, JsonMappingException, IOException;

}
