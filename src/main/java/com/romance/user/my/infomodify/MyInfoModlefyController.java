package com.romance.user.my.infomodify;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;

@Controller
public class MyInfoModlefyController {
  @Autowired
  MyInfoService ser;
  @Autowired
  UserService seru;
  @Autowired
  BCryptPasswordEncoder benco;
  //비밀번호 확인 진입
  @GetMapping("myinfoin.do")
  public String myinfoin(Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
    
    model.addAttribute("user",vou);
    return "my_Password";
  }
  
  //비밀번호확인
  @PostMapping("myinfoin.do")
  public String myinfoinpost(UserVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {
      return "redirect:index.do";
    }
    System.out.println("myinfoin"+vo);
    String pass=ser.passwordsearch(vou);
    boolean re=benco.matches(vo.getUser_password(), pass);
    if(re==true) {
      return "redirect:myinfo.do";
    }else {
      return "redirect:myinfoin.do";
    }
   
  }
  //개인정보 변경 입력
  @GetMapping("myinfo.do")
  public String myinfo(Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
    System.out.println("유저정보"+vou);
    model.addAttribute("user",vou);
    return "my_InfoModify";
  }
  //개인정보 변경
  @PostMapping("myinfopost.do")
  public String myinfopost(UserVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
    System.out.println("myinfopost"+vo);
    vo.setUser_id(vou.getUser_id());
    session.removeAttribute("id");
    ser.infomod(vo);
    vou = seru.onesearch(vou.getUser_id());
    String token = util.createToken("유저", vou);
    session.setAttribute("id", token);
    return "redirect:myinfo.do";
  }
}
