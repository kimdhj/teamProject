package com.romance.admin.sub;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.subUtil.subscancel;
import com.romance.user.subUtil.subsche;

@Controller
@SessionAttributes("subscribe")
public class SubscribeController {
  
  @Autowired
  private SubscribeService subscribeService;
  
  @RequestMapping("/getSubInfo.mdo")
  public String getSubInfo(SubscribeVO vo, Model model) {
    model.addAttribute("subscribe", subscribeService.getSub(vo));
    return "admin_marketing_Sub";
  }
  
  @RequestMapping(value = "/updateSubInfo.mdo", method = RequestMethod.POST)
  public String updateSub(SubscribeVO vo) {
    subscribeService.updateSub(vo);
    return "redirect:getSubInfo.mdo";
  }
  
  @GetMapping("/mysubpay.do")
  public String mysubpay(Model model, JwtUtils util, HttpSession session) throws IOException {
    UserVO vo = util.getuser(session);
    model.addAttribute("user", vo);
    return "my_SubPay";
  }
  
  @PostMapping("/subreg.do")
  @ResponseBody
  public int subreg(@RequestParam("cuid") String cuid, subsche sc) throws Exception {
    System.out.println("subreg " + cuid);
    UUID ran = UUID.randomUUID();
    
    sc.subpay(cuid, cuid + "|" + ran.toString());
    // 테이블에 시간 밀리세컨드로 만든거 넣기 + 개월수 1로 바꾸기
    return 1;
  }
  
  @PostMapping("/subcancel.do")
  @ResponseBody
  public int subcancel(String cuid, subscancel sc) throws Exception {
    // 테이블에 시간 밀리세컨드로 만든거 지우기
    sc.subpay(cuid);
    return 1;
  }
  
  @PostMapping("/subrepay.do")
  @ResponseBody
  public void subrepay(@RequestBody JSONObject json, subsche sc) throws Exception {
    System.out.println("구독 재결제");
    System.out.println(json);
    System.out.println(json.get("merchant_uid"));
    
    String mid = (String) json.get("merchant_uid");
    if (!mid.contains("_")) {
      int ind = mid.indexOf("|");
      System.out.println("결과물12" + mid.substring(0, ind));
      String cuid = mid.substring(0, ind);
      UUID ran = UUID.randomUUID();
      
      sc.subpay(cuid, cuid + "|" + ran.toString());
      
    }
    
  }
  
}
