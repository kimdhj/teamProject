package com.romance.user.event;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;




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
	
	@RequestMapping(value = "insertEvent.mdo", method = RequestMethod.POST)
	public String insertEvent(@RequestParam(name="uploadFile1") MultipartFile uploadFile1, @RequestParam(name="uploadFile2") MultipartFile uploadFile2, @RequestParam(name="uploadFile3") MultipartFile uploadFile3, @RequestParam(name="uploadFile4") MultipartFile uploadFile4, @RequestParam(name="uploadThumbnail") MultipartFile uploadThumbnail, EventVO vo) throws IOException {
		System.out.println("글 등록 처리");
		System.out.println(vo);
		if (!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			uploadFile1.transferTo(new File("C:/myProject/" + fileName));
			vo.setEvent_file1(fileName);
		}
		if (!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			uploadFile2.transferTo(new File("C:/myProject/" + fileName));
			vo.setEvent_file2(fileName);
		}
		if (!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			uploadFile3.transferTo(new File("C:/myProject/" + fileName));
			vo.setEvent_file3(fileName);
		}
		if (!uploadFile4.isEmpty()) {
			String fileName = uploadFile4.getOriginalFilename();
			uploadFile4.transferTo(new File("C:/myProject/" + fileName));
			vo.setEvent_file4(fileName);
		}
		if (!uploadThumbnail.isEmpty()) {
			String fileName = uploadThumbnail.getOriginalFilename();
			uploadThumbnail.transferTo(new File("C:/myProject/" + fileName));
			vo.setEvent_thumbnail(fileName);
		}
		
		eventService.insertEvent(vo);
		return "redirect:getEventList.do";
	}

	@RequestMapping("/updateEvent.do")
	public String updateEvent(@ModelAttribute("event_event") EventVO vo) {
		System.out.println("글 수정 기능 처리");
		eventService.updateEvent(vo);
		return "redirect:getEventList.do";
	}

	@RequestMapping("/deleteEvent.do")
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
		
		System.out.println(eventService.getEventListTop(vo));
		System.out.println(model);
		return "event_List";
	}
}