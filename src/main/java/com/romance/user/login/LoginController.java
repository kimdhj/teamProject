package com.romance.user.login;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.romance.admin.log.LoginLogUtils;
import com.romance.admin.log.LoginLogVO;
import com.romance.admin.login.AdminUserVO;
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
  public String login(UserVO userVO, String warning, JwtUtils util,HttpSession session, Model model) throws IOException {
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
  public String logout(HttpSession session) {
    session.removeAttribute("id");
    return "redirect:index.do";
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
    return "redirect:join_terms.do";
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
	public String login(UserVO vo, Model model, JwtUtils util, HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
		
		insertLoginLog(vo);//로그인 로그
		UserVO vo2 = new UserVO();
		System.out.println("로그인처리" + vo);
		String warning = null;
		vo2 = ser.onesearch(vo.getUser_id());
		System.out.println("로그인데이터" + vo2);
		if (vo2 != null) {
			// user_state가 0(정상)이면서 user_role이 ROLE_MEMBER (유저)일경우에만 로그인
			if (vo2.getUser_state() == 0 && vo2.getUser_role().equals("ROLE_MEMBER")) {
				if (benco.matches(vo.getUser_password(), vo2.getUser_password())) {
					vo2.setUser_password(null);
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
    System.out.println(vo);
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

	@GetMapping("cheid.do")
	@ResponseBody
	public int cheid(String user_id) {
		return ser.cheid(user_id);
	}
    
	//로그
	public void insertLoginLog(UserVO vo) throws Exception {
		//로그인로그 정보들
		//로그 넣을때는 아이디가 존재하든 하지않든 먼저 로그인 시도 로그부터 실행해야함
		LoginLogUtils loginLogUtils = new LoginLogUtils();
		System.out.println("브라우저 정보 : " + loginLogUtils.getUserBrowser());
		System.out.println("로그인 아이피 : " + loginLogUtils.getUserIp());
		System.out.println("로그인 url : " + loginLogUtils.getUserUrl());
		System.out.println("아이디정보 : " + vo.getUser_id());
		//입력받은 아이디 패스워드 값
		String login_log_id = vo.getUser_id();
		String login_log_password = vo.getUser_password();
		String login_log_browser = loginLogUtils.getUserBrowser();
		String login_log_ip = loginLogUtils.getUserIp();
		String _login_log_url = loginLogUtils.getUserUrl();
		String login_log_url = "";
		if(_login_log_url.contains("?")) {
			int idx = _login_log_url.indexOf("?");
			login_log_url = _login_log_url.substring(0, idx);
		} else {
			login_log_url = _login_log_url;
		}
		System.out.println(">>>>>>>>>>>" + login_log_url);
		String login_log_success = "";
		String login_log_role = "";
		//login_log_id로 아이디 존재여부 확인 존재하면1 아니면0
		int isUserId = ser.isUserId(login_log_id);
		if(isUserId > 0) {
			//존재하므로 가져와서 비교
			UserVO userVO = ser.getLoginlogInfo(login_log_id);
			System.out.println(">>>값 들고오냐?? : " + userVO);
			//들고온 값의 user_role로 초기화
			login_log_role = userVO.getUser_role();
			//DB에서 가져온 비밀번호와 입력받은 비밀번호 비교하는 분기
			if(benco.matches(login_log_password, userVO.getUser_password())) {
				//로그인 성공 로그
				login_log_success = "success";
			} else {
				//아이디는 있지만 로그인 실패 로그
				login_log_success = "failed";
			}
		} else {
			//아이디도 틀렸음 실패 쿼리넣기 (user_role 값 null)
			System.out.println(">>>에라이 아이디가 없네~");
			login_log_success = "failed";
		}
		//LogVO 값 세팅
		LoginLogVO loginLogVO = new LoginLogVO();
		loginLogVO.setLogin_log_id(login_log_id);
		loginLogVO.setLogin_log_browser(login_log_browser);
		loginLogVO.setLogin_log_ip(login_log_ip);
		loginLogVO.setLogin_log_url(login_log_url);
		loginLogVO.setLogin_log_success(login_log_success);
		loginLogVO.setLogin_log_role(login_log_role);
		//원하는 값은 다 가져왔고 로그에 입력 실행
		ser.insertLoginLog(loginLogVO);
		//여기까지 로그인 로그 끝
	}

}
