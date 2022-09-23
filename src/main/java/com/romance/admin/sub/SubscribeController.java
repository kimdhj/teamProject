package com.romance.admin.sub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
