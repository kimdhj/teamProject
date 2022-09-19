package com.romance.user.my.sub;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.admin.coupon.CouponService;
import com.romance.admin.icon.IconService;
import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;


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
	
	
	//인클루드 사항 삭제
	//마이페이지 구독정보
	@RequestMapping("my_getSub.do")
	public String my_getSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO userVO = util.getuser(session);
		
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		System.out.println("콘트" + mySubService.getcate(userVO));
		model.addAttribute("cate", mySubService.getcate(userVO));
		
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
	
	
	
}
