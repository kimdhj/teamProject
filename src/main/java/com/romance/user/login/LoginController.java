package com.romance.user.login;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.security.JwtUtils;
@Controller
@SessionAttributes("id")
public class LoginController {
	@GetMapping("login.do")
	public String login(UserVO vo,Model model,JwtUtils util) {
		vo.setUser_id("admin");
		vo.setUser_name("고은지 대빵님");
		vo.setUser_phone("010-3573-9617");
		vo.setUser_role("Role_Admin");
		vo.setUser_address("dfsdf");
		String token=util.createToken("유저",vo);
		System.out.println("token"+token);
		 Map<String, Object> con=util.parseJwtToken(token);
		System.out.println("con"+con);
		
		
		model.addAttribute("id",token);
		return "login";
	}
	@GetMapping("login_none_pwd.do")
	public String login_none_pwd(HttpSession session) {
		System.out.println(session.getAttribute("id"));
		return "login_none_pwd";
	}
	@GetMapping("login_none_Id.do")
	public String login_none_Id() {
		return "login_none_Id";
	}
	@GetMapping("login_join.do")
	public String login_join() {
		return "login_join";
	}
	@GetMapping("login_join_search_Id.do")
	public String login_join_search_Id() {
		return "login_join_search_Id";
	}
	@GetMapping("login_join_result_Id.do")
	public String login_join_result_Id() {
		return "login_join_result_Id";
	}
	@GetMapping("login_id_Search.do")
	public String login_id_Search() {
		return "login_id_Search";
	}
	@GetMapping("login_email_login.do")
	public String login_email_login() {
		return "login_email_login";
	}

}
