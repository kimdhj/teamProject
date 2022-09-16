package com.romance.user.coupon;

import java.util.List;

import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsVO;

public interface MyCouponService {
  public List<MyCouponVO> selusercoupon(MyCouponSearchVO vo);
  public int selcouponcounts(MyCouponSearchVO vo);
  public List<MyPointsVO> seluserpoints(MyPointsSearchVO vo);
  public int selpointscount(MyPointsSearchVO vo);
}
