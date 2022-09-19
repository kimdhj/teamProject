package com.romance.admin.trade;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminTradeController {
  @GetMapping("tradeordersdetail.mdo")
  public String ordersdetail() {
    return "admin_trade_orders";
  }
  @GetMapping("admintrade.mdo")
  public String admintrade() {
    return "admin_trade";
  }
  @GetMapping("admintradebooklist.mdo")
  public String admin_trade_booklist() {
    return "admin_trade_booklist";
  }
  @GetMapping("admintradecancel.mdo")
  public String admintradecancel() {
    return "admin_trade_cancel.";
  }
}
