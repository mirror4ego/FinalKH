package com.kh.web.model.admin;

import com.kh.web.model.member.dto.MemberVO;

public interface AdminDAO {
	// 관리자 로그인체크
	public String loginCheck(MemberVO vo);
}
