package com.romance.admin.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.romance.security.JwtUtils;

@Controller
@RequestMapping("/")
public class AdminLoginController {
	
	@Autowired
	private AdminUserService adminUserService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("admin_login.mdo")
	public String loginView(AdminUserVO vo, String warning, Model model) {
		System.out.println("관리자 로그인 페이지");
		vo.setUser_id("test");
		vo.setUser_password("test");
		model.addAttribute("warning", warning);
		return "admin_login";
	}
	
	@PostMapping("admin_login.mdo")
	public String login(AdminUserVO vo, Model model, JwtUtils util, RedirectAttributes redirectAttributes, HttpSession session) {
		System.out.println("로그인 인증 처리");

		AdminUserVO user = adminUserService.getUser(vo);
		String warning = null;
		
		if(user != null && user.getUser_role().equals("ROLE_ADMIN")) {
			System.out.println("입력받은 pw : " + vo.getUser_password());
			System.out.println("DB상의 pw : " + user.getUser_password());
			String inputPassword = vo.getUser_password();
			String dbPassword = user.getUser_password();
			if(bCryptPasswordEncoder.matches(inputPassword, dbPassword)) {// 입력받은 패스워드, 디비상의 패스워드
				System.out.println("로그인 성공");
				return "redirect:adminMain.mdo";
			} else {
				System.out.println("로그인 실패라구!");
				warning = "비밀번호가 틀렸습니다.";
				redirectAttributes.addAttribute("warning", warning);
				return "redirect:admin_login.mdo";
			}
//			session.setAttribute("userName", user.getUser_name());
//			return "redirect:/adminMain.mdo";
		} else {
			warning = "아이디를 확인하세요";
			redirectAttributes.addAttribute("warning", warning);
			return "redirect:admin_login.mdo";
		}
		
	}
	
}
