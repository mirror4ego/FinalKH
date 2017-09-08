package com.kh.web.service.travel; 
  
import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.web.model.travel.dto.ReviewVO; 
  
public interface ReviewService {
	// 후기 작성
	public void create(ReviewVO vo) throws Exception;
	// 후기보기
	public ReviewVO read(int boardnum) throws Exception;
	//  게시글 전체 목록
	public List< ReviewVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	// 조회증가
	public void increaseViewcnt(int boardnum, HttpSession session) throws Exception;
	// 후기 수정
	public void update(ReviewVO vo) throws Exception;
	// 후기 삭제
	public void delete(int boardnum) throws Exception;
	// 추천
}