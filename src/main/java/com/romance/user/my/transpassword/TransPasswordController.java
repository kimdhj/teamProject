package com.romance.user.my.transpassword;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class TransPasswordController {
  @GetMapping("mytranspassword.do")
  public String mytranspassword(JwtUtils util,HttpSession session) throws IOException {
    UserVO vo=util.getuser(session);
    if(vo==null) {
      return "redirect:index.do";
    }
    return "my_TransPassword";
  }
  @PostMapping("mytranspassword.do")
  public String mytranspasswordpost(JwtUtils util,HttpSession session) throws IOException {
    UserVO vo=util.getuser(session);
    if(vo==null) {
      return "redirect:index.do";
    }
    return "my_TransPassword";
  }
}
