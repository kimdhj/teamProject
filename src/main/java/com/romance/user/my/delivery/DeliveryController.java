package com.romance.user.my.delivery;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.coupon.CouponVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;
@Controller
public class DeliveryController {
  @Autowired
  DeliveryService ser;
  @Autowired
  UserService seru;
  @GetMapping("mydelivery.do")
  public String mydelivery(DeliveryVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:index.do";
      } 

    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
    vo.setUser_id(vou.getUser_id());
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.deliverycount(vo);
    List<DeliveryVO> list=ser.deliverylist(vo);
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
    
    
   
   
    return "my_MyAddress";
  }
  @GetMapping("deliverylist.do")
  @ResponseBody
  public List<DeliveryVO> deliverlist(DeliveryVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
  
    vo.setUser_id(vou.getUser_id());
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    return ser.deliverylist(vo);
  }
  @GetMapping("deliverycount.do")
  @ResponseBody
  public int deliverycount(DeliveryVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.deliverycount(vo);;
    if(count%5==0) {
      count--;
    }
    return count;
  }
  @GetMapping("deliverydel.do")
  @ResponseBody
  public int deliverydel(@RequestParam("delivery_seq[]") List<Integer> delivery_seq) throws IOException {
    System.out.println("삭제리스트"+delivery_seq);
    ser.deldelivery(delivery_seq);
   
   
    return 0;
  }
  @GetMapping("indelivery.do")
  @ResponseBody
  public int indelivery(DeliveryVO vo,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    System.out.println("추가하는 vo"+vo);
    ser.indelivery(vo);
   
   
    return 0;
  }
  @GetMapping("onsdelivery.do")
  @ResponseBody
  public int onsdelivery(DeliveryVO vo,JwtUtils util,HttpSession session) throws IOException {
  
    
    ser.onsdelivery(vo);
    UserVO vou=util.getuser(session);
   
   vou = seru.onesearch(vou.getUser_id());
   vou.setUser_password(null);
    String token = util.createToken("유저", vou);
    session.removeAttribute("id");
    session.setAttribute("id", token);
   
    return 0;
  }
}
