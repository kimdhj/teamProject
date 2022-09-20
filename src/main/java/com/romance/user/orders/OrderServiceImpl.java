package com.romance.user.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}
