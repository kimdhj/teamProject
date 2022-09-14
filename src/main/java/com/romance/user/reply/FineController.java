package com.romance.user.reply;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class FineController {
  @Autowired
  FineService ser;
  @GetMapping("finein.do")
  @ResponseBody
  public String finein(FineVO vo, JwtUtils util,HttpSession session) throws IOException {
   UserVO vou= util.getuser(session);
   if(vou!=null) {
   vo.setUser_id(vou.getUser_id());
   System.out.println("인서트"+vo);
   ser.finein(vo);
   return "success";
   }else{
     return "fail";
   }
 
  }
  @GetMapping("finedel.do")
  @ResponseBody
  public String finedel(FineVO vo,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou= util.getuser(session);
    if(vou!=null) {
    vo.setUser_id(vou.getUser_id());
    ser.finedel(vo);
    return "success";
    }else{
      return "fail";
    }
  }
}
