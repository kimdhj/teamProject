package com.romance.user.my.sub;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	private SubscribeService subscribeService;
	@Autowired
	private CouponService couponService;
	
	//마이페이지 구독정보
	@RequestMapping("my_getSub.do")
	public String my_getSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) {
		UserVO userVO = util.getuser(session);
		
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		
		return "my_AddReadInfo";
	}
	
	//마이페이지 구독취소
	@RequestMapping("my_cancelSub.do")
	public String my_cancelSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) {
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
	public String my_modifySub() {
		
		return "my_AddReadModify";
	}
	
}
