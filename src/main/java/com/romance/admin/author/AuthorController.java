package com.romance.admin.author;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.my.delivery.DeliveryVO;

@Controller
public class AuthorController {
  @Autowired
  AdminAuthorService ser;
  @GetMapping("adminauthor.mdo")
  public String adminauthor(AdminAuthorSearchVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
   
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.adminauthorcount(vo);
    List<AdminAuthorVO> list=ser.adminauthorlist(vo);
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
    
    return "admin_author";
  }
  @GetMapping("adminauthorlist.mdo")
  @ResponseBody
  public List<AdminAuthorVO> adminauthorlist(AdminAuthorSearchVO vo){
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    return ser.adminauthorlist(vo);
    
  }
  @GetMapping("adminauthorcount.mdo")
  @ResponseBody
  public int adminauthorcount(AdminAuthorSearchVO vo){
    
    int count=ser.adminauthorcount(vo)-1;
    return count;
    
  }
  @GetMapping("adminauthordel.mdo")
  @ResponseBody
  public String adminauthordel(AdminAuthorVO vo){
    ser.adminauthordelete(vo);
    return "suc";
    
  }
  @GetMapping("adminauthordellist.mdo")
  @ResponseBody
  public String adminauthordellist(@RequestParam("auth_seq[]")List<Integer> auth_seq){
    ser.dellist(auth_seq);
    return "suc";
    
  }
  @GetMapping("adminauthorupdate.mdo")
  @ResponseBody
  public String adminauthorupdate(@RequestParam("auth_seq[]")List<Integer> auth_seq,@RequestParam("auth_name[]")List<String> auth_name){
    ser.updatelist(auth_seq,auth_name);
    return "suc";
  }
  @GetMapping("adminauthorcreate.mdo")
  @ResponseBody
  public String  adminauthorcreate(AdminAuthorVO vo){
    System.out.println(vo);
    ser.adminauthorcreate(vo);
    return "suc";
  }
 
  
}
