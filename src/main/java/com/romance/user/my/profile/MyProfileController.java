package com.romance.user.my.profile;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Autowired
	MyProfileService myProfileService;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("myWithdrawal.do")
	public String myWithdrawal(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println(">>>>>세션 아이디 정보 : " + voToken.getUser_id());
			String user_id = voToken.getUser_id();
			//세션에 있는 회원정보 가져가서 자바스크립트로 일치여부 체크
			model.addAttribute("getSessionUser", myProfileService.getSessionUser(user_id));
			return "my_withdrawal";
		} else {
			return "redirect:login.do";
		}
	}
	
	@PostMapping("myWithdrawal.do")
	public String withdrawalProc(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println("회원탈퇴 준비완료 누구?? + " + vo.getUser_id());
			String user_id = voToken.getUser_id();
			String user_password = myProfileService.getSessionUser(user_id).getUser_password();
			System.out.println("세션 회원정보 비밀번호 : " + user_password);
			
			//세션정보의 회원아이디 값과 입력받은 회원 아이디 값이 같은경우에만 값이 들어옴.
			//만약 세션정보의 비밀번호와 입력받은 비밀번호가 다를경우 업데이트하면안됨.
			if(bCryptPasswordEncoder.matches(vo.getUser_password(), user_password)) {//matches - 입력받은비밀번호, 비교하고자하는 인코딩된 비밀번호
				System.out.println("비밀번호를 맞췄다니 대단해~");
				myProfileService.userWithdrawal(vo.getUser_id());
				session.invalidate();//탈퇴하면 세션끊고 로그인화면으로
				return "redirect:login.do";
			} else {
				System.out.println("비밀번호가 다르자나!!");
				return "redirect:myWithdrawal.do";
			}
	
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("myTransPassword.do")
	public String myTransPassword(HttpSession session) {
		session.invalidate();
		return "my_TransPassword";
	}
	
}
