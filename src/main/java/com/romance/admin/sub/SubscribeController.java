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
  
  
}
