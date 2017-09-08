package com.kh.web.controller.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.web.model.member.dto.MemberVO;
import com.kh.web.model.member.dto.MypageVO;
import com.kh.web.model.travel.dto.PlanMainVO;
import com.kh.web.service.member.MypageService;

@Controller // �쁽�옱 �겢�옒�뒪瑜� �뒪�봽留곸뿉�꽌 愿�由ы븯�뒗 而⑦듃濡ㅻ윭 bean�쑝濡� �깮�꽦
@RequestMapping("/member/*") // 紐⑤뱺留듯븨�� /member/瑜� �긽�냽
public class MypageController {

   @Autowired

   @Inject
   MypageService mypageService;
	
	
   @RequestMapping("mypageMain.do")
	public String mypageMain(Model model, String id){
		MypageVO mVo = new MypageVO();
		List<MypageVO> Travellist = mypageService.selectAllTravel(id);
		model.addAttribute("Travellist", Travellist);
		mVo.setId("id");
		mVo.setTravel_name("travel_name");
		String userid = id;
		model.addAttribute("id", userid);
		return "member/mypage_main";	
	}
   @RequestMapping("travelWrite.do")
 	public String travelWrite(String id, Model model){

 		String userid = id;
 		model.addAttribute("id", userid);
 		List<PlanMainVO> travelnamelist = mypageService.selectAllTravelname(id);
 		model.addAttribute("travelnamelist", travelnamelist);
 		return "member/travelWrite";
 	}
    @RequestMapping("travelInsert.do")
 	public String travelInsert( MypageVO mVo, Model model,String id, String travel_name){
 	   String userid = id;
 		model.addAttribute("id", userid);
 		model.addAttribute("travel_name", travel_name);

 	    mypageService.insertTravel(id, travel_name);
 	    return "member/mypage_chartinsert";
    }   
    @RequestMapping("travelDelete.do")
   	public String travelDelete(HttpServletRequest req, MypageVO mVo,String id, String travel_name,Model model){
   		id = mVo.getId();
   		travel_name = mVo.getTravel_name();
   		
   		model.addAttribute("id", id);
   		model.addAttribute("travel_name", travel_name);
   		
   		mypageService.deleteTravel(id, travel_name);
   	     return "redirect:/member/mypageMain.do"; 
   	}
    @RequestMapping("chartInsert.do")
 	public String chartInsert( MypageVO mVo, Model model,String id, String travel_name, HttpServletRequest request){
 	   String userid = request.getParameter(id);
 		model.addAttribute("id", userid);
 		model.addAttribute("travel_name", travel_name);

 		System.out.println("id="+id);
 		int flight = Integer.parseInt(request.getParameter("flight"));
 		int transfer = Integer.parseInt(request.getParameter("transfer"));
 		int hotel = Integer.parseInt(request.getParameter("hotel"));
 		int tour = Integer.parseInt(request.getParameter("tour"));
 		int meal = Integer.parseInt(request.getParameter("meal"));
 		mVo.setId(id);
 		mVo.setTravel_name(travel_name);
 		mVo.setFlight(flight);
 		mVo.setTransfer(transfer);
 		mVo.setHotel(hotel);
 		mVo.setTour(tour);
 		mVo.setMeal(meal);
 		System.out.println(travel_name);
 	    mypageService.insertChart(mVo);
 	    return "redirect:/member/mypageJourney.do?id="+id;
   }
    @RequestMapping(value="chartUpdate.do", method= RequestMethod.GET)
   	public String chartUpdate(Model model,String id, String travel_name, HttpServletRequest request){
       	
       	model.addAttribute("chart", mypageService.getChart(id, travel_name));
   		return "member/mypage_updateChart";	
   	}
       @RequestMapping(value="chartUpdate.do", method= RequestMethod.POST)
   	public String chartUpdate(MypageVO mVo, Model model,String id, String travel_name, HttpServletRequest request){
       	String userid = id;
   		model.addAttribute("id", userid);
   		String travelname = travel_name;
   		model.addAttribute("travel_name", travelname);
       	int flight = Integer.parseInt(request.getParameter("flight"));
    		int transfer = Integer.parseInt(request.getParameter("transfer"));
    		int hotel = Integer.parseInt(request.getParameter("hotel"));
    		int tour = Integer.parseInt(request.getParameter("tour"));
    		int meal = Integer.parseInt(request.getParameter("meal"));
    		mVo.setFlight(flight);
    		mVo.setTransfer(transfer);
    		mVo.setHotel(hotel);
    		mVo.setTour(tour);
    		mVo.setMeal(meal);
       	mypageService.updateChart(mVo);
   		return "redirect:/member/mypageJourney.do";	
   	}
	@RequestMapping("mypageJourney.do")
	public String mypageJourney(String id, String travel_name, Model model){
		model.addAttribute("chart", mypageService.getChart(id,travel_name));
		model.addAttribute("cal", mypageService.selectAllCal(id, travel_name));
		String userid = id;
		model.addAttribute("id", userid);
		String travelname = travel_name;
		model.addAttribute("travel_name", travelname);
		return "member/mypage_journey";	
	}

	@RequestMapping("mypageUpdatemember.do")
	public String mypageUpdatemember(){
		return "member/mypage_updatemember";	
	}
	
	@RequestMapping("album.do")
	public String album(String id, String travel_name, Model model){
		List<MypageVO> Albumlist =mypageService.selectAllAlbum(id, travel_name);
		model.addAttribute("Albumlist", Albumlist);
		String userid = id;
		model.addAttribute("id", userid);
		String travelname = travel_name;
		model.addAttribute("travel_name", travelname);
		return "member/mypage_album";
	}
	@RequestMapping("albumWrite.do")
	public String albumWrite(String id, String travel_name, Model model){

		String userid = id;
		model.addAttribute("id", userid);
		String travelname = travel_name;
		model.addAttribute("travel_name", travelname);
		return "member/mypage_albumWrite";
	}
	@RequestMapping(value="albumInsert.do",method=RequestMethod.GET)
	public ModelAndView albumInsert(){
		ModelAndView mv = new ModelAndView();
        mv.setViewName("member/mypage_album");
        return mv;
	}
	@RequestMapping(value="albumInsert.do", method=RequestMethod.POST)
	public String albumInTsert(@ModelAttribute MypageVO mVo,Model model,String id, String travel_name){
		
		
		
		String userid = id;
		model.addAttribute("id", userid);
		String travelname = travel_name;
		model.addAttribute("travel_name", travelname);

		
		 MultipartFile uploadfile = mVo.getUploadfile();
	        if (uploadfile != null) {
	            String fileName = uploadfile.getOriginalFilename();
	            
	            try {
	                // 1. FileOutputStream 사용
	                // byte[] fileData = file.getBytes();
	                // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
	                // output.write(fileData);
	                 
	                // 2. File 사용
	                File file = new File("C:/Users/mirro/Documents/Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FinalKH/WEB-INF/views/images/mypage/" + fileName);
	                uploadfile.transferTo(file);
	                mVo.setAlbumpath(fileName);
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	            } // try - catch
	        } // if
	        // 데이터 베이스 처리를 현재 위치에서 처리
	        mypageService.insertAlbum(mVo);
	 /*       return "redirect:getBoardList.do"; // 리스트 요청으로 보내야하는데 일단 제외하고 구
*/

	     return "redirect:/member/album.do?id={id}&travel_name={travel_name}"; 
	}
	@RequestMapping("albumDelete.do")
	public String albumDelete(HttpServletRequest req, MypageVO mVo,String id, String travel_name,Model model,String albumpath){
		id = mVo.getId();
		travel_name = mVo.getTravel_name();
		
		model.addAttribute("id", id);
		model.addAttribute("travel_name", travel_name);
		/*String albumpath=req.getParameter(albumpath);*/
		mVo.setAlbumpath(albumpath);
		/*String albumpath = mVo.getAlbumpath();*/
		mypageService.deleteAlbum(albumpath);
	    return "redirect:/member/album.do?id={id}&travel_name={travel_name}"; 
	}
	@RequestMapping("albumSlide.do")
	public String albumSlide(Model model,String id, String travel_name){
		List<MypageVO> Albumlist =mypageService.selectAllAlbum(id,travel_name);
		model.addAttribute("Albumlist", Albumlist);
		return "member/mypage_albumslide";
	}
	@RequestMapping(value="mypageUpdatemember.do", method=RequestMethod.GET)
	public String mypageUpdatemember(MypageVO mVo,String id, Model model){
		mVo.setId(id);
		model.addAttribute("member" , mypageService.getMember(id));
		return "member/mypage_updatemember";	
	}
	 @RequestMapping(value="mypageUpdatemember.do", method= RequestMethod.POST)
		public String mypageUpdatemember(MemberVO mmVo, Model model,String userEmail, HttpServletRequest request){
	       	String useremail= userEmail;
	   		model.addAttribute("userEmail", useremail);
	       	String userPw= request.getParameter("pwd");
	       	String userId =request.getParameter("userid");
	        String userEmail1 = request.getParameter("email");
	       	mmVo.setUserId(userId);
	       	mmVo.setUserPw(userPw);
	       	mmVo.setUserEmail(userEmail1);

	       	mypageService.updateMember(mmVo);
	   		return "redirect:/member/mypageMain.do?id="+userEmail1;
	 }


	

}
	
