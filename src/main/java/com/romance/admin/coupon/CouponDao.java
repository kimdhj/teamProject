package com.romance.admin.coupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.user.login.UserVO;

@Repository
public class CouponDao {
	@Autowired
	SqlSessionTemplate sql;
	
	public void macoupon(CouponVO vo) {
		
		sql.insert("coupon.macoupon", vo);
	}
	public List<Integer> doubleche(String code) {
		
		
		return sql.selectList("coupon.macoupon", code);
	}
	public List<CouponVO> getCouponList(CouponSearchVO vo){
		return sql.selectList("coupon.getCouponList",vo);
	}
	public int getCount(CouponSearchVO vo) {
		return sql.selectOne("coupon.getCount",vo);
	}
	public int coupondel(String coupon_code) {
		return sql.delete("coupon.coupondel",coupon_code);
	}
	public int couche(String coupon_code) {
		return sql.selectOne("coupon.couche",coupon_code);
	}
	//혜성 쿠폰 갯수 세기
	public int owncoupon(UserVO vo) {
		return sql.selectOne("coupon.owncoupon", vo);
	}
}
