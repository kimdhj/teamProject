package com.romance.admin.account;

import java.util.List;

import com.romance.admin.coupon.CouponVO;
import com.romance.admin.coupon.UserCouponVO;
import com.romance.admin.login.AdminUserVO;
import com.romance.user.login.UserVO;

public interface AdminAccountService {
	
	public AdminUserVO getUserDetail(AdminUserVO vo);
	
	//user테이블 한명의 유저정보
	public AdminUserVO getUser(String user_id) throws Exception;
	
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
	public List<UserCouponVO> getUserCouponList(String user_id) throws Exception;
	
	//시퀀스 받아와서 보유쿠폰 삭제하기 ajax이용
	public void deleteUserCoupon(int user_coupon_seq) throws Exception;
	
	//지급가능한 쿠폰 전체 가져오기
	public List<CouponVO> getCouponList() throws Exception;
	
	//지급할 쿠폰정보 가져오기
	public CouponVO getCouponInfo(int coupon_seq) throws Exception;
	
	//쿠폰 지급하기
	public void giveCoupon(UserCouponVO userCouponVO) throws Exception;
	
	//삭제할 유저쿠폰 정보 가져오기(로그기록용)
	public UserCouponVO forDeleteCoupon(int user_coupon_seq) throws Exception;
	
	//현재 유저 보유 포인트 가져오기
	public int getUserPoint(String user_id) throws Exception;
	
	//포인트 지급
	public void giveUserPoint(UserVO userVO) throws Exception;
	
	//포인트 차감
	public void deleteUserPoint(UserVO userVO) throws Exception;
}
