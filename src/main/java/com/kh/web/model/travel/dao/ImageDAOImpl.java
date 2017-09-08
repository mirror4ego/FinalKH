package com.kh.web.model.travel.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.web.model.travel.dto.ImageVO;

@Repository
public class ImageDAOImpl implements ImageDAO{
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
    public List<ImageVO> imageList() {
    	
        return sqlSession.selectList("travel.selectImage");
        
    }
    
    
 
   
}
