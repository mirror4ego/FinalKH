package com.kh.web.service.admin;

import com.kh.web.model.member.dto.MemberVO;

public interface AdminService {
	// 관리자 로그인체크
	public String loginCheck(MemberVO vo);
}
