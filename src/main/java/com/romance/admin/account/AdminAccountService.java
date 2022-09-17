package com.romance.admin.account;

import java.util.List;

import com.romance.admin.coupon.CouponVO;
import com.romance.admin.login.AdminUserVO;

public interface AdminAccountService {
	
	public AdminUserVO getUserDetail(AdminUserVO vo);
	
	//총 회원 목록 조회
	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) throws Exception;
	
	//관리자 목록 조회
	public List<AdminUserVO> getAdminListWithPaging(Criteria criteria) throws Exception;
	
	//Total 개수 얻기
	public int totalCount(Criteria criteria) throws Exception;
	
	//Admin Total 얻기
	public int adminTotalCount(Criteria criteria) throws Exception;
	
	//관리자계정 생성
	public void insertAdminAccount(AdminUserVO vo) throws Exception;
	
	//아이디 중복체크
	public int idCheck(String user_id) throws Exception;
	
	//계정정보 수정
	public void updateUserAccount(AdminUserVO vo) throws Exception;
	
	//현재 보고있는 회원의 쿠폰 목록 추출
	public List<CouponVO> getUserCouponList(String user_id) throws Exception;
	
	//시퀀스 받아와서 보유쿠폰 삭제하기 ajax이용
	public void deleteUserCoupon(int coupon_seq) throws Exception;
}
