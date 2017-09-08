package com.kh.web.model.travel.dao;

import java.util.List;

import com.kh.web.model.travel.dto.PlanReplyVO;

public interface PlanReplyDAO {
	public void insertPlanReply(PlanReplyVO planReplyVO);
	public String count(String planMainNum);
	public List<PlanReplyVO> planReplyList(String planMainNum,  int start, int end);
}