package com.romance.admin.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {

	
	@GetMapping("admin_login.mdo")
	public String loginView() {
		System.out.println("관리자 로그인 페이지로 이동");
		return "admin_login";
	}

}
