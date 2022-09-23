package com.romance.user.event;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;
import com.romance.security.JwtUtils;
import com.romance.server.AwsS3;
import com.romance.user.login.UserVO;
import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsService;
import com.romance.user.points.MyPointsVO;


@Controller
@SessionAttributes("event_event")
public class EventController {
    @Autowired
    private EventService eventService;
    @Autowired
    private SubscribeService subscribeService;
    @Autowired
    private MyPointsService myPointsService;

    //룰렛 날짜 체크
    @RequestMapping(value="/confirmdate.do", method=RequestMethod.POST)
    @ResponseBody
    public int confirmdate(JwtUtils util, HttpSession session, MyPointsSearchVO my) throws IOException {
    	UserVO userVO = util.getuser(session);
    	String iiid = userVO.getUser_id();
    	LocalDateTime now = LocalDateTime.now();
    	String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    	
    	my.setPoints_date(formatedNow);
    	my.setUser_id(iiid);
    	
    	return eventService.confirmdate(my);
    }
    
    //룰렛 로그인 체크
    @RequestMapping(value="/confirmyou.do", method=RequestMethod.POST)
    @ResponseBody
    public String confirmyou(JwtUtils util, HttpSession session, UserVO vo) throws IOException {
    	UserVO userVO = util.getuser(session);
    	if(userVO !=null) {
    	return userVO.getUser_id();
    	}else {
    		return null;
    	}
    }
    
    
    //룰렛 포인트 에이잭스
    @RequestMapping(value="/getPoint.do", method = RequestMethod.POST)
    @ResponseBody
    public String getPoint(JwtUtils util, HttpSession session, MyPointsVO vo) throws IOException {
    	
    	UserVO userVO = util.getuser(session);
    	String iiiid = null;
		if(userVO != null) {
			iiiid = userVO.getUser_id();
		}
		vo.setUser_id(iiiid);
		int popoint = vo.getPoints_count();
		int pointnt = userVO.getUser_point();
		System.out.println(popoint);
		System.out.println(pointnt);
		userVO.setUser_point(popoint+pointnt);
		myPointsService.createPoints(vo);
		myPointsService.addPoint(userVO);  
		
		userVO = myPointsService.renew(userVO);
		
		String token = util.createToken("user", userVO);
		session.setAttribute("id", token);
    	
    	return null;
    }
    
	@RequestMapping("moveInsert.mdo")
	public String moveInsert(EventVO vo, Model model) {
		model.addAttribute("top_check", eventService.topCheck(vo));
		return "admin_marketing_EventInsert";
	}
    
	//insert페이지에서 insert 수행
	@RequestMapping(value = "insertEvent.mdo", method = RequestMethod.POST)
	public String insertEvent(@RequestParam(name="uploadFile1") MultipartFile uploadFile1, @RequestParam(name="uploadFile2") MultipartFile uploadFile2, @RequestParam(name="uploadFile3") MultipartFile uploadFile3, @RequestParam(name="uploadFile4") MultipartFile uploadFile4, @RequestParam(name="uploadThumbnail") MultipartFile uploadThumbnail, EventVO vo) throws IOException {
		System.out.println("글 등록 처리");
		System.out.println(vo);
		if (!uploadFile1.isEmpty()) {
			String filename=uploadFile1.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile1.getInputStream();
		      String contentType = uploadFile1.getContentType();
		      long contentLength = uploadFile1.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file1(uploadFolder+key);
		}
		if (!uploadFile2.isEmpty()) {
			 String filename=uploadFile2.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile2.getInputStream();
		      String contentType = uploadFile2.getContentType();
		      long contentLength = uploadFile2.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file2(uploadFolder+key);
		}
		if (!uploadFile3.isEmpty()) {
			 String filename=uploadFile3.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile3.getInputStream();
		      String contentType = uploadFile3.getContentType();
		      long contentLength = uploadFile3.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file3(uploadFolder+key);
		}
		if (!uploadFile4.isEmpty()) {
			 String filename=uploadFile4.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile4.getInputStream();
		      String contentType = uploadFile4.getContentType();
		      long contentLength = uploadFile4.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file4(uploadFolder+key);
		}
		if (!uploadThumbnail.isEmpty()) {
			 String filename=uploadThumbnail.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadThumbnail.getInputStream();
		      String contentType = uploadThumbnail.getContentType();
		      long contentLength = uploadThumbnail.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_thumbnail(uploadFolder+key);
		}
		
		eventService.insertEvent(vo);
		return "redirect:getEventList.mdo";
	}

	
	@RequestMapping(value="/updateEvent.mdo", method = RequestMethod.POST)
	public String updateEvent(@RequestParam(name="uploadFile1") MultipartFile uploadFile1, @RequestParam(name="uploadFile2") MultipartFile uploadFile2, @RequestParam(name="uploadFile3") MultipartFile uploadFile3, @RequestParam(name="uploadFile4") MultipartFile uploadFile4, @RequestParam(name="uploadThumbnail") MultipartFile uploadThumbnail, EventVO vo) throws IllegalStateException, IOException {
		System.out.println("글 수정 기능 처리");
		if (!uploadFile1.isEmpty()) {
			String filename=uploadFile1.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile1.getInputStream();
		      String contentType = uploadFile1.getContentType();
		      long contentLength = uploadFile1.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file1(uploadFolder+key);
		}
		if (!uploadFile2.isEmpty()) {
			 String filename=uploadFile2.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile2.getInputStream();
		      String contentType = uploadFile2.getContentType();
		      long contentLength = uploadFile2.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file2(uploadFolder+key);
		}
		if (!uploadFile3.isEmpty()) {
			 String filename=uploadFile3.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile3.getInputStream();
		      String contentType = uploadFile3.getContentType();
		      long contentLength = uploadFile3.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file3(uploadFolder+key);
		}
		if (!uploadFile4.isEmpty()) {
			 String filename=uploadFile4.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadFile4.getInputStream();
		      String contentType = uploadFile4.getContentType();
		      long contentLength = uploadFile4.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_file4(uploadFolder+key);
		}
		if (!uploadThumbnail.isEmpty()) {
			 String filename=uploadThumbnail.getOriginalFilename();
		      String expand=filename.substring(filename.indexOf("."));
		      String key=UUID.randomUUID().toString()+expand;
		      System.out.println(key+" :key");
		      InputStream is = uploadThumbnail.getInputStream();
		      String contentType = uploadThumbnail.getContentType();
		      long contentLength = uploadThumbnail.getSize(); 
		      AwsS3 awsS3 = AwsS3.getInstance();
		      awsS3.upload(is, key, contentType, contentLength);
		      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_thumbnail(uploadFolder+key);
		}
		eventService.updateEvent(vo);
		System.out.println(vo);
		return "redirect:getEventList.mdo";
	}

	
	//삭제!
	@RequestMapping("/deleteEvent.mdo")
	public String deleteEvent(EventVO vo) {
		System.out.println("글 삭제 처리");
		eventService.deleteEvent(vo);
		return "redirect:getEventList.do";
	}

	//유저가 이벤트 상세보기
	@RequestMapping("/getEvent.do")
	public String getEvent(EventVO vo, Model model, @RequestParam("event_seq")int seq) {
		System.out.println("글 상세 보기 처리");
		eventService.countCnt(seq);
		model.addAttribute("event_event", eventService.getEvent(vo));
		return "event_Detail";
	}
	
	//관리자가 이벤트 상세보기
	@RequestMapping("/getEvent.mdo")
	public String getAdminEvent(EventVO vo, Model model, @RequestParam("event_seq")int seq) {
		System.out.println("글 상세 보기 처리");
		model.addAttribute("event_event", eventService.getEvent(vo));
		return "admin_marketing_EventUpdate";
	}

	//유저 이벤트 리스트 보기
	@RequestMapping("/getEventList.do")
	public String getEventList(EventVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		// null 체크
//		if (vo.getSearchCondition() == null)
//			vo.setSearchCondition("TITLE");
//		if (vo.getSearchKeyword() == null)
//			vo.setSearchKeyword("");
		model.addAttribute("top_eventList", eventService.getEventListTop(vo));
		model.addAttribute("bottom_eventList", eventService.getEventListBottom(vo));		

		return "event_List";
	}
	
	//관리자 이벤트 리스트 보기
	@RequestMapping("/getEventList.mdo")
	public String getAdminEventList(EventVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		// null 체크
//		if (vo.getSearchCondition() == null)
//			vo.setSearchCondition("TITLE");
//		if (vo.getSearchKeyword() == null)
//			vo.setSearchKeyword("");
		model.addAttribute("top_eventList", eventService.getEventListTop(vo));
		model.addAttribute("bottom_eventList", eventService.getEventListBottom(vo));		

		return "admin_marketing_EventList";
	}

	//
	@RequestMapping(value="/ajax_list.mdo", method=RequestMethod.POST)
	@ResponseBody
	public List<String> ajaxList(@RequestParam(value="event_seq[]", required=false)List<String> event_seq) {
		System.out.println(event_seq);
		eventService.topEvent(event_seq);
		return event_seq;
	}
	
	@RequestMapping(value="/ajax_ref1.mdo", method=RequestMethod.POST)
	@ResponseBody
	public List<EventVO> ajaxRef1(EventVO vo) {
		return eventService.getEventListTop(vo);
	}
	@RequestMapping(value="/ajax_ref2.mdo", method=RequestMethod.POST)
	@ResponseBody
	public List<EventVO> ajaxRef2(EventVO vo) {
		return eventService.getEventListBottom(vo);
	}
	
	@RequestMapping(value="/ajax_del.mdo", method=RequestMethod.POST)
	@ResponseBody
	public int ajaxDel(@RequestParam(value="del", required=false)int del) throws FileNotFoundException, IOException {
		System.out.println(del);
		eventService.ajaxDel(del);
		return del;
	}
	
	@RequestMapping("/event_Roulette.do")
	public String goRoulette(EventVO vo, Model model){
		eventService.countCnt(vo.getEvent_seq());
		model.addAttribute("event_event", eventService.getEvent(vo));
	return "event_Roulette";
	}
	
	@RequestMapping("/event_Sub.do")
	public String goSub(EventVO vo, Model model, SubscribeVO svo){
		eventService.countCnt(vo.getEvent_seq());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("event_event", eventService.getEvent(vo));
		return "event_Subscribe";
	}
	
	
	
	
}
