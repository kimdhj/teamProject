package com.romance.user.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSampleController {
	@Autowired
	private PasswordEncoder pwencoder;

	@RequestMapping("/smstest.do")
	public String userTest(String smsSend, String smsNumber) {
		System.out.println("service ó�� �ؾ���");
		return "userTest";
	}

	@RequestMapping("/member.do")
	public String vip(Model model) {
		return "/securityTest/member";
	}

	@RequestMapping("/admin.do")
	public String admin(Model model) {
		return "/securityTest/admin";
	}

	@RequestMapping("/Customlogin.do")
	public String login(String error, String logout, Model model) {
		System.out.println("hi");

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		return "/securityTest/Customlogin";
	}

	@RequestMapping("/all.do")
	public String all(Model model) {

		return "/securityTest/all";
	}

	@RequestMapping("/accessError.do")
	public String accessError(Model model) {

		return "/securityTest/accessError";

	}

	@GetMapping("/Customlogout.do")
	public String logout() {
		return "/securityTest/Customlogout";
	}
	@GetMapping("/chat.do")
	public String chat(String user,Model model) {
		
		
		
		model.addAttribute("userid", user);
		return "/socketTest/chat";
	}
	@GetMapping("/chatAdmin.do")
	public String chatAdmin(String user,Model model) {
		
		
		
		model.addAttribute("userid", user);
		return "/socketTest/chatAdmin";
	}
	@GetMapping("/chatList.do")
	public String chatList(String user,Model model) {
		
		
		
		model.addAttribute("userid", user);
		return "/socketTest/chatList";
	}
//	암호화 회원가입
//	@Autowired
//	private PasswordEncoder pwencoder;
//	@GetMapping("/make.do")
//	public String make() {
//		System.out.println("hi");
//		String sql = "insert into userTest values(?,?,'1',?)";
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, "admin");
//			pstmt.setString(2, pwencoder.encode("admin"));
//			pstmt.setString(3, "ROLE_ADMIN");
//			pstmt.executeUpdate();
//			pstmt.setString(1, "member");
//			pstmt.setString(2, pwencoder.encode("member"));
//			pstmt.setString(3, "ROLE_MEMBER");
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null)
//				try {
//					pstmt.close();
//				} catch (SQLException e) { // TODO
//					e.printStackTrace();
//				}
//			if (con != null)
//				try {
//					con.close();
//				} catch (SQLException e) { // TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//		}
//
//		return "redirect:admin.do";
//	}


}
