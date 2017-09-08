package com.kh.web.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.web.model.member.dao.MemberDAO;
import com.kh.web.model.member.dto.MemberVO;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Inject
	MemberDAO memberDao;
	
/*	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if (result) { // true일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo);
			// 세션 변수 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		} 
		return result;
	}*/
	
	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		String rawPassword = vo.getUserPw(); // 사용자가 로그인하기 위해 입력한 기본 패스워드
		String encodedPassword = memberDao.loginCheck(vo);// DB에서 암호화된 패스워드를 불러옴
		boolean result = rawPassword.equals(encodedPassword);
		if (result) { // true일 경우 세션에 등록
			MemberVO vo2 = viewMember(vo);
			// 세션 변수 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		} 
		return result;
	}
	// 01_02. 회원 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewMember(vo);
	}
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
    // 03. 회원 목록 
    @Override
    public List<MemberVO> memberList() {
        return memberDao.memberList();
    }
    // 04. 회원 입력
    @Override
    public void insertMember(MemberVO vo) {
    	memberDao.insertMember(vo);
    }
    // 05. 회원 정보 상세보기
    @Override
    public MemberVO viewMember2(String userId) {
    	return memberDao.viewMember2(userId);
    }
    // 06. 회원정보 수정
    @Override
    public void updateMember(MemberVO vo) {
    	memberDao.updateMember(vo);
    }
    // 07. 회원삭제
    @Override
    public void deleteMember(String userId) {
        memberDao.deleteMember(userId);
    }
    // 08. 회원 정보 수정 및 삭제를 위한 비밀번호 체크
    @Override
    public boolean checkPw(String userId, String userPw) {
        return memberDao.checkPw(userId, userPw);
    }
    

	
}
