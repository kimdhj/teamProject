package com.romance.admin.account.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.account.AdminAccountService;
import com.romance.admin.account.Criteria;
import com.romance.admin.coupon.CouponVO;
import com.romance.admin.coupon.UserCouponVO;
import com.romance.admin.login.AdminUserVO;
import com.romance.user.login.UserVO;

@Service("adminAccountService")
public class AdminAccountServiceImpl implements AdminAccountService {
	
	@Autowired
	private AdminAccountDAO adminAccountDAO;
	
	
	@Override
	public AdminUserVO getUser(String user_id) throws Exception {
		return adminAccountDAO.getUser(user_id);
	}

	@Override
	public AdminUserVO getUserDetail(AdminUserVO vo) {
		return adminAccountDAO.getUserDetail(vo);
	}

	@Override
	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) throws Exception {
		return adminAccountDAO.getUserListWithPaging(criteria);
	}

	@Override
	public int totalCount(Criteria criteria) throws Exception {
		return adminAccountDAO.totalCount(criteria);
	}

	@Override
	public int adminTotalCount(Criteria criteria) throws Exception {
		return adminAccountDAO.adminTotalCount(criteria);
	}

	@Override
	public List<AdminUserVO> getAdminListWithPaging(Criteria criteria) throws Exception {
		return adminAccountDAO.getAdminListWithPaging(criteria);
	}

	@Override
	public void insertAdminAccount(AdminUserVO vo) throws Exception {
		adminAccountDAO.insertAdminAccount(vo);		
	}

	@Override
	public int idCheck(String user_id) throws Exception {
		return adminAccountDAO.idCheck(user_id);
	}

	@Override
	public void updateUserAccount(AdminUserVO vo) throws Exception {
		adminAccountDAO.updateUserAccount(vo);		
	}

	@Override
	public List<UserCouponVO> getUserCouponList(String user_id) throws Exception {
		return adminAccountDAO.getUserCouponList(user_id);
	}

	@Override
	public void deleteUserCoupon(int user_coupon_seq) throws Exception {
		adminAccountDAO.deleteUserCoupon(user_coupon_seq);		
	}

	@Override
	public List<CouponVO> getCouponList() throws Exception {
		return adminAccountDAO.getCouponList();
	}

	@Override
	public CouponVO getCouponInfo(int coupon_seq) throws Exception {
		return adminAccountDAO.getCouponInfo(coupon_seq);
	}

	@Override
	public void giveCoupon(UserCouponVO userCouponVO) throws Exception {
		adminAccountDAO.giveCoupon(userCouponVO);
	}

	@Override
	public UserCouponVO forDeleteCoupon(int user_coupon_seq) throws Exception {
		return adminAccountDAO.forDeleteCoupon(user_coupon_seq);
	}

	@Override
	public int getUserPoint(String user_id) throws Exception {
		return adminAccountDAO.getUserPoint(user_id);
	}

	@Override
	public void giveUserPoint(UserVO userVO) throws Exception {
		adminAccountDAO.giveUserPoint(userVO);		
	}

	@Override
	public void deleteUserPoint(UserVO userVO) throws Exception {
		adminAccountDAO.deleteUserPoint(userVO);
	}
	
}
