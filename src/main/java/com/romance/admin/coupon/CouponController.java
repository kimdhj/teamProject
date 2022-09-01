package com.romance.admin.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String coupon(CouponSearchVO vo,Model model) {
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
		return "성공했다고 왜이래";
	}
}
