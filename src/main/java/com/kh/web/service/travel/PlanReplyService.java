package com.kh.web.service.travel;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.web.model.travel.dto.PlanReplyVO;

public interface PlanReplyService {
	public void insertPlanReply(PlanReplyVO planReplyVO);

	public String count(String planMainNum);

	public List<PlanReplyVO> planReplyList(String planReplyNum, int start, int end, HttpSession session);
}
