package com.romance.user.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.romance.admin.coupon.CouponVO;
import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsVO;

@Service
@Transactional
public class MyCouponServiceImpl implements MyCouponService {
  @Autowired
  MyCouponDAO dao;

  @Override
  public List<MyCouponVO> selusercoupon(MyCouponSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.selusercoupon(vo);
  }

  @Override
  public int selcouponcounts(MyCouponSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.selcouponcounts(vo);
  }

  @Override
  public List<MyPointsVO> seluserpoints(MyPointsSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.seluserpoints(vo);
  }

  @Override
  public int selpointscount(MyPointsSearchVO vo) {
    // TODO Auto-generated method stub
    return dao.selpointscount(vo);
  }

  @Override
  public int couche(CouponVO vo,String user_id) {
    // TODO Auto-generated method stub
    CouponVO che=dao.couche(vo);
    if(che!=null) {
    MyCouponVO vom= new MyCouponVO();
    vom.setUser_coupon_code(che.getCoupon_code());
    vom.setUser_coupon_effect(che.getCoupon_effect());
    vom.setUser_coupon_name(che.getCoupon_name());
    vom.setUser_id(user_id);
    dao.couponin(vom);
    dao.delcou(vo);
    return 1;
    }
     
    return 0;
  }
  
  
}
