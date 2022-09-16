package com.romance.user.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsVO;

@Service
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
  
}
