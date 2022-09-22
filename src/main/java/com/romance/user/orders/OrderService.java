package com.romance.user.orders;

import java.util.List;

import com.romance.user.coupon.MyCouponVO;
import com.romance.user.my.delivery.DeliveryVO;
import com.romance.user.points.MyPointsVO;

public interface OrderService {
	public OrderBookListVO ordersearch(int book_seq);
	public void ordersIn(OrdersVO vo);
	public void booklistin(List<OrderBookListVO> vol);
	public OrdersVO getorder(String vo);
	public void delfin(String user_id);
	
	// eunxi
	List<PurchaseJoinVO> purchaseList(PurchaseSearchVO svo);
	int purchaseCount(PurchaseSearchVO svo);
	public List<MyCouponVO> paycouponlist(String user_id);
	public List<DeliveryVO> paydelivery(String user_id);
	public void usecoupon(int user_coupon_seq);
	public DeliveryVO seledelivery(int my_delivery_seq) ;
	
	
	void purchaseCancel(OrdersVO vo);
}
