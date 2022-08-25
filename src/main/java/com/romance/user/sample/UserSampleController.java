package com.romance.user.sample;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserSampleController {

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
	return"/securityTest/Customlogout";
	}
}
