package com.kh.web.model.travel.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.web.model.travel.dto.PlanReplyVO;

@Repository
public class PlanReplyDAOImpl implements PlanReplyDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void insertPlanReply(PlanReplyVO planReplyVO) {
		sqlSession.insert("planReply.insertPlanReply", planReplyVO);
	}
	
	@Override
	public String count(String planMainNum){
		return sqlSession.selectOne("planReply.countPlanReply", planMainNum);
	}
	@Override
	public List<PlanReplyVO> planReplyList(String planMainNum,  int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planMainNum", planMainNum);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("planReply.planReplyList", map);
	}

}
