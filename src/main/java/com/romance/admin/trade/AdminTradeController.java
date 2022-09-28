package com.romance.admin.trade;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.OrdersVO;

@Controller
public class AdminTradeController {
  @Autowired
  TradeService ser;
  @GetMapping("tradeordersdetail.mdo")
  public String ordersdetail(OrdersVO vo,Model model,JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    vo=ser.ordersdetail(vo.getOrders_seq());
    System.out.println("orders상세 : "+vo);
    System.out.println("책정보 : "+ser.booklistsel(vo.getOrders_seq()));
    model.addAttribute("vo", vo);
    model.addAttribute("books",ser.booklistsel(vo.getOrders_seq()));
  
    return "admin_trade_orders";
  }
  @GetMapping("admintrade.mdo")
  public String admintrade(TradeSearchVO vo,Model model,JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.maincount(vo);
    List<TradeJoinVO> list=ser.mainlist(vo);
    System.out.println("갯수"+count);
    System.out.println("요소"+list);
    
    if(count%5==0) {
      count-=1;
    }
    if(vo.getPage()<3) {
      model.addAttribute("startpage", 1);
    }else {
      model.addAttribute("startpage", vo.getPage()-2);
    }
    if(vo.getPage()+2>(count/5)+1) {
      System.out.println(count);
      model.addAttribute("endpage", count/5+1);
    }else {
      System.out.println("el"+count);
      model.addAttribute("endpage", vo.getPage()+2);
    }
    model.addAttribute("count",count-((vo.getPage()-1)*5));
    model.addAttribute("maxpage",(int)count/5+1);
    model.addAttribute("max",count);
    model.addAttribute("vo",vo);
    model.addAttribute("list",list);
    System.out.println(vo);
    return "admin_trade";
  }
  @GetMapping("admintrademainlist.mdo")
  @ResponseBody
  public List<TradeJoinVO> admintrademainlist(TradeSearchVO vo){
    System.out.println("메인리스트"+ser.mainlist(vo));
    return ser.mainlist(vo);
  }
  @GetMapping("admintrademaincount.mdo")
  @ResponseBody
  public int admintrademaincount(TradeSearchVO vo){
    System.out.println("count"+vo);
    int count=ser.maincount(vo);
    System.out.println("count"+count);
    if(count%5==0) {
      count-=1;
    }
    return count;
  }
  
  @GetMapping("admintradebooklist.mdo")
  public String admin_trade_booklist(TradeJoinVO vo,Model model,JwtUtils util, HttpSession session) throws IOException {

    UserVO vosession = util.getuser(session);
   if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
     return "redirect:admin_login.mdo";
   }
    System.out.println("주문별개"+vo);
    TradeJoinVO voj=ser.booklistdetail(vo.getOrder_bookList_seq());
    model.addAttribute("voj", voj);
    return "admin_trade_booklist";
  }
  @GetMapping("delorderbooklist.mdo")
  public String delorderbooklist(TradeJoinVO vo) throws Exception {
    System.out.println("삭제 vo"+vo);
    ser.delorderbooklist(vo);
    return "redirect:admintradecancel.mdo";
    
  }
 
  @GetMapping("chebookseq.mdo")
  @ResponseBody
  public int chebookseq(int book_seq) {
    return ser.chebookseq(book_seq);
  }
  @GetMapping("adminordersdel.mdo")
  public String adminordersdel(TradeJoinVO vo) throws Exception {
    System.out.println("adminordersdel"+vo);
    ser.dellevel(vo);
    return "redirect:admintrade.mdo";
    
  }
  @PostMapping("adminordersmod.mdo")
  public String adminordersmod(OrdersVO vo,@RequestParam(value = "book_seq",required=false)List<Integer> book_seq,@RequestParam(value = "book_count",required=false)List<Integer> book_count,JwtUtils util, HttpSession session) throws Exception {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    System.out.println("vo수정"+vo);
   System.out.println("vo수정"+book_seq);
   System.out.println("vo수정"+book_count);
   List<OrderBookListVO> vol=new ArrayList<OrderBookListVO>();
   if(book_seq!=null) {
   for(int i= 0;i<book_seq.size();i++) {
     OrderBookListVO lvo=new OrderBookListVO();
     lvo.setBook_seq(book_seq.get(i));
     lvo.setOrder_bookList_count(book_count.get(i));
     lvo.setOrders_seq(vo.getOrders_seq());
     vol.add(lvo);
   }
   ser.booklistin(vol);
   }
   ser.updateorders(vo);
   System.out.println("끝 확인"+vo.getOrders_status().trim().equals("cancelallfinish"));
   if(vo.getOrders_status().trim().equals("cancelallfinish")) {
     return"redirect:admintrade.mdo";
   }
    return "redirect:tradeordersdetail.mdo?orders_seq="+vo.getOrders_seq();
  }
  //취소 리스트
  @GetMapping("admintradecancel.mdo")
  public String admintradecancel(TradeSearchVO vo,Model model,JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }


    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.cancelcount(vo);
    List<TradeJoinVO> list=ser.cancellist(vo);
    System.out.println("갯수"+count);
    System.out.println("요소"+list);
    
    if(count%5==0) {
      count-=1;
    }
    if(vo.getPage()<3) {
      model.addAttribute("startpage", 1);
    }else {
      model.addAttribute("startpage", vo.getPage()-2);
    }
    if(vo.getPage()+2>(count/5)+1) {
      System.out.println(count);
      model.addAttribute("endpage", count/5+1);
    }else {
      System.out.println("el"+count);
      model.addAttribute("endpage", vo.getPage()+2);
    }
    model.addAttribute("count",count-((vo.getPage()-1)*5));
    model.addAttribute("maxpage",(int)count/5+1);
    model.addAttribute("max",count);
    model.addAttribute("vo",vo);
    model.addAttribute("list",list);
    System.out.println(vo);
    return "admin_trade_cancel";
  }
  @GetMapping("admintradecancellist.mdo")
  @ResponseBody
  public List<TradeJoinVO> admintradecancellist(TradeSearchVO vo){
    System.out.println("메인리스트"+ser.cancellist(vo));
    return ser.cancellist(vo);
  }
  @GetMapping("admintradecancelcount.mdo")
  @ResponseBody
  public int admintradecancelcount(TradeSearchVO vo){
    System.out.println("count"+vo);
    int count=ser.cancelcount(vo);
    System.out.println("count"+count);
    if(count%5==0) {
      count-=1;
    }
    return count;
  }
}
