package com.romance.admin.coupon;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class CouponController {
	@Autowired
	CouponService ser;
	@GetMapping("/couponlist.mdo")
	@ResponseBody
	public List<CouponVO> couponlist(CouponSearchVO vo) {
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		
		List<CouponVO> list=ser.getCouponList(vo);
		System.out.println(vo);
		System.out.println(list);
		
		return list;
	}
	@GetMapping("/coupondel.mdo")
	@ResponseBody
	public int coupondel(String coupon_code) {
		ser.coupondel(coupon_code);
		return ser.coupondel(coupon_code);
	}
	@GetMapping("/dellist.mdo")
	@ResponseBody
	public int dellist(@RequestParam(value="codelist[]")List<String> codelist) {
		ser.dellist(codelist);
		return 1;
	}
	@GetMapping("/couponcount.mdo")
	@ResponseBody
	public int couponcount(CouponSearchVO vo) {
		
		int count=ser.getCount(vo);
		
		return count;
	}
	@GetMapping("/coupon.mdo")
	public String coupon(CouponSearchVO vo,Model model,JwtUtils util, HttpSession session) throws IOException {

    UserVO vosession = util.getuser(session);
   if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
     return "redirect:admin_login.mdo";
   }

		System.out.println(vo);
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		int count=ser.getCount(vo);
		List<CouponVO> list=ser.getCouponList(vo);
		System.out.println(count);
		System.out.println(list);
		
		if(count%5==0) {
			count-=1;
		}
		if(vo.getPage()<3) {
			model.addAttribute("startpage", 1);
		}else {
			model.addAttribute("startpage", vo.getPage()-2);
		}
		if(vo.getPage()+2>(count/5)+1) {
			System.out.println(count);
			model.addAttribute("endpage", count/5+1);
		}else {
			System.out.println("el"+count);
			model.addAttribute("endpage", vo.getPage()+2);
		}
		model.addAttribute("count",count-((vo.getPage()-1)*5));
		model.addAttribute("maxpage",(int)count/5+1);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		System.out.println(vo);
		return "admin_marketing_Coupon";
	}

	@PostMapping("/macoupon.mdo")
	@ResponseBody
	public String macoupon(CouponVO vo,int count) {

		ser.macoupon(vo,count);
		return "??????????????? ?????????";
	}
}
