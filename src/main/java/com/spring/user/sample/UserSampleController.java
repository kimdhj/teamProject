package com.spring.user.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSampleController {

	@RequestMapping("/test.do")
	public String userTest() {
		System.out.println("service ó�� �ؾ���");
		return "userTest";
	}
	
}
