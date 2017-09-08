package com.kh.web.service.travel;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.web.model.travel.dao.PlanReplyDAO;
import com.kh.web.model.travel.dto.PlanReplyVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class PlanReplyServiceImpl implements PlanReplyService {

	@Inject
	PlanReplyDAO planReplyDAO;


	@Override
	public void insertPlanReply(PlanReplyVO planReplyVO) {
		planReplyDAO.insertPlanReply(planReplyVO);
	}
	
	@Override
	public String count(String planMainNum) {
		return planReplyDAO.count(planMainNum);
	}
	
	@Override
	public List<PlanReplyVO> planReplyList(String planReplyNum, int start, int end, HttpSession session) {
		System.out.println(planReplyNum);
		System.out.println(start);
		System.out.println(end);
		System.out.println(session);
		List<PlanReplyVO> PlanReplyVOList = planReplyDAO.planReplyList(planReplyNum, start, end);
		System.out.println(session);
		// 세션에서 현재 사용자 id값 저장
		String email = (String) session.getAttribute("email");
		for(PlanReplyVO vo : PlanReplyVOList){
			// 댓글 목록중에 중에 비밀 댓글이 있을 경우
			if(vo.getSecretReply().equals("1")){
				if(email== null){ // 비로그인 상태면 비밀 댓글로 처리
					vo.setContent("비밀 댓글입니다.");
				} else { // 로그인 상태일 경우
					vo.getEmail();
					// 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리
					if(!email.equals(email)) { // !email.equals(writer) && !email.equals(email)
						vo.setContent("비밀 댓글입니다.");
					}
				}
			}
		}
		return PlanReplyVOList; 
	}

	


}
