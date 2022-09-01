package com.romance.user.event;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.romance.server.AwsS3;





@Controller
@SessionAttributes("event_event")
public class EventController {
    @Autowired
    private EventService eventService;

//    @RequestMapping("/dataTransform.do")
//    @ResponseBody
//    public BoardListVO dataTransform(BoardVO vo) {
//        vo.setSearchCondition("TITLE");
//        vo.setSearchKeyword("");
//        List<BoardVO> boardList = boardService.getBoardList(vo);
//        BoardListVO boardListVO = new BoardListVO();
//        boardListVO.setBoardList(boardList);
//        return boardListVO;
//    }

//    @ModelAttribute("conditionMap")
//    public Map<String, String> searchConditionMap() {
//        Map<String, String> conditionMap = new HashMap<String, String>();
//        conditionMap.put("제목", "TITLE");
//        conditionMap.put("내용", "CONTENT");
//        return conditionMap;
//    }
	@RequestMapping("moveInsert.mdo")
	public String moveInsert(EventVO vo, Model model) {
		model.addAttribute("top_check", eventService.topCheck(vo));
		return "admin_marketing_EventInsert";
	}
    
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
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
		      String uploadFolder = "https://testmanbuc.s3.ap-northeast-2.amazonaws.com/";  
		      vo.setEvent_thumbnail(uploadFolder+key);
		}
		eventService.updateEvent(vo);
		System.out.println(vo);
		return "redirect:getEventList.mdo";
	}

	@RequestMapping("/deleteEvent.mdo")
	public String deleteEvent(EventVO vo) {
		System.out.println("글 삭제 처리");
		eventService.deleteEvent(vo);
		return "redirect:getEventList.do";
	}

	@RequestMapping("/getEvent.do")
	public String getEvent(EventVO vo, Model model, @RequestParam("seq")int seq) {
		System.out.println("글 상세 보기 처리");
		eventService.countCnt(seq);
		model.addAttribute("event_event", eventService.getEvent(vo));
		return "getEvent";
	}
	
	@RequestMapping("/getEvent.mdo")
	public String getAdminEvent(EventVO vo, Model model, @RequestParam("event_seq")int seq) {
		System.out.println("글 상세 보기 처리");
		model.addAttribute("event_event", eventService.getEvent(vo));
		return "admin_marketing_EventUpdate";
	}

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

	@RequestMapping(value="/ajax_list.mdo", method=RequestMethod.POST)
	@ResponseBody
	public List<String> ajaxList(@RequestParam(value="event_seq[]", required=false)List<String> event_seq) {
		System.out.println(event_seq);
		eventService.topEvent(event_seq);
		return event_seq;
	}
	
	@RequestMapping(value="/ajax_del.mdo", method=RequestMethod.POST)
	@ResponseBody
	public int ajaxDel(@RequestParam(value="del", required=false)int del) {
		System.out.println(del);
		eventService.ajaxDel(del);
		return del;
	}
	
}
