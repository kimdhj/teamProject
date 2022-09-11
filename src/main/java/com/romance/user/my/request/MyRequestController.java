package com.romance.user.my.request;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MyRequestController {
	
	@GetMapping("myRequestList.do")
	public String myRequestList() {
		return "my_RequestList";
	}
	
	@GetMapping("myRequestDetail.do")
	public String myRequestDetail() {
		return "my_RequestDetail";
	}
	
	@GetMapping("myRequestWrite.do")
	public String myRequestWrite() {
		return "my_ReqeustWrite";
	}
}
