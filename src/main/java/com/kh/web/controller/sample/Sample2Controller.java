package com.kh.web.controller.sample;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.web.model.shop.dto.ProductVO;
 
// ajax 처리 전용 컨트롤러(백그라운드 실행)
@RestController // 스프링 4.0이상부터 사용가능
@RequestMapping("/sample/*")
public class Sample2Controller {
	
    private static final Logger logger = LoggerFactory.getLogger(Sample2Controller.class);
	
    //@ResponseBody : json형식으로 데이터를 리턴
    @ResponseBody
    @RequestMapping("doF")
    public ProductVO doF(){
        // doF.jsp로 json 데이터가 리턴
    	logger.info("doF.jsp로 json 데이터가 리턴");
        return new ProductVO("스마트폰", 990000);
    }
}
