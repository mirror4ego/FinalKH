package com.kh.web.model.travel.dao;

import java.util.List;

import com.kh.web.model.travel.dto.ReviewVO;

public interface ReviewDAO {
	//후기 작성
	public void create(ReviewVO vo) throws Exception;
	//후기 보기
	public ReviewVO read(int boardnum ) throws Exception; 
	//글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ReviewVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	//조회수
	public void increaseViewcnt(int boardnum) throws Exception;
	// 후기 수정
	public void update(ReviewVO vo) throws Exception;
	// 후기 삭제
	public void delete(int boardnum) throws Exception;
}