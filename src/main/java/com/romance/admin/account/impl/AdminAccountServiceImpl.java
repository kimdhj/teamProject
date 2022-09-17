package com.romance.admin.account.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.account.AdminAccountService;
import com.romance.admin.account.Criteria;
import com.romance.admin.coupon.CouponVO;
import com.romance.admin.login.AdminUserVO;

@Service("adminAccountService")
public class AdminAccountServiceImpl implements AdminAccountService {
	
	@Autowired
	private AdminAccountDAO adminAccountDAO;
	
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
	public List<CouponVO> getUserCouponList(String user_id) throws Exception {
		return adminAccountDAO.getUserCouponList(user_id);
	}

	@Override
	public void deleteUserCoupon(int coupon_seq) throws Exception {
		adminAccountDAO.deleteUserCoupon(coupon_seq);		
	}

	
	
	


	
}
