package com.kh.web.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.web.model.member.dto.MemberVo_Test_JG;


public interface MemberService2 {
	// 회원 목록 
    public List<MemberVo_Test_JG> memberList();
    // 회원 입력
    public void insertMember_test(MemberVo_Test_JG vot);
    // 회원 삭제
    public void deleteMember_test(String email);
    // 회원정보 수정
    public void updateMember_test(MemberVo_Test_JG vot);
 // 01_01. 회원 로그인 체크
    public boolean loginCheck_test(MemberVo_Test_JG vot, HttpSession session);
    // 01_02. 회원 로그인 정보
    public MemberVo_Test_JG viewMember_test(MemberVo_Test_JG vot);
    // 02. 회원 로그아웃
    public void logout_test(HttpSession session);
    // 회원 가입 이메일 중복 체크
    public String insertCheck(String email);
}
