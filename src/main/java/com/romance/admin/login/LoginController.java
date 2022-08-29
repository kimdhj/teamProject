package com.romance.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String login(UserVO vo, HttpSession session) {
		
		System.out.println("로그인처리 메서드 실행");
		if(vo.getUser_id() == null || vo.getUser_id().equals("")) {
			throw new IllegalAccessError("아이디를 반드시 입력하세요.");
		}
		
		UserVO userVO = userService.getUser(vo);
//		model.addAttribute("user", vo1);
		
		if(userVO.getUser_id() != null) {
			return "admin_main"; //성공
		} else {
			return "admin_login";
		}
		
	}

}
