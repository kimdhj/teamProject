package com.romance.user.my.sub;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.admin.coupon.CouponService;
import com.romance.admin.icon.IconService;
import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;
import com.romance.security.JwtUtils;
import com.romance.user.book.BookSearchVO;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;
import com.romance.user.my.infomodify.MyInfoService;
import com.romance.user.my.profile.MyProfileService;


@Controller
@SessionAttributes("my_sub")
public class MySubController {

	@Autowired
	private IconService iconService;
	@Autowired
	private MySubService mySubService;
	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private CouponService couponService;
	@Autowired
	MyProfileService myProfileService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	MyInfoService ser;
	@Autowired
	UserService seru;
	
	//인클루드 사항 삭제
	//마이페이지 구독정보
	@RequestMapping("my_getSub.do")
	public String my_getSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo, BookSearchVO vo) throws IOException {
		UserVO userVO = util.getuser(session);
		
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		model.addAttribute("cate", mySubService.getcate(userVO));
		model.addAttribute("mynewlist",mySubService.newcate(vo));
		
		return "my_AddReadInfo";
	}
	
	//세션정보를 vo에 전달
	@RequestMapping(value="check_csb.do", method=RequestMethod.POST)
	@ResponseBody
	public UserVO check_csb(HttpSession session, JwtUtils util) throws IOException {
		UserVO userVO = util.getuser(session);
		
		return userVO;
	}
	
	//마이페이지 구독취소
	@RequestMapping("my_cancelSub.do")
	public String my_cancelSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO userVO = util.getuser(session);
		
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", userVO.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		
		return "my_AddReadCancel";
	}
	
	//마이페이지 구독정보변경
	@RequestMapping("my_modifySub.do")
	public String my_modifySub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO userVO = util.getuser(session);
		
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", userVO.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		
		return "my_AddReadModify";
	}
	
	//구독 취소 비밀번호 체크
	@PostMapping("/cancelSubs.do")
	public String cancelSubs(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
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
				System.out.println("d");
				//session.invalidate();//탈퇴하면 세션끊고 로그인화면으로|
				vo.setUser_id(voToken.getUser_id());
			    session.removeAttribute("id");
			    myProfileService.cancelSubs(user_id);
			    voToken = seru.onesearch(vo.getUser_id());
			    voToken.setUser_password(null);	
			    String token = utils.createToken("유저", voToken);
			    session.setAttribute("id", token);
				return "redirect:event_Sub.do";
			} else {
				System.out.println("비밀번호가 다르자나!!");
				return "redirect:my_cancelSub.do";
			}
	
		} else {
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("/go_Sub_Pay.do")
	public String go_Sub_Pay(UserVO vo, Model model, HttpSession session, JwtUtils util) {
		
		return "sub_Pay";
	}
	
}
