package com.kh.web.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.web.model.member.dto.MemberVo_Test_JG;
import com.kh.web.service.member.MemberService2;

@Controller // �쁽�옱 �겢�옒�뒪瑜� �뒪�봽留곸뿉�꽌 愿�由ы븯�뒗 而⑦듃濡ㅻ윭 bean�쑝濡� �깮�꽦
@RequestMapping("/member/*") // 紐⑤뱺留듯븨�� /member/瑜� �긽�냽
public class MemberController2 {
	// 濡쒓퉭�쓣 �쐞�븳 蹂��닔
	private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Inject
	MemberService2 memberService2;
	
	// 01 �쉶�썝 紐⑸줉
    // url pattern mapping
    @RequestMapping("list.do")
    public String memberList(Model model){
    // controller => service => dao �슂泥�
        List<MemberVo_Test_JG> list = memberService2.memberList();
        model.addAttribute("list", list);
        return "member/member_list";
    }
 // 02_01 �쉶�썝 �벑濡� �럹�씠吏�濡� �씠�룞
    @RequestMapping("member/write.do")
    public String memberWrite(){
        
        return "member/member_write";
    }
    
    // Email 以묐났 泥댄겕 AJAX
    @ResponseBody
    @RequestMapping("overlap.do")
    public String insertMember(@RequestParam String email){
    	String chkValue =  memberService2.insertCheck(email);
    	logger.info(email);
    	logger.info(chkValue);
    	if(chkValue.equals("1")){
    		logger.info("1�떎�뻾");
    		return "1";
    	}else{
    		logger.info("0�떎�뻾");
    		return "0";
    	}
    	
    	
    	
    }
    
    // 02_02 �쉶�썝 �벑濡� 泥섎━ �썑 ==> �쉶�썝紐⑸줉�쑝濡� 由щ떎�씠�젆�듃
    // @ModelAttribute�뿉 �뤌�뿉�꽌 �엯�젰�븳 �뜲�씠�꽣媛� ���옣�맂�떎.
    @RequestMapping("member/insert.do")
    // * �뤌�뿉�꽌 �엯�젰�븳 �뜲�씠�꽣瑜� 諛쏆븘�삤�뒗 踰� 3媛�吏� 
    //public String memberInsert(HttpServlet request){
    //public String memberInsert(String Email, String Password, String userId){
    public String memberInsert(@ModelAttribute MemberVo_Test_JG vot, HttpSession session){
    	// �뀒�씠釉붿뿉 �젅肄붾뱶 �엯�젰
    	String Password = vot.getPassword();
    	String encryptPassword = passwordEncoder.encode(vot.getPassword());
    	logger.info(encryptPassword);
    	vot.setPassword(encryptPassword);
    	
        memberService2.insertMember_test(vot);
        
        vot.setPassword(Password);
        
        memberService2.loginCheck_test(vot, session);
        // * (/)�쓽 �쑀臾댁뿉 李⑥씠
        // /member/list.do : 猷⑦듃 �뵒�젆�넗由щ�� 湲곗�
        // member/list.do : �쁽�옱 �뵒�젆�넗由щ�� 湲곗�
        // member_list.jsp濡� 由щ떎�씠�젆�듃
        return "redirect:/";
    }
    
    // 02. 濡쒓렇�씤 泥섎━
    @RequestMapping("loginCheck_test.do")
    public String loginCheck_test(@ModelAttribute MemberVo_Test_JG vot, HttpSession session){
        memberService2.loginCheck_test(vot, session);

        return "redirect:/";
    }
    
    // 03. 濡쒓렇�븘�썐 泥섎━
    @RequestMapping("logout_test.do")
    public String logout_test(HttpSession session){
        memberService2.logout_test(session);

        return "redirect:/";
    }
}
