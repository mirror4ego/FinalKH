package com.kh.web.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.web.model.member.dao.MemberDAOImpl_Test_JG;
import com.kh.web.model.member.dto.MemberVo_Test_JG;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberServiceImpl2 implements MemberService2{
	// MemberDAOImpl 객체를 스프링에서 생성하여 주입시킴
    @Inject
    MemberDAOImpl_Test_JG memberDao_test;
    
    @Autowired
	BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public List<MemberVo_Test_JG> memberList() {
        return memberDao_test.memberList();
    }
    
    // 회원 가입 이메일 중복 체크
    @Override
    public String insertCheck(String email) {
    	System.out.println(memberDao_test.insertCheck(email).toString());
    	return memberDao_test.insertCheck(email);
    }
    // 회원 가입 
    @Override
    public void insertMember_test(MemberVo_Test_JG vot) {
    
    	memberDao_test.insertMember_test(vot);
    }
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck_test(MemberVo_Test_JG vot, HttpSession session) {
    	String rawPassword = vot.getPassword(); // 사용자가 로그인하기 위해 입력한 기본 패스워드
		String encodedPassword = memberDao_test.loginCheck_test(vot);// DB에서 암호화된 패스워드를 불러옴
		boolean result = passwordEncoder.matches(rawPassword, encodedPassword);
        if (result) { // true일 경우 세션에 등록
        	MemberVo_Test_JG vot2 = viewMember_test(vot);
            // 세션 변수 등록
            session.setAttribute("email", vot2.getEmail());
            session.setAttribute("userid", vot2.getUserid());
            session.setAttribute("gradename", vot2.getGradename());
        }else{
        	return result;
        }
        return result;
    }
    
    // 02. 회원 로그아웃
    @Override
    public void logout_test(HttpSession session) {
        // 세션 변수 개별 삭제
        // session.removeAttribute("userId");
        // 세션 정보를 초기화 시킴
        session.invalidate();
    }
 
    @Override
    public void deleteMember_test(String email) {
        
    }
 
    @Override
    public void updateMember_test(MemberVo_Test_JG vot) {
        
    }

	@Override
	public MemberVo_Test_JG viewMember_test(MemberVo_Test_JG vot) {
		// TODO Auto-generated method stub
		return memberDao_test.viewMember_test(vot);
	}
    
}
