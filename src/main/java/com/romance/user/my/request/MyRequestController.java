package com.romance.user.my.request;


import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.romance.security.JwtUtils;
import com.romance.server.AwsS3;
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
	   
	  UserVO vosession = utils.getuser(session);
	   if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	     return "redirect:index.do";
	     } 

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
	   
	  UserVO vosession = utils.getuser(session);
	   if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	     return "redirect:index.do";
	     } 

		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println(voToken);
//			System.out.println(myRequestVO);
			System.out.println("문의글 시퀀스 : " + myRequestVO.getAsk_seq());
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
	   
	  UserVO vosession = utils.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 
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
	
	@PostMapping("myRequestWrite.do")
	public String insertMyRequest(MyRequestVO myRequestVO, Model model, @RequestParam(name="uploadFile") MultipartFile uploadFile, HttpSession session, JwtUtils utils) throws IOException {
		UserVO voToken = utils.getuser(session);
		
		if(voToken != null) {
			if(!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				String expand = fileName.substring(fileName.indexOf("."));
				String key = UUID.randomUUID().toString() + expand;
				System.out.println("key : " + key);
				InputStream is = uploadFile.getInputStream();
				String contentType = uploadFile.getContentType();
				long contentLength = uploadFile.getSize();
				AwsS3 awsS3 = AwsS3.getInstance();
				awsS3.upload(is, key, contentType, contentLength);
				String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
				myRequestVO.setAsk_file(uploadFolder + key);
			}
			
			myRequestService.insertMyRequest(myRequestVO);
			return "redirect:myRequestList.do";
		} else {
			return "redirect:login.do";
		}
	}
	
	//문의글 수정
	@PostMapping("updateMyRequest.do")
	public String updateMyRequest(MyRequestVO myRequestVO, @RequestParam(name="uploadFile") MultipartFile uploadFile, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		System.out.println(uploadFile);
		if(voToken != null) {
			if(!uploadFile.isEmpty()) {
				//MultipartFile 객체 요소들
				//MultipartFile[field="uploadFile", filename=파일이름.png, contentType=image/png, size=132058]
				String fileName = uploadFile.getOriginalFilename();
				String expand = fileName.substring(fileName.indexOf("."));
				String key = UUID.randomUUID().toString() + expand;
				InputStream is = uploadFile.getInputStream();
				String contentType = uploadFile.getContentType();
				long contentSize = uploadFile.getSize();
				//서버랑 통신
				AwsS3 awsS3 = AwsS3.getInstance();
				awsS3.upload(is, key, contentType, contentSize);
				String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
				myRequestVO.setAsk_file(uploadFolder + key);				
			}			
			System.out.println("내용 뭐로바꾸려고? : " + myRequestVO.getAsk_content());
			System.out.println("시퀀스는? : " + myRequestVO.getAsk_seq());
			//업뎃 해보자..
			myRequestService.updateMyRequest(myRequestVO);
			return "redirect:myRequestList.do";
		} else {
			return "redirect:login.do";
		}
	}
	
	//문의글 삭제
	@PostMapping("deleteMyRequest.do")
	@ResponseBody
	public void deleteMyRequest(@RequestParam("ask_seq") int ask_seq, HttpSession session, JwtUtils utils) throws Exception {
		System.out.println("글번호 가져와서 삭제!! : " + ask_seq);
		myRequestService.deleteMyRequest(ask_seq);
	}
	
	//문의글 비밀번호 체크
	@PostMapping("myRequestPasswordCheck.do")
	@ResponseBody
	public int myRequestPasswordCheck(@RequestParam("ask_password") String ask_password, @RequestParam("ask_seq") int ask_seq, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		int returnValue = 0;
		if(voToken != null) {
			System.out.println("글번호가뭐냐!! : " + ask_seq);
			String myRequestPassword = myRequestService.getMyRequestPassword(ask_seq);
			if(myRequestPassword.equals(ask_password)) {
				//정상작동한 경우 0
				returnValue = 0;
				return returnValue;
			} else {
				//비번틀린경우 1
				returnValue = 1;
				return returnValue;
			}
		} else {
			//재로그인필요 2
			returnValue = 2;
			return returnValue;
		}
	}
}
