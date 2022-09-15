package com.romance.user.my.profile;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class MyProfileController {
	
	
	@GetMapping("myWithdrawal.do")
	public String myWithdrawal(HttpSession session, JwtUtils utils) throws IOException {
		UserVO voToken = utils.getuser(session);
		
		return "my_withdrawal";
	}
	
	@PostMapping("myWithdrawal.do")
	public String withdrawalProc(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			
			return "my_withdrawal";
		} else {
			return "redirect:login.do";
		}
	}
}
