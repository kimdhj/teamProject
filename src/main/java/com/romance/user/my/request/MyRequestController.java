package com.romance.user.my.request;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class MyRequestController {
	
	@Autowired
	private MyRequestService myRequestService;
	
	@GetMapping("myRequestList.do")
	public String myRequestList(Model model, HttpSession session, JwtUtils utils) {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			String session_user_id = voToken.getUser_id();
			List<MyRequestVO> myRequestList = myRequestService.getRequestList(session_user_id);
			
			model.addAttribute("myRequestList", myRequestList);
			
			return "my_RequestList";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("myRequestDetail.do")
	public String myRequestDetail(Model model, HttpSession session, JwtUtils utils) {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			return "my_RequestDetail";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("myRequestWrite.do")
	public String myRequestWrite(Model model, HttpSession session, JwtUtils utils) {
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
