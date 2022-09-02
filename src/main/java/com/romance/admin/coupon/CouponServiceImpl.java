package com.romance.admin.coupon;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	CouponDao dao;

	@Override
	public String macoupon(CouponVO vo, int count) {
		String code = "";
		for (int i = 0; i < count; i++) {
		
			code = UUID.randomUUID().toString();
			
			vo.setCoupon_code(code);
			dao.macoupon(vo);
			
		}

		return "성공?";
	}

	@Override
	public List<CouponVO> getCouponList(CouponSearchVO vo) {
		// TODO Auto-generated method stub
	
		return dao.getCouponList(vo);
	}

	@Override
	public int getCount(CouponSearchVO vo) {
		// TODO Auto-generated method stub
		
		return dao.getCount(vo);
	}

	@Override
	public int coupondel(String coupon_code) {
		// TODO Auto-generated method stub
		return dao.coupondel(coupon_code);
	}

	@Override
	public void dellist(List<String> codelist) {
		for(int i=0;i<codelist.size();i++) {
			dao.coupondel(codelist.get(i));
		}
		
	}

	
	
	
	

}
