package com.romance.admin.coupon;

import java.util.List;

import com.romance.user.login.UserVO;

public interface CouponService {
	public List<CouponVO> getCouponList(CouponSearchVO vo);
	public int getCount(CouponSearchVO vo);
	public String macoupon(CouponVO vo,int count);
	public int coupondel(String coupon_code);
	public void dellist(List<String> codelist);
	//혜성 쿠폰 개수
	public int owncoupon(UserVO vo);
}
