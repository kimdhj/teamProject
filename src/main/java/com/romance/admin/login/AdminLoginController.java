package com.romance.admin.login;

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

import com.romance.admin.log.LoginLogVO;
import com.romance.admin.log.LoginLogUtils;
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
	public String login(AdminUserVO vo, Model model, HttpSession session, JwtUtils util, RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("로그인 인증 처리");
		//로그인 로그 넣기
		insertLoginLog(vo);
		
		AdminUserVO user = new AdminUserVO();
		user = adminUserService.getUser(vo);
		System.out.println("로그인 데이터 : " + user);
		String warning = null;
				
		if(user != null && user.getUser_role().equals("ROLE_ADMIN")) {
			System.out.println("입력받은 pw : " + vo.getUser_password());
			System.out.println("DB상의 pw : " + user.getUser_password());
			String inputPassword = vo.getUser_password();//입력받은 비밀번호
			String dbPassword = user.getUser_password();//데이터베이스에 저장된 비밀번호
			
			if(bCryptPasswordEncoder.matches(inputPassword, dbPassword)) {// 입력받은 패스워드, 디비상의 패스워드(암호화된)
				user.setUser_password(null);//로그인 성공 이후 null값 설정하여 토큰에 Password값 null로 받음
				adminUserService.loginDay(user.getUser_id());//로그인 날짜 업데이트
				String token = util.createToken("유저", user);//토큰생성
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
	
	public void insertLoginLog(AdminUserVO vo) throws Exception {
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
		String login_log_url = loginLogUtils.getUserUrl();
		String login_log_success = "";
		String login_log_role = "";
		//login_log_id로 아이디 존재여부 확인 존재하면1 아니면0
		int isUserId = adminUserService.isUserId(login_log_id);
		if(isUserId > 0) {
			//존재하므로 가져와서 비교
			AdminUserVO adminUserVO = adminUserService.getLoginlogInfo(login_log_id);
			System.out.println(">>>값 들고오냐?? : " + adminUserVO);
			//들고온 값의 user_role로 초기화
			login_log_role = adminUserVO.getUser_role();
			//DB에서 가져온 비밀번호와 입력받은 비밀번호 비교하는 분기
			if(bCryptPasswordEncoder.matches(login_log_password, adminUserVO.getUser_password())) {
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
		adminUserService.insertLoginLog(loginLogVO);
		//여기까지 로그인 로그 끝
	}
}
