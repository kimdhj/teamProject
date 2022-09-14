package com.romance.user.concernwriter;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class ConcernController {
  @Autowired
  ConcernService ser;
  
  @GetMapping("concernin.do")
  @ResponseBody
  public String concernin(ConcernWriterVO vo, JwtUtils util, HttpSession session) throws IOException {
    UserVO vos = util.getuser(session);
    if (vos != null) {
      vo.setUser_id(vos.getUser_id());
      int count=ser.concernin(vo);
      if(count==0) {
        return "yes";
      }else {
        return "no";
      }
      
    } else {
      return "fail";
    }
  }
}
