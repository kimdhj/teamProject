package com.romance.user.my.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrdersVO;

@Controller
@RequestMapping("/")
public class MyOrderController {

	@Autowired
	private MyOrderService myOrderService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("상품정보", "ORDERS_TITLE");
		conditionMap.put("받는이", "ORDERS_NAME");

		return conditionMap;
	}
	
	@GetMapping("myOrder.do")
	public String myOrder(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			criteria.setSession_user_id(voToken.getUser_id());
			System.out.println(">>>>>검색조건 : " + criteria.getSearchCondition());
			System.out.println(">>>>>검색키워드 : " + criteria.getSearchKeyword());
			System.out.println(">>>>>검색시작일 : " + criteria.getFromDate());
			System.out.println(">>>>>검색종료일 : " + criteria.getToDate());
			
			//검색 문자열 공백 제거 및 날짜 null값이 아닐 때 추가
			//
			String searchCondition = criteria.getSearchCondition();
			String searchKeyword = criteria.getSearchKeyword();
			String fromDate = criteria.getFromDate();
			String toDate = criteria.getToDate();
			if(searchCondition == null) {
				criteria.setSearchCondition("ORDERS_TITLE");
			}
			if(searchKeyword != null) {
				//앞뒤 공백 제거(검색시 앞뒤에 공백입력들어올경우)
				searchKeyword = searchKeyword.trim(); 
				criteria.setSearchKeyword(searchKeyword);
				System.out.println(">>>>>공백제거 검색키워드 : " + searchKeyword);
			}
			
			/*
			 * fromDate = "yyyy-MM-dd" 형식이기 때문에 DB상의 "yyyy-MM-dd HH:mm:ss" 
			 * 형식과 비교할 수 없음
			 * null이 아니면서 빈문자열이 아닌 경우에만 비교를 위한 시,분,초 문자열 추가
			 */
			if(fromDate != null && !fromDate.equals("")) {
				fromDate = fromDate + " 00:00:00";
				System.out.println(fromDate);
				criteria.setFromDate(fromDate);
			}
			if(toDate != null && !toDate.equals("")) {
				toDate = toDate + " 23:59:59";
				System.out.println(toDate);
				criteria.setToDate(toDate);
			}
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
