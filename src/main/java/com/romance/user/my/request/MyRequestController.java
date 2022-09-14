package com.romance.user.my.request;


import java.io.IOException;
import java.util.List;

import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class MyRequestController {
	
	@Autowired
	private MyRequestService myRequestService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "ASK_TITLE");
		
		return conditionMap;
	}
	
	@GetMapping("myRequestList.do")
	public String myRequestList(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws IOException  {

		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			criteria.setSession_user_id(voToken.getUser_id());
			System.out.println(criteria.getSession_user_id());
			if(criteria.getSearchCondition() == null) {
				criteria.setSearchCondition("ASK_TITLE");
			}
			if(criteria.getSearchKeyword() == null) {
				criteria.setSearchKeyword("");
			}
			
			Pagination pagination = new Pagination();
			pagination.setCriteria(criteria);
			pagination.setTotalCount(myRequestService.myRequestTotalCount(criteria));
			model.addAttribute("pagination", pagination);			
			model.addAttribute("myRequestList", myRequestService.getMyRequestList(criteria));
			return "my_RequestList";
		} else {
			return "redirect:login.do";
		}
	}
// Ajax 페이징	
//	@GetMapping("getMyRequestList.do")
//	@ResponseBody
//	public Map<String, Object> requestListWithPaging(Criteria criteria, HttpSession session, JwtUtils utils) {
//		UserVO voToken = utils.getuser(session);
//		criteria.setSession_user_id(voToken.getUser_id());
//		int myRequestTotalCount = myRequestService.myRequestTotalCount(criteria);
//		System.out.println(">>>>myReqeustTotalCount : " + myRequestTotalCount);
//		
//		Pagination pagination = new Pagination();
//		pagination.setCriteria(criteria);
//		pagination.setTotalCount(myRequestTotalCount);
//		
//		List<MyRequestVO> myRequestList = myRequestService.getMyRequestList(criteria);
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("pagination", pagination);
//		map.put("myRequestList", myRequestList);				
//		
//		
//		return map;
//	}
	
	@GetMapping("myRequestDetail.do")


	public String myRequestDetail(MyRequestVO myRequestVO, MyRequestReplyVO myRequestReplyVO, Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws IOException {

		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println(voToken);
//			System.out.println(myRequestVO);
			System.out.println("123123 : " + myRequestVO.getAsk_seq());
			myRequestReplyVO.setAsk_seq(myRequestVO.getAsk_seq());
			
			model.addAttribute("myRequestReplyVO", myRequestService.getMyRequestReply(myRequestReplyVO));
			model.addAttribute("sessionUserInfo", myRequestService.getUser(voToken.getUser_id()));
			model.addAttribute("criteria", criteria);
			model.addAttribute("myRequestVO", myRequestService.getMyRequestDetail(myRequestVO));
			return "my_RequestDetail";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("myRequestWrite.do")
	public String myRequestWrite(Model model, HttpSession session, JwtUtils utils) throws IOException {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println(voToken);
			String session_user_id = voToken.getUser_id();
			System.out.println(session_user_id);
			voToken = myRequestService.getUser(session_user_id); //세션에 저장된 id값으로 유저정보 가져오기
			System.out.println(">>>voToken을 통해 가져온 유저정보" + voToken);
			model.addAttribute("voToken", voToken);
			return "my_RequestWrite";
		} else {
			return "redirect:login.do";
		}
		
	}
}
