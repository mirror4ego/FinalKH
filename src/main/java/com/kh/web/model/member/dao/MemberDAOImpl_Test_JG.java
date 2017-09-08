package com.kh.web.model.member.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.web.model.member.dto.MemberVo_Test_JG;

@Repository
public class MemberDAOImpl_Test_JG implements MemberDAO_Test_JG{
	// SqlSession 객체를 스프링에서 생성하여 주입시켜준다.
    // 의존관계 주입(Dependency Injection, DI)
    // 느스한 결함
    // IoC(Inversion of Control, 제어의 역전)
    @Inject
    // Inject애노테이션이 없으면 sqlSession은 null상태이지만
    // Inject애노테이션이 있으면 외부에서 객체를 주입시켜주게 된다. 
    // try catch문, finally문, 객체를 close할 필요가 없어졌다.
    SqlSession sqlSession;
    
    // 회원목록
    @Override
    public List<MemberVo_Test_JG> memberList() {
        return sqlSession.selectList("member.memberList2");
        
    }
    
    
    // 회원가입
    @Override
    public void insertMember_test(MemberVo_Test_JG vot) {
    	sqlSession.insert("member.insertMember2", vot);
    }
    // 01_01. 회원 로그인체크
    @Override
    public String loginCheck_test(MemberVo_Test_JG vot) {
        return sqlSession.selectOne("member.loginCheck2", vot);
    }
    // 01_02. 회원 로그인 정보
    @Override
    public MemberVo_Test_JG viewMember_test(MemberVo_Test_JG vot) {
        return sqlSession.selectOne("member.viewMember3", vot);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout_test(HttpSession sessin) {
    }
 
    @Override
    public void deleteMember_test(String email) {
        // TODO Auto-generated method stub
 
    }
 
    @Override
    public void updateMember_test(MemberVo_Test_JG vot) {
        // TODO Auto-generated method stub
 
    }
    
    @Override
    public String insertCheck(String email) {
        // TODO Auto-generated method stub
    	System.out.println(sqlSession.selectOne("member.insertCheck", email).toString());
    	return sqlSession.selectOne("member.insertCheck", email);
    } 
    
}
