package com.kh.web.model.travel.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.web.controller.travel.TravelController;
import com.kh.web.model.travel.dto.AreaVO;
import com.kh.web.model.travel.dto.BringPlaceOnMapVO;
import com.kh.web.model.travel.dto.ContentCommonVO;
import com.kh.web.model.travel.dto.MapBoundVO;
import com.kh.web.model.travel.dto.PlanDetailContentCommonJoinVO;
import com.kh.web.model.travel.dto.PlanDetailVO;
import com.kh.web.model.travel.dto.PlanMainVO;
import com.kh.web.model.travel.dto.PlanRoughAreaJoinVO;
import com.kh.web.model.travel.dto.PlanRoughVO;

@Repository
public class TravelDAOImpl implements TravelDAO {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Inject
	SqlSession sqlSession;

	@Override
	public List<AreaVO> selectAllArea() {
		return sqlSession.selectList("travel.selectAllArea");
	}

	@Override
	public List<ContentCommonVO> selectAllContentCommon() {
		return sqlSession.selectList("travel.selectAllContentCommon");
	}

	public List<ContentCommonVO> bringAllInMap(MapBoundVO mapBoundVO) {
		logger.info(mapBoundVO.toString());
		return sqlSession.selectList("travel.bringAllInMap", mapBoundVO);
	}
	public List<ContentCommonVO> bringPlaceOnMap(BringPlaceOnMapVO bringPlaceOnMapVO) {
		logger.info(bringPlaceOnMapVO.toString());
		return sqlSession.selectList("travel.bringPlaceOnMap", bringPlaceOnMapVO);
	}

	public PlanMainVO selectPlanMain(String planMainNum) {
		return sqlSession.selectOne("travel.selectPlanMain", planMainNum);
	}

	public List<PlanRoughAreaJoinVO> selectPlanRoughAreaJoin(String planMainNum) {
		return sqlSession.selectList("travel.selectPlanRoughAreaJoin", planMainNum);
	}

	
	public List<PlanDetailContentCommonJoinVO> selectPlanDetailContentCommonJoin(String planMainNum){
		return sqlSession.selectList("travel.selectPlanDetailContentCommonJoin", planMainNum);
	}
	
	public String insertPlanMainRough(PlanMainVO planMainVO, Map<String, Object> map) {

		sqlSession.insert("travel.insertPlanMain", planMainVO);

		String planMainNum = sqlSession.selectOne("travel.selectLast");

		planMainVO.setPlanMainNum(planMainNum);

		PlanRoughVO planRoughVO = new PlanRoughVO();
		planRoughVO.setPlanMainNum(planMainVO.getPlanMainNum());

		for (int i = 1; i < map.size() - 1; i++) {
			System.out.println(map.size());
			planRoughVO.setPlanDay(((Map<String, Object>) map.get("userPickItem" + i)).get("dateDay").toString());
			System.out.println(planRoughVO.toString());
			String areaCode = sqlSession.selectOne("travel.selectArea",
					(String) ((Map<String, Object>) (map.get("userPickItem" + i))).get("areaName"));
			planRoughVO.setAreaCode(areaCode);
			sqlSession.insert("travel.insertPlanRough", planRoughVO);
		}

		return planMainNum;

	}

	public boolean deleteAllPlanDetail(PlanDetailVO planDetailVO) {
		boolean returnBoolean = false;
		sqlSession.delete("travel.deleteAllPlanDetail", planDetailVO);
		returnBoolean = true;
		return returnBoolean;
	}

	public boolean deleteAllPlanRough(PlanRoughVO planRoughVO) {
		boolean returnBoolean = false;
		sqlSession.delete("travel.deleteAllPlanRough", planRoughVO);
		returnBoolean = true;
		return returnBoolean;
	}

	public boolean insertPlanRough(PlanRoughVO planRoughVO) {
		boolean returnBoolean = false;
		sqlSession.insert("travel.insertPlanRough", planRoughVO);
		returnBoolean = true;
		return returnBoolean;
	}
	public boolean insertPlanDetail(PlanDetailVO planDetailVO) {
		boolean returnBoolean = false;
		sqlSession.insert("travel.insertPlanDetail", planDetailVO);
		returnBoolean = true;
		return returnBoolean;
	}
}
