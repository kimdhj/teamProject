package com.romance.admin.account.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.account.Criteria;
import com.romance.admin.coupon.CouponVO;
import com.romance.admin.login.AdminUserVO;

@Repository
public class AdminAccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public AdminUserVO getUserDetail(AdminUserVO vo) {
		System.out.println("Mybatis로 getUserList 기능 처리");
		return sqlSessionTemplate.selectOne("AdminUserDAO.getUserDetail", vo);
	}

	public List<AdminUserVO> getUserListWithPaging(Criteria criteria) {
		System.out.println("Mybatis로 getUserListWithPaging 기능 처리");
		return sqlSessionTemplate.selectList("AdminUserDAO.getUserListWithPaging", criteria);
	}
	
	public List<AdminUserVO> getAdminListWithPaging(Criteria criteria) {
		System.out.println("Mybatis로 getAdminListWithPaging 기능 처리");
		return sqlSessionTemplate.selectList("AdminUserDAO.getAdminListWithPaging", criteria);
	}

	public int totalCount(Criteria criteria) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.totalCount", criteria);
	}

	public int adminTotalCount(Criteria criteria) {
		return sqlSessionTemplate.selectOne("AdminUserDAO.adminTotalCount", criteria);
	}
	
	public void insertAdminAccount(AdminUserVO vo) {
		System.out.println("Mybatis로 insertAdminAccount 기능 처리");
		sqlSessionTemplate.insert("AdminUserDAO.insertAdminAccount", vo);
	}
	
	public int idCheck(String user_id) {
		System.out.println("Mybatis로 idCheck 기능 처리");
		return sqlSessionTemplate.selectOne("AdminUserDAO.idCheck", user_id);
	}
	
	public void updateUserAccount(AdminUserVO vo) {
		System.out.println("Mybatis로 updateUserAccount 기능 처리");
		sqlSessionTemplate.update("AdminUserDAO.updateUserAccount", vo);
	}
	
	public List<CouponVO> getUserCouponList(String user_id) {
		System.out.println("Mybatis로 현재 보고있는 회원의 쿠폰명 리스트로 가져오기");
		return sqlSessionTemplate.selectList("AdminCoupon.getUserCouponList", user_id);
	}
	
}
