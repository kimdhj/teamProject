package com.romance.admin.login;

import java.io.IOException;
import java.util.Map;

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
	
	//관리자 로그인
	@PostMapping("admin_login.mdo")
	public String login(AdminUserVO vo, HttpSession session, JwtUtils util, RedirectAttributes redirectAttributes) throws IOException {
		System.out.println("로그인 인증 처리");

		AdminUserVO user = adminUserService.getUser(vo);
		String warning = null;
		
		if(user != null && user.getUser_role().equals("ROLE_ADMIN")) {
			System.out.println("입력받은 pw : " + vo.getUser_password());
			System.out.println("DB상의 pw : " + user.getUser_password());
			String inputPassword = vo.getUser_password();//입력받은 비밀번호
			String dbPassword = user.getUser_password();//데이터베이스에 저장된 비밀번호
			
			if(bCryptPasswordEncoder.matches(inputPassword, dbPassword)) {// 입력받은 패스워드, 디비상의 패스워드(암호화된)
				vo.setUser_password(null);//로그인 성공 이후 null값 설정하여 토큰에 Password값 null로 받음
				adminUserService.loginDay(vo.getUser_id());//로그인 날짜 업데이트
				String token = util.createToken("유저", vo);//토큰생성
				System.out.println("생성된 토큰 : " + token);
				Map<String, Object> con = util.parseJwtToken(token);//토큰 유효성 체크 메서드
				System.out.println("유효성체크 con : " + con);
				System.out.println("로그인 성공");
				
				session.setAttribute("id", token);//id 라는이름에 token값을 담아서 @SessionAttributes로 사용
				
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
