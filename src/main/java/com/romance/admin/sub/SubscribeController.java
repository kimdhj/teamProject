package com.romance.admin.sub;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@SessionAttributes("subscribe")
public class SubscribeController {
  
  @Autowired
  private SubscribeService subscribeService;
  
  @RequestMapping("/getSubInfo.mdo")
  public String getSubInfo(SubscribeVO vo, Model model,JwtUtils util, HttpSession session) throws IOException {

    UserVO vosession = util.getuser(session);
   if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
     return "redirect:admin_login.mdo";
   }


    model.addAttribute("subscribe", subscribeService.getSub(vo));
    return "admin_marketing_Sub";
  }
  
  @RequestMapping(value = "/updateSubInfo.mdo", method = RequestMethod.POST)
  public String updateSub(SubscribeVO vo) {
    subscribeService.updateSub(vo);
    return "redirect:getSubInfo.mdo";
  }
  
  
}
