package com.romance.admin.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private UserService userService; //연결해준다 1
	
	@GetMapping("admin_login.mdo")
	public String loginView(UserVO vo) {
		System.out.println("관리자 로그인 페이지로 이동");
		vo.setUser_id("test");
		vo.setUser_password("test");
		return "admin_login";
	}
	
	@PostMapping("admin_login.mdo")
	public String login(UserVO vo, Model model) {
		
		UserVO vo1 = userService.getUser(vo);
		model.addAttribute("user", vo1);
		
		if(vo1.getUser_id() != null) {
			return "admin_madin"; //성공
		}
		return null;
	}

}
