package com.romance.user.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.romance.security.JwtUtils;
import com.romance.security.KakaoLogin;
import com.romance.security.Sms;

@Controller
@SessionAttributes("id")
public class LoginController {
	@Autowired
	UserService ser;
	@Autowired
	BCryptPasswordEncoder benco;

	@GetMapping("login.do")
	public String login(String warning,Model model) {
		model.addAttribute("warning",warning);
		return "login";
	}

	// 카카오로그인
	@GetMapping("kakaologin.do")
	@ResponseBody
	public String kakaologin() {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=7cb3e30446e1d6f4a7eabc3f61cba190"
				+ "&redirect_uri=" + "http://localhost:8080/kakaoauth.do" + "&response_type=code";
		System.out.println("hikakaologin");
		return reqUrl;

	}

	// 카카오 정보 받아오기
	@GetMapping("kakaoauth.do")
	public String kakaoauth(@RequestParam(value = "code", required = false) String code, KakaoLogin kakao,
			RedirectAttributes redirectAttributes, Model model) {

		String access_Token = kakao.getAccessToken(code);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		System.out.println("###userInfo#### : " + userInfo.get("id"));
		int che = ser.cheid((String) userInfo.get("id"));

		redirectAttributes.addAttribute("kakaoid", (String) userInfo.get("id"));
		if (che > 0) {
			return "redirect:kakaologinend.do";
		}
		return "redirect:join.do";
	}

	// 인증번호
	@GetMapping("sendChe.do")
	@ResponseBody
	public String sendChe(String phone) {
		String chenum = "";
		int num = 0;
		for (int i = 0; i < 6; i++) {
			num = (int) (Math.random() * 9);
			chenum += String.valueOf(num);
			System.out.println(chenum);
		}
		System.out.println(chenum);
		String result = "낭만서점 인증번호[" + chenum + "] 입니다.";
		System.out.println(result);
		Sms.sendsms(result, phone.trim());
		return chenum;
	}

	@GetMapping("cheid.do")
	@ResponseBody
	public int cheid(String user_id) {
		return ser.cheid(user_id);
	}

	// 회원가입 이동
	@GetMapping("join.do")
	public String join(String kakaoid, Model model) {
		System.out.println(ser.logincate());
		model.addAttribute("kakaoid", kakaoid);
		model.addAttribute("logincate", ser.logincate());
		return "login_jointab";
	}

	@PostMapping("join.do")
	public String join(UserVO vo, @RequestParam(value = "category_num", required = false) List<Integer> category_num) {

		System.out.println(vo);
		System.out.println(category_num);
		vo.setUser_password(benco.encode(vo.getUser_password()));
		ser.joininsert(category_num, vo);

		return "redirect:login.do";
	}

	// 카카오로그인 최종
	@GetMapping("kakaologinend.do")
	public String kakaologinend(String kakaoid, UserVO vo, Model model, JwtUtils util) {
		vo = ser.onesearch(kakaoid);
		ser.loginday(kakaoid);
		String token = util.createToken("유저", vo);
		System.out.println("token" + token);
		Map<String, Object> con = util.parseJwtToken(token);
		System.out.println("con" + con);

		model.addAttribute("id", token);
		return "redirect:index.do";
	}

	// 일반로그인
	@PostMapping("loginend.do")
	public String login(UserVO vo, Model model, JwtUtils util, RedirectAttributes redirectAttributes) {
		UserVO vo2 = new UserVO();
		System.out.println("로그인처리"+vo);
		
		String warning = null;
		vo2 = ser.onesearch(vo.getUser_id());
		System.out.println("로그인데이터"+vo2);
		if (vo2 != null) {
			if (benco.matches(vo.getUser_password(),vo2.getUser_password())) {
				vo.setUser_password(null);
				ser.loginday(vo.getUser_id());
				String token = util.createToken("유저", vo);
				System.out.println("token" + token);
				Map<String, Object> con = util.parseJwtToken(token);
				System.out.println("con" + con);

				model.addAttribute("id", token);
				return "redirect:index.do";
			} else {
				warning = "비밀번호가 일치하지 않습니다.";
				redirectAttributes.addAttribute("warning", warning);
				return "redirect:login.do";
			}

		} else {
			warning = "존재하지 않는 아이디 입니다. 아이디를 확인해주세요";
			redirectAttributes.addAttribute("warning", warning);
			return "redirect:login.do";

		}

	}

}
