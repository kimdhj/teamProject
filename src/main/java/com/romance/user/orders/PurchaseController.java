package com.romance.user.orders;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.reply.ReplyService;
import com.romance.admin.reply.ReplyVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.my.order.MyOrderService;

@Controller
public class PurchaseController {
  @Autowired
  private OrderService service;
 
  @Autowired
  private MyOrderService order;
  
  @RequestMapping("/myPurchase.do") // 구매 목록가기
  public String purchase(HttpSession session, JwtUtils util, OrdersVO vo, Model model, PurchaseSearchVO svo, PurchaseJoinVO pjvo) throws IOException {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:index.do";
      } 
    UserVO userVO = util.getuser(session); // 로그인 여부를 확인하는 것
    if(svo.getPage() == 0) {
      svo.setPage(1);
    }
    
    if(userVO == null) {
      return "redirect:index.do";
    }
    
    svo.setUser_id(userVO.getUser_id());
    
    System.out.println(svo);
    List<PurchaseJoinVO> list = service.purchaseList(svo);
    System.out.println("list" + list);
    model.addAttribute("purchaseList", list);
    
    int count = service.purchaseCount(svo);
    
  
    model.addAttribute("count", count - (svo.getPage() - 1) * 5);
    if(count % 5 == 0) {
      count--;
    }
    
    if (svo.getPage() < 3) {
      model.addAttribute("startpage", 1);
    } else {
      model.addAttribute("startpage", svo.getPage() - 2);
    }
    if (svo.getPage() + 2 > count / 5 + 1) {
      model.addAttribute("endpage", count / 5 + 1);
    } else {
      model.addAttribute("endpage", svo.getPage() + 2);
    }
    
    System.out.println("count : " + count);
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count);
    model.addAttribute("allPage", svo.getPage());
    model.addAttribute("allSvo", svo);
    
    return "my_Purchase";
  }
  
  @GetMapping("/purchaseList.do")
  @ResponseBody
  public List<PurchaseJoinVO> purchaseList(PurchaseSearchVO svo, HttpSession session, JwtUtils util) throws IOException {
    UserVO userVO = util.getuser(session);
    
    svo.setUser_id(userVO.getUser_id());
    System.out.println("구매목록: " + svo);
    List<PurchaseJoinVO> list = service.purchaseList(svo);
    return list;
  }
  
  @GetMapping("/purchaseCount.do")
  @ResponseBody
  public int purchaseCount(PurchaseSearchVO svo, HttpSession session, JwtUtils util) throws IOException {
    UserVO userVO = util.getuser(session);
    
    svo.setUser_id(userVO.getUser_id());
    
    System.out.println("구매개수: " + svo);
    int count = service.purchaseCount(svo);
    return count;
  }
  
  @RequestMapping("/myPurchaseDetail.do") // 구매 상세보기
  public String purchaseDetail(OrdersVO vo, PurchaseSearchVO svo, PurchaseJoinVO pjvo, HttpSession session, JwtUtils util, Model model) throws Exception {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 

    UserVO userVO = util.getuser(session);

    svo.setUser_id(userVO.getUser_id());
    
    System.out.println("시퀀스 : " + vo.getOrders_seq());
    
    OrdersVO orderDetail = order.getMyOrderDetail(vo.getOrders_seq());
    System.out.println("주문상세 : " + orderDetail);
    
//   if(vo.getOrders_status() == "ready" || vo.getOrders_status() == "paid") {
//     service.purchaseCancel(vo); // 상태를 cancelwaitall 로 변경
//     System.out.println("상태 변경 : " + vo.getOrders_status());
//   }
   
    model.addAttribute("svo", svo);
    model.addAttribute("orderDetail", orderDetail);
    
    return "my_OrderDetail";
  }
  
  @RequestMapping("/purchaseCancel.do")
  @ResponseBody
  public void purchaseCancel(OrdersVO vo, HttpSession session, JwtUtils util) throws IOException {
    UserVO userVO = util.getuser(session);
    
    vo.setUser_id(userVO.getUser_id());
    
    System.out.println(vo);
    
//    if(vo.getOrders_status() == "ready" || vo.getOrders_status() == "paid") {
    service.purchaseCancel(vo); // 상태를 cancelwaitall 로 변경
    System.out.println("번호 : " + vo.getOrders_seq());
    System.out.println("상태 변경 : " + vo.getOrders_status());
//    }
    
  }
  
}
