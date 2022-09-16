package com.romance.user.coupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.romance.admin.coupon.CouponVO;
import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsVO;

@Repository
public class MyCouponDAO {
  @Autowired
  SqlSessionTemplate sql;
  public List<MyCouponVO> selusercoupon(MyCouponSearchVO vo){
      return sql.selectList("usercoupon.selusercoupon",vo);
  }
public int selcouponcounts(MyCouponSearchVO vo){
    return sql.selectOne("usercoupon.selcouponcounts",vo);
  }
public List<MyPointsVO> seluserpoints(MyPointsSearchVO vo){
  return sql.selectList("points.seluserpoints",vo);
}
public int selpointscount(MyPointsSearchVO vo){
  return sql.selectOne("points.selpointscount", vo);
  
}
public CouponVO couche(CouponVO vo) {
  return sql.selectOne("coupon.confind", vo.getCoupon_code());
  
}
public void delcou(CouponVO vo) {
  sql.delete("coupon.delcou", vo.getCoupon_code());
  
}
public void couponin(MyCouponVO vo) {
 sql.selectOne("usercoupon.couponin",vo);
}
}
