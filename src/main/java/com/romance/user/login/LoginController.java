package com.romance.user.login;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
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
import com.romance.security.MailService;
import com.romance.security.Sms;

import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller

public class LoginController {

  @Autowired
  UserService ser;
  @Autowired
  BCryptPasswordEncoder benco;
  
  @GetMapping("login.do")
  public String login(String warning, JwtUtils util,HttpSession session, Model model) throws IOException {
    UserVO vo=util.getuser(session);
    System.out.println("로그아웃"+vo);
    if (vo != null) {
      System.out.println("로그아웃"+vo);
      return "redirect:logout.do";
    }else {
    System.out.println("로그인처리"+vo);
    model.addAttribute("warning", warning);
    return "login";
    }
  }
  
  @GetMapping("logout.do")
  public String logout(HttpServletRequest request,JwtUtils util,HttpSession session) {
    
   // session.setAttribute("id", null);
    System.out.println(session.getAttribute("id"));
    session.removeAttribute("id");
    System.out.println("로그인처리");
    return "redirect:index.do";
  }
  
  // 카카오로그인
  @GetMapping("kakaologin.do")
  @ResponseBody
  public String kakaologin() throws IOException {
    String resource = "config/kakao.properties";
    Properties properties = new Properties();    
    Reader reader = Resources.getResourceAsReader(resource);
    properties.load(reader);
    
    String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id="+properties.getProperty("client_id") + "&redirect_uri=" + properties.getProperty("redirect_uri")+ "&response_type=code";
    System.out.println(reqUrl);
    return reqUrl;
    
  }
  
  // 카카오 정보 받아오기
  @GetMapping("kakaoauth.do")
  public String kakaoauth(@RequestParam(value = "code", required = false) String code,HttpSession session, KakaoLogin kakao, RedirectAttributes redirectAttributes, Model model,JwtUtils util) throws IOException {
    
    String access_Token = kakao.getAccessToken(code);
    
    HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
    
    System.out.println("###userInfo#### : " + userInfo.get("id"));
    int che = ser.cheid((String) userInfo.get("id"));
    
    redirectAttributes.addAttribute("kakaoid", (String) userInfo.get("id"));
    if (che > 0) {
      UserVO vo = ser.onesearch((String) userInfo.get("id"));
      String token = util.createToken("유저", vo);
      session.setAttribute("id", token);
      return "redirect:kakaologinend.do";
    }
    return "redirect:join.do";
  }
  
  // 인증번호
  @GetMapping("sendChe.do")
  @ResponseBody
  public String sendChe(String phone) throws IOException, CoolsmsException {
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
  public String kakaologinend(String kakaoid, UserVO vo, Model model, JwtUtils util) throws IOException {  
    ser.loginday(kakaoid);
    return "redirect:index.do";
  }
  // 일반로그인
	// 로그인시 user컬럼에 user_state 0(정상) 그리고 ROLE_MEMBER 인 경우에만 로그인 되도록
	// 1(블랙) 2(탈퇴)인 경우에 로그인되면 안댐!!!!
	@PostMapping("loginend.do")
	public String login(UserVO vo, Model model, JwtUtils util, RedirectAttributes redirectAttributes)
			throws IOException {
		UserVO vo2 = new UserVO();
		System.out.println("로그인처리" + vo);
		String warning = null;
		vo2 = ser.onesearch(vo.getUser_id());
		System.out.println("로그인데이터" + vo2);
		if (vo2 != null) {
			// user_state가 0(정상)이면서 user_role이 ROLE_MEMBER (유저)일경우에만 로그인
			if (vo2.getUser_state() == 0 && vo2.getUser_role().equals("ROLE_MEMBER")) {
				if (benco.matches(vo.getUser_password(), vo2.getUser_password())) {
					vo.setUser_password(null);
					ser.loginday(vo.getUser_id());
					String token = util.createToken("유저", vo2);
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
			} else if(vo2.getUser_state() == 0 && vo2.getUser_role().equals("ROLE_ADMIN")) {//user_state = 0 (정상)인데 관리자가 user페이지 로그인하려고 할 경우
				warning = "여기오면 근손실 난다 저리가!!";
				redirectAttributes.addAttribute("warning", warning);
				return "redirect:login.do";
			} else {//블랙 또는 탈퇴한유저인 경우 (user_state != 0)
				if(vo2.getUser_state() == 1) {//블랙유저
					warning = "이용이 제한된 유저입니다.";
					redirectAttributes.addAttribute("warning", warning);
					return "redirect:login.do";
				} else {//탈퇴한 유저
					warning = "탈퇴한 유저입니다. 복구를 원하시면 고객센터로 문의하세요";
					redirectAttributes.addAttribute("warning", warning);
					return "redirect:login.do";
				}
			}

		} else {
			warning = "존재하지 않는 아이디 입니다. 아이디를 확인해주세요";
			redirectAttributes.addAttribute("warning", warning);
			return "redirect:login.do";

		}

	}

  // 메일테스트
	@GetMapping("mail.do")
	@ResponseBody
	public String mail(String mail, String name) throws Exception {
		String chenum = "";
		int num = 0;
		for (int i = 0; i < 6; i++) {
			num = (int) (Math.random() * 9);
			chenum += String.valueOf(num);
		}
		System.out.println(chenum);
		String result = "노출에 조심하세요 낭만서점 이메일 인증 번호는[" + chenum + "] 입니다.";
		System.out.println(result);
		MailService ma = new MailService();
		ma.sendEmail(mail.trim(), "낭만서점 본인확인 메일입니다.", result, name.trim());
		return chenum;
	}

	@PostMapping("findid.do")
	public String findid(UserVO vo, Model model) {
		System.out.println("findidvo" + vo);
		List<UserVO> vol = ser.findid(vo);
		System.out.println("findidvol" + vol);
		System.out.println("phche" + vo.getUser_phone() == " ");
		if (vol.size() > 0) {
			model.addAttribute("vol", vol);

			return "login_findid";
		} else {
			return "redirect:login_nopassword.do";
		}
	}

	@PostMapping("findpassword.do")
	public String findpassword(UserVO vo, Model model) {
		int re = ser.findpassword(vo);
		if (re > 0) {
			model.addAttribute("id", vo.getUser_id());
			return "login_changepassword";
		} else {
			return "redirect:login_nopassword.do";
		}

	}

	@PostMapping("/login_change_password.do")
	public String login_change_password(UserVO vo) {

		vo.setUser_password(benco.encode(vo.getUser_password()));
		ser.passwordin(vo);
		return "redirect:index.do";

	}

	@GetMapping("findaccount.do")
	public String findaccount() {
		return "login_find";
	}

	@GetMapping("login_nopassword.do")
	public String login_nopassword() {
		return "login_nopassword";
	}
  
  // 일반로그인
  @PostMapping("loginend.do")
  public String login(UserVO vo, Model model, JwtUtils util, HttpSession session,RedirectAttributes redirectAttributes) throws IOException {
    UserVO vo2 = new UserVO();
    System.out.println("로그인처리" + vo);
    
    String warning = null;
    vo2 = ser.onesearch(vo.getUser_id());
    System.out.println("로그인데이터" + vo2);
    if (vo2 != null) {
      if (benco.matches(vo.getUser_password(), vo2.getUser_password())) {
        vo.setUser_password(null);
        ser.loginday(vo.getUser_id());
        String token = util.createToken("유저", vo2);
        System.out.println("token" + token);
        Map<String, Object> con = util.parseJwtToken(token);
        System.out.println("con" + con);
        session.setAttribute("id", token);
        
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
  
  // 메일테스트
  @GetMapping("mail.do")
  @ResponseBody
  public String mail(String mail, String name) throws Exception {
    String chenum = "";
    int num = 0;
    for (int i = 0; i < 6; i++) {
      num = (int) (Math.random() * 9);
      chenum += String.valueOf(num);
    }
    System.out.println(chenum);
    String result = "노출에 조심하세요 낭만서점 이메일 인증 번호는[" + chenum + "] 입니다.";
    System.out.println(result);
    MailService ma = new MailService();
    ma.sendEmail(mail.trim(), "낭만서점 본인확인 메일입니다.", result, name.trim());
    return chenum;
  }
  
  @PostMapping("findid.do")
  public String findid(UserVO vo, Model model) {
    System.out.println("findidvo" + vo);
    List<UserVO> vol = ser.findid(vo);
    System.out.println("findidvol" + vol);
    System.out.println("phche" + vo.getUser_phone() == " ");
    if (vol.size() > 0) {
      model.addAttribute("vol", vol);
      
      return "login_findid";
    } else {
      return "redirect:login_nopassword.do";
    }
  }
  
  @PostMapping("findpassword.do")
  public String findpassword(UserVO vo, Model model) {
    int re = ser.findpassword(vo);
    if (re > 0) {
      model.addAttribute("id", vo.getUser_id());
      return "login_changepassword";
    } else {
      return "redirect:login_nopassword.do";
    }
    
  }
  
  @PostMapping("/login_change_password.do")
  public String login_change_password(UserVO vo) {
    
    vo.setUser_password(benco.encode(vo.getUser_password()));
    ser.passwordin(vo);
    return "redirect:index.do";
    
  }
  
  @GetMapping("findaccount.do")
  public String findaccount() {
    return "login_find";
  }
  
  @GetMapping("login_nopassword.do")
  public String login_nopassword() {
    return "login_nopassword";
  }
  	@GetMapping("login.do")
	public String login(String warning, HttpSession session, Model model) {
		String key = (String) session.getAttribute("id");
		if (key != null) {
			return "redirect:logout.do";
		}
		model.addAttribute("warning", warning);
		return "login";
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:index.do";
	}

	// 카카오로그인
	@GetMapping("kakaologin.do")
	@ResponseBody
	public String kakaologin() throws IOException {
		String resource = "config/kakao.properties";
		Properties properties = new Properties();
		Reader reader = Resources.getResourceAsReader(resource);
		properties.load(reader);

		String reqUrl = "https://kauth.kakao.com/oauth/authorize" + "?client_id=" + properties.getProperty("client_id")
				+ "&redirect_uri=" + properties.getProperty("redirect_uri") + "&response_type=code";
		System.out.println(reqUrl);
		return reqUrl;

	}

	// 카카오 정보 받아오기
	@GetMapping("kakaoauth.do")
	public String kakaoauth(@RequestParam(value = "code", required = false) String code, KakaoLogin kakao,
			RedirectAttributes redirectAttributes, Model model, JwtUtils util) throws IOException {

		String access_Token = kakao.getAccessToken(code);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		System.out.println("###userInfo#### : " + userInfo.get("id"));
		int che = ser.cheid((String) userInfo.get("id"));

		redirectAttributes.addAttribute("kakaoid", (String) userInfo.get("id"));
		if (che > 0) {
			UserVO vo = ser.onesearch((String) userInfo.get("id"));
			String token = util.createToken("유저", vo);
			model.addAttribute("id", token);
			return "redirect:kakaologinend.do";
		}
		return "redirect:join.do";
	}

	// 인증번호
	@GetMapping("sendChe.do")
	@ResponseBody
	public String sendChe(String phone) throws IOException, CoolsmsException {
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
	public String kakaologinend(String kakaoid, UserVO vo, Model model, JwtUtils util) throws IOException {

		ser.loginday(kakaoid);

		return "redirect:index.do";
	}

}
