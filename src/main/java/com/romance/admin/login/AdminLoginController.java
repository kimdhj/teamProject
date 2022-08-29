package com.romance.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class AdminLoginController {
	
	@Autowired
	private AdminUserService adminUserService;
	
	@GetMapping("admin_login.mdo")
	public String loginView(AdminUserVO vo) {
		System.out.println("관리자 로그인 페이지");
		vo.setUser_id("test");
		vo.setUser_password("test");
		return "admin_login";
	}
	
	@PostMapping("admin_login.mdo")
	public String login(AdminUserVO vo, HttpSession session) {
		
		System.out.println("로그인 인증 처리");
		
		AdminUserVO user = adminUserService.getUser(vo);
		if(user != null && user.getUser_role().equals("admin")) {
			session.setAttribute("userName", user.getUser_name());
			return "admin_main";
		} else {
			return "admin_login";
		}
		
	}
	
}
