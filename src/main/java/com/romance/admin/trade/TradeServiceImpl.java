package com.romance.admin.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.romance.server.refund;
import com.romance.user.coupon.MyCouponVO;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.OrdersVO;
import com.romance.user.points.MyPointsVO;

@Service
@Transactional
public class TradeServiceImpl implements TradeService {
  @Autowired
  TradeDAO dao;
  
  @Override
  public List<TradeJoinVO> mainlist(TradeSearchVO vo) {
    if (vo.getSearchkeyword() != null && vo.getSearchcontent() != null && vo.getSearchcontent() != "") {
      System.out.println("ser1" + vo.getSearchcontent());
      
      if (vo.getSearchkeyword().trim().equals("orders_seq") || vo.getSearchkeyword().trim().equals("checksum")) {
        
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
    }
    
    // TODO Auto-generated method stub
    return dao.mainlist(vo);
  }
  
  @Override
  public List<TradeJoinVO> cancellist(TradeSearchVO vo) {
    if (vo.getSearchkeyword() != null && vo.getSearchcontent() != null && vo.getSearchcontent() != "") {
      System.out.println("ser1" + vo.getSearchcontent());
      
      if (vo.getSearchkeyword().trim().equals("orders_seq") || vo.getSearchkeyword().trim().equals("checksum")) {
        
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
    }
    // TODO Auto-generated method stub
    return dao.cancellist(vo);
  }
  
  @Override
  public TradeJoinVO booklistdetail(int order_bookList_seq) {
    // TODO Auto-generated method stub
    return dao.booklistdetail(order_bookList_seq);
  }
  
  @Override
  public OrdersVO ordersdetail(int orders_seq) {
    // TODO Auto-generated method stub
    return dao.ordersdetail(orders_seq);
  }
  
  @Override
  public int maincount(TradeSearchVO vo) {
    System.out.println("ser" + vo.getSearchkeyword());
    if (vo.getSearchkeyword() != null && vo.getSearchcontent() != null && vo.getSearchcontent() != "") {
      System.out.println("ser1" + vo.getSearchcontent());
      System.out.println("ser1" + vo.getSearchkeyword().trim().equals("orders_seq"));
      System.out.println("ser1" + vo.getSearchkeyword().trim().equals("checksum"));
      
      if (vo.getSearchkeyword().trim().equals("orders_seq") || vo.getSearchkeyword().trim().equals("checksum")) {
        
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
      System.out.println("ser1" + vo.getSearchkeyword().trim().equals("orders_seq"));
      System.out.println("ser2" + vo.getSearchcontent().trim().equals("checksum"));
      
    }
    // TODO Auto-generated method stub
    return dao.maincount(vo);
  }
  
  @Override
  public int cancelcount(TradeSearchVO vo) {
    
    if (vo.getSearchkeyword() != null && vo.getSearchcontent() != null && vo.getSearchcontent() != "") {
      
      if (vo.getSearchkeyword().trim().equals("orders_seq") || vo.getSearchkeyword().trim().equals("checksum")) {
        
        System.out.println("인트변경");
        vo.setSearchcontentint(Integer.parseInt(vo.getSearchcontent()));
      }
      
    }
    
    // TODO Auto-generated method stub
    return dao.cancelcount(vo);
  }
  
  @Override
  public List<OrderBookListVO> booklistsel(int orders_seq) {
    // TODO Auto-generated method stub
    return dao.booklistsel(orders_seq);
  }
  

  @Override
  @Transactional
  public void updateorders(OrdersVO vo) throws Exception {
    // TODO Auto-generated method stub
    dao.updateorders(vo);
    System.out.println("service  끝확인"+vo.getOrders_status().trim().equals("cancelallfinish"));
    if(vo.getOrders_status().trim().equals("cancelallfinish")) {
      //쿠폰밑 그에 수반하는 처리
      TradeJoinVO vot=new TradeJoinVO();
      vot.setOrders_seq(vo.getOrders_seq());
      OrdersVO voo = dao.ordersel(vot);
      System.out.println("orders 삭제"+voo);
      refund.refund(voo.getOrders_cache_uid(), "주문 취소", Integer.toString(voo.getOrders_cache_sum()));
      System.out.println("결제 대기");
     
      // 쿠폰 추가
      if(voo.getOrders_coupon_effect()>0) {
      MyCouponVO voc = new MyCouponVO();
     
      
      voc.setUser_coupon_effect(voo.getOrders_coupon_effect());
      voc.setUser_coupon_name("환불된 쿠폰"+Integer.toString(voo.getOrders_coupon_effect()));
      voc.setUser_id(voo.getUser_id());
      dao.couponin(voc);
      }
      // 포인트 추가 뺀거 계산해서 포인트 추가(user테이블이랑 포인트 사용기록에도)
      int remain = voo.getOrders_point() - voo.getOrders_add_point();
      if(voo.getOrders_point()>0) {
        MyPointsVO vop = new MyPointsVO();
      vop.setPoints_content("환불 포인트");
      vop.setPoints_count(remain);
      vop.setUser_id(voo.getUser_id());
      dao.pointsin(vop);
      }
      if(remain>0) {
        UserVO vou = new UserVO();
      vou.setUser_id(voo.getUser_id());
      vou.setUser_point(remain);
      dao.refundpoints(vou);
      }
      dao.finupdate(vo.getOrders_seq());
      
    }
    
  }

  @Override
  public void booklistin(List<OrderBookListVO> vol) {
    // TODO Auto-generated method stub
    for(OrderBookListVO vo:vol) {
      dao.booklistin(vo);
    }
  }

  @Override
  public int chebookseq(int book_seq) {
    // TODO Auto-generated method stub
    return dao.chebookseq(book_seq);
  }

  @Override
  @Transactional
  public void dellevel(TradeJoinVO vo) throws Exception {
    // TODO Auto-generated method stub
    
    OrdersVO voo = dao.ordersel(vo);
    dao.booklistorderdel(vo.getOrders_seq());
    System.out.println("orders 삭제"+voo);
    refund.refund(voo.getOrders_cache_uid(), "주문 취소", Integer.toString(voo.getOrders_cache_sum()));
    System.out.println("결제 대기");
    dao.ordersdel(vo);
    // 쿠폰 추가
    if(voo.getOrders_coupon_effect()>0) {
    MyCouponVO voc = new MyCouponVO();
   
    
    voc.setUser_coupon_effect(voo.getOrders_coupon_effect());
    voc.setUser_coupon_name("환불된 쿠폰"+Integer.toString(voo.getOrders_coupon_effect()));
    voc.setUser_id(voo.getUser_id());
    dao.couponin(voc);
    }
    // 포인트 추가 뺀거 계산해서 포인트 추가(user테이블이랑 포인트 사용기록에도)
    int remain = voo.getOrders_point() - voo.getOrders_add_point();
    if(voo.getOrders_point()>0) {
      MyPointsVO vop = new MyPointsVO();
    vop.setPoints_content("환불 포인트");
    vop.setPoints_count(remain);
    vop.setUser_id(voo.getUser_id());
    dao.pointsin(vop);
    }
    if(remain>0) {
      UserVO vou = new UserVO();
    vou.setUser_id(voo.getUser_id());
    vou.setUser_point(remain);
    dao.refundpoints(vou);
    }
    
  }

  @Override
  public void delorderbooklist(TradeJoinVO vo) throws Exception {
    // TODO Auto-generated method stub
    int che = 0;
    if (vo.getOrders_status().equals("ready")) {
      OrdersVO voo = dao.ordersel(vo);

      System.out.println("결제 대기");
      dao.ordersdel(vo);
      // 쿠폰 추가
      if(voo.getOrders_coupon_effect()>0) {
      MyCouponVO voc = new MyCouponVO();
     
      
      voc.setUser_coupon_effect(voo.getOrders_coupon_effect());
      voc.setUser_coupon_name("환불된 쿠폰"+Integer.toString(voo.getOrders_coupon_effect()));
      voc.setUser_id(voo.getUser_id());
      dao.couponin(voc);
      }
      // 포인트 추가 뺀거 계산해서 포인트 추가(user테이블이랑 포인트 사용기록에도)
      int remain = voo.getOrders_point() - voo.getOrders_add_point();
      if(voo.getOrders_point()>0) {
        MyPointsVO vop = new MyPointsVO();
      vop.setPoints_content("환불 포인트");
      vop.setPoints_count(remain);
      vop.setUser_id(voo.getUser_id());
      dao.pointsin(vop);
      }
      if(remain>0) {
        UserVO vou = new UserVO();
      vou.setUser_id(voo.getUser_id());
      vou.setUser_point(remain);
      dao.refundpoints(vou);
      }
    } else {
      OrdersVO voo = dao.ordersel(vo);
      int can=0;
      if(voo.getOrders_coupon_effect()!=0) {
       can = voo.getOrders_cache_sum() - ((vo.getSum()*100)/voo.getOrders_coupon_effect()+voo.getOrders_point());
      }else {
         can = voo.getOrders_cache_sum() - (voo.getOrders_point());
      }
      
     
      if (can > 0) {
        System.out.println("양수");
        refund.refund(voo.getOrders_cache_uid(), "주문 취소", Integer.toString(vo.getSum()));
        
        dao.orderupdate(vo);
        dao.orderbookdel(vo);
      } else if (can == 0) {
        System.out.println("0");
        refund.refund(voo.getOrders_cache_uid(), "주문 취소", Integer.toString(vo.getSum()));
        // 나머지 주문 이 남은지 확인하고 없으면 orders 삭제하고 그 수반 처리를 한다.
        //총합 빼기
        dao.orderupdate(vo);
        //북리스트 삭제
        dao.orderbookdel(vo);
        che = dao.chebooklist(vo);
        if (che == 0) {
        //orders 삭제
          dao.ordersdel(vo);
         
          // 쿠폰 추가
          MyCouponVO voc = new MyCouponVO();
          voc.setUser_coupon_effect(voo.getOrders_coupon_effect());
          voc.setUser_coupon_name("환불된 쿠폰"+Integer.toString(voo.getOrders_coupon_effect()));
          voc.setUser_id(voo.getUser_id());
          dao.couponin(voc);
          // 포인트 추가 뺀거 계산해서 포인트 추가(user테이블이랑 포인트 사용기록에도)
          int remain = voo.getOrders_point() - voo.getOrders_add_point();
          MyPointsVO vop = new MyPointsVO();
       
          vop.setPoints_content("환불 포인트");
          vop.setPoints_count(remain);
          vop.setUser_id(voo.getUser_id());
          dao.pointsin(vop);
         
          
          UserVO vou = new UserVO();
          if(remain>0) {
          vou.setUser_id(voo.getUser_id());
          vou.setUser_point(remain);
          dao.refundpoints(vou);
          }
        }
        
      } else {
        System.out.println("음수");
        if(can * (-1)>voo.getOrders_point()) {
          can=voo.getOrders_point()* (-1);
      
        }
        dao.orderupdate(vo);
        dao.orderbookdel(vo);
        if (voo.getOrders_cache_sum() > 0) {
          refund.refund(voo.getOrders_cache_uid(), "주문 취소", Integer.toString(voo.getOrders_cache_sum()));
        }
        // can 만큼 포이트 추가(user테이블이랑 포인트 사용기록에도)
        //포인트 기록 업데이트
        MyPointsVO vop = new MyPointsVO();
        if(voo.getOrders_point()>0) {
        vop.setPoints_content("환불 포인트");
        vop.setPoints_count(can * (-1));
        vop.setUser_id(voo.getUser_id());
        dao.pointsin(vop);
        }
        //유저 업데이트
        UserVO vou = new UserVO();
        if(can * (-1)>0) {
        vou.setUser_id(voo.getUser_id());
        vou.setUser_point(can * (-1));
        dao.refundpoints(vou);
        }
        // order 포인트 업데이트
        vo.setSum(can * (-1));
        dao.orderpointupdate(vo);
        voo.setOrders_point(voo.getOrders_point() - can * (-1));
        
        // 나머지 주문 이 남은지 확인하고 없으면 orders 삭제하고 그 수반 처리를 한다.
        
        che = dao.chebooklist(vo);
        
        if (che == 0) {
          dao.ordersdel(vo);
          // 쿠폰 추가
          if(voo.getOrders_coupon_effect()>0) {
          MyCouponVO voc = new MyCouponVO();
          voc.setUser_coupon_effect(voo.getOrders_coupon_effect());
          voc.setUser_coupon_name("환불된 쿠폰"+Integer.toString(voo.getOrders_coupon_effect()));
          voc.setUser_id(voo.getUser_id());
          dao.couponin(voc);
          }
          // 포인트 추가 뺀거 계산해서 포인트 추가(user테이블이랑 포인트 사용기록에도)
          int remain = voo.getOrders_point() - voo.getOrders_add_point();
          if(voo.getOrders_point()>0) {
          vop.setPoints_content("환불 포인트");
          vop.setPoints_count(remain);
          vop.setUser_id(voo.getUser_id());
          dao.pointsin(vop);
          }
          if(remain>0) {
          vou.setUser_id(voo.getUser_id());
          vou.setUser_point(remain);
          dao.refundpoints(vou);
          }
        }
        
      }
      
    }
  }
  
}
