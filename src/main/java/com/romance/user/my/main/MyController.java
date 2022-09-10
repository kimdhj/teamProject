package com.romance.user.my.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MyController {
	
	@GetMapping("myMain.do")
	public String myMain() {
		return "my_Main";
	}
	
	@GetMapping("myPassword.do")
	public String myPassword() {
		return "my_Password";
	}
}
