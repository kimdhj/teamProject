package com.romance.user.orders;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class PurchaseController {
  @Autowired
  private OrderService service;
 
  @RequestMapping("/myPurchase.do") // 구매 목록가기
  public String purchase(HttpSession session, JwtUtils util, OrdersVO vo, Model model, PurchaseSearchVO svo, PurchaseJoinVO pjvo) throws IOException {
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
  public String purchaseDetail() {
    
    return "my_PurchaseDetail";
  }
  
}
