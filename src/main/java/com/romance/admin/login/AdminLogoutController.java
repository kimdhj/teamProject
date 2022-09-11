package com.romance.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AdminLogoutController {
	
	@GetMapping("adminLogout.mdo")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:admin_login.mdo";
	}
	
}
