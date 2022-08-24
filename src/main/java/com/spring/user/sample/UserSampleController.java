package com.spring.user.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSampleController {

	@RequestMapping("/smstest.do")
	public String userTest(String smsSend, String smsNumber) {
		System.out.println("service 처리 해야함");
		return "userTest";
	}
	
}
