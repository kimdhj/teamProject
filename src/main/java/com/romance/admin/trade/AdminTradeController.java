package com.romance.admin.trade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.author.AdminAuthorVO;

@Controller
public class AdminTradeController {
  @Autowired
  TradeService ser;
  @GetMapping("tradeordersdetail.mdo")
  public String ordersdetail() {
  
    return "admin_trade_orders";
  }
  @GetMapping("admintrade.mdo")
  public String admintrade(TradeSearchVO vo,Model model) {
    
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
  public String admin_trade_booklist(TradeJoinVO vo,Model model) {
    System.out.println("주문별개"+vo);
    TradeJoinVO voj=ser.booklistdetail(vo.getOrder_bookList_seq());
    model.addAttribute("voj", voj);
    return "admin_trade_booklist";
  }
  @GetMapping("delorderbooklist.mdo")
  public String delorderbooklist(TradeJoinVO vo) throws Exception {
    System.out.println("삭제 vo"+vo);
    ser.delorderbooklist(vo);
    return "redirect:admintradebooklist.mdo?order_bookList_seq="+vo.getOrder_bookList_seq();
    
  }
  @GetMapping("admintradecancel.mdo")
  public String admintradecancel() {
    return "admin_trade_cancel.";
  }
}
