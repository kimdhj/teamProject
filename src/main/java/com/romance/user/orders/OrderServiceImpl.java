package com.romance.user.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.user.coupon.MyCouponVO;
import com.romance.user.login.UserVO;
import com.romance.user.my.delivery.DeliveryVO;
import com.romance.user.points.MyPointsVO;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO dao;
	@Override
	public OrderBookListVO ordersearch(int book_seq) {
		// TODO Auto-generated method stub
		return dao.ordersearch(book_seq);
	}
	@Override
	public void ordersIn(OrdersVO vo) {
		// TODO Auto-generated method stub
	  MyPointsVO vop=new MyPointsVO();
	  vop.setPoints_content(vo.getOrders_title());
	  vop.setUser_id(vo.getUser_id());
	  vop.setPoints_count(vo.getOrders_add_point());
	  if(vop.getPoints_count()!=0) {
	  dao.pointsin(vop);
	  }
	  vop.setPoints_count(vo.getOrders_point()*(-1));
	  if(vop.getPoints_count()!=0) {
	    dao.pointsin(vop);
	    }
	  //쿠폰 및 포인트 제외시키기 등록
	  //포인트 제외시키기
    UserVO vou = new UserVO();
    int remain=vo.getOrders_add_point()-vo.getOrders_point();
    vou.setUser_id(vo.getUser_id());
    vou.setUser_point(remain);
    dao.refundpoints(vou);
   
	  
	  
	  System.out.println(vop);
	  System.out.println("포인트 테스트");
		dao.ordersIn(vo);
	}
	@Override
	public void booklistin(List<OrderBookListVO> vol) {
		// TODO Auto-generated method stub
		for(OrderBookListVO vo:vol) {
		  
			dao.booklistin(vo);
		}
	}
	@Override
	public OrdersVO getorder(String vo) {
		// TODO Auto-generated method stub
		return dao.getorder(vo);
	}
	@Override
	public void delfin(String user_id) {
		dao.delfin(user_id);
		
	}
  @Override
  public List<MyCouponVO> paycouponlist(String user_id) {
    // TODO Auto-generated method stub
    return dao.paycouponlist(user_id);
  }
  @Override
  public List<DeliveryVO> paydelivery(String user_id) {
    // TODO Auto-generated method stub
    return dao.paydelivery(user_id);
  }
  @Override
  public void usecoupon(int user_coupon_seq) {
    // TODO Auto-generated method stub
    dao.usecoupon(user_coupon_seq);
  }
  @Override
  public DeliveryVO seledelivery(int my_delivery_seq) {
    // TODO Auto-generated method stub
    return dao.seledelivery(my_delivery_seq);
  }
  
	
	@Override
	public List<PurchaseJoinVO> purchaseList(PurchaseSearchVO svo) {
	  // 검색 입력 칸에 아무런 키워드를 적지 않았을 때 페이지를 초기화시켜주는 코드
	  if(svo.getSearchkeyword() != null && svo.getSearchcontent() != null && svo.getSearchcontent() != "") {
	    System.out.println("검색 내용: " + svo.getSearchcontent());
	    if(svo.getSearchkeyword().trim().equals("orders_seq")) {
	      svo.setSearchcontentint(Integer.parseInt(svo.getSearchcontent()));
	    }
	    
	    svo.setSearchcontent(svo.getSearchcontent().trim());
	  }
	  
	  return dao.purchaseList(svo);
	}
	
	@Override
	public int purchaseCount(PurchaseSearchVO svo) {
	  if(svo.getSearchkeyword() != null && svo.getSearchcontent() != null && svo.getSearchcontent() != "") {
	    System.out.println("검색 내용: " + svo.getSearchcontent());
	    if(svo.getSearchkeyword().trim().equals("orders_seq")) {
        svo.setSearchcontentint(Integer.parseInt(svo.getSearchcontent()));
      }
	    
      svo.setSearchcontent(svo.getSearchcontent().trim());
    }
	  
	  return dao.purchaseCount(svo);
	}
	
	@Override
	public void purchaseCancel(OrdersVO vo) {
	  dao.purchaseCancel(vo);
	}

}
