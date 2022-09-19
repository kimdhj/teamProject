package com.romance.user.my.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrdersVO;

@Controller
@RequestMapping("/")
public class MyOrderController {

	@Autowired
	private MyOrderService myOrderService;
	
	@GetMapping("myOrder.do")
	public String myOrder(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			criteria.setSession_user_id(voToken.getUser_id());
			Pagination pagination = new Pagination();
			int myOrderTotalCount = myOrderService.myOrderTotalCount(criteria);
			System.out.println("내주문 몇개있냐? : " + myOrderTotalCount);
			pagination.setCriteria(criteria);
			pagination.setTotalCount(myOrderTotalCount);
			model.addAttribute("pagination", pagination);
			model.addAttribute("myOrderList", myOrderService.getMyOrderList(criteria));
			System.out.println("내 주문목록 내놔바! : " + myOrderService.getMyOrderList(criteria));
			return "my_Order";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("myOrderDetail.do")
	public String myOrderDetail(OrdersVO ordersVO, Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println("시퀀스 네이놈!!!! : " + ordersVO.getOrders_seq());
			System.out.println("페이지넘버 네이노옴!! : " + criteria.getPageNum());
			OrdersVO orderDetail = myOrderService.getMyOrderDetail(ordersVO.getOrders_seq());
			System.out.println("에라이 주문상세다 : " + orderDetail);
			model.addAttribute("orderDetail", orderDetail);
			model.addAttribute("criteria", criteria);
			return "my_OrderDetail";
		} else {
			return "redirect:login.do";
		}
		
	}
	
}
