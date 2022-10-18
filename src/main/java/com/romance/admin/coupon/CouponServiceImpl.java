package com.romance.admin.coupon;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.login.UserVO;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	CouponDao dao;

<<<<<<< HEAD
	// 쿠폰 생성
	@Override
	public String macoupon(CouponVO vo, int count) { // count 로 몇 개 만들지 받아옴
=======
	@Override 
	public String macoupon(CouponVO vo, int count) {
>>>>>>> a6af60c06b23eef970a37cbbf29a8d20e3c79ca9
		String code = "";
		for (int i = 0; i < count; i++) {
			int che=1;
			while(che==1) {
			  // 애초에 타입은 UUID 타입!
			code = UUID.randomUUID().toString(); // UUID.randomUUID() : 숫자 + 알파벳 섞인 것 -> String 으로 넣기 위해 toString() 으로 준 것! -> null 값 들어갈 경우 오류로 반환
			// StringValueOf() 를 사용해도 가능! -> 얘가 null 값은 null 값으로 반환
			che=dao.couche(code); // couche : 중복되는 쿠폰 번호가 있나 없나를 검사 ! - 중복되면 1이 나와서 루프를 계속 돌 수 있도록 진행, 0 일 경우에는 루프 탈출해서 쿠폰 생성!
			System.out.println("che:"+che);
			}
			
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

	// 쿠폰 삭제 시, 여러 개 삭제 가능하기 떄문에 List 로 받아서 삭제할 수 있도록 해줌!
	@Override
	public void dellist(List<String> codelist) {
		for(int i=0;i<codelist.size();i++) {
			dao.coupondel(codelist.get(i));
		}
		
	}
	//혜성 쿠폰 개수
	@Override
	public int owncoupon(UserVO vo) {
		System.out.println("쿠폰 임플 : "+vo);
		return dao.owncoupon(vo);
	}
	
	
	

}
