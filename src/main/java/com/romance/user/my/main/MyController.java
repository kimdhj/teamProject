package com.romance.user.my.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.login.CheckToken;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class MyController {
	
	
	@GetMapping("myMain.do")
	public String myMain(HttpSession session, JwtUtils util) {
		
		if(CheckToken.isToken(session, util) == 1) {
			System.out.println("안녕하십니까?");
		}
		
		return "my_Main";
	}
	
	@GetMapping("myPassword.do")
	public String myPassword() {
		
		return "my_Password";
	}
}
