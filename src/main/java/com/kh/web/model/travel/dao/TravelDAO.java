package com.kh.web.model.travel.dao;

import java.util.List;
import java.util.Map;

import com.kh.web.model.travel.dto.AreaVO;
import com.kh.web.model.travel.dto.BringPlaceOnMapVO;
import com.kh.web.model.travel.dto.ContentCommonVO;
import com.kh.web.model.travel.dto.MapBoundVO;
import com.kh.web.model.travel.dto.PlanDetailContentCommonJoinVO;
import com.kh.web.model.travel.dto.PlanDetailVO;
import com.kh.web.model.travel.dto.PlanMainVO;
import com.kh.web.model.travel.dto.PlanRoughAreaJoinVO;
import com.kh.web.model.travel.dto.PlanRoughVO;

public interface TravelDAO {
	public List<AreaVO> selectAllArea();

	public List<ContentCommonVO> selectAllContentCommon();

	public List<ContentCommonVO> bringAllInMap(MapBoundVO mapBoundVO);

	public List<ContentCommonVO> bringPlaceOnMap(BringPlaceOnMapVO bringPlaceOnMapVO);

	public String insertPlanMainRough(PlanMainVO planMainVO, Map<String, Object> map);

	public PlanMainVO selectPlanMain(String planMainNum);


	public List<PlanRoughAreaJoinVO> selectPlanRoughAreaJoin(String planMainNum);
	
	public List<PlanDetailContentCommonJoinVO> selectPlanDetailContentCommonJoin(String planMainNum);

	public boolean deleteAllPlanDetail(PlanDetailVO planDetailVO);

	public boolean deleteAllPlanRough(PlanRoughVO planRoughVO);

	public boolean insertPlanRough(PlanRoughVO planRoughVO);

	public boolean insertPlanDetail(PlanDetailVO planDetailVO);

}