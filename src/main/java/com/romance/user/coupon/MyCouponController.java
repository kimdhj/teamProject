package com.romance.user.coupon;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.coupon.CouponVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;
import com.romance.user.points.MyPointsSearchVO;
import com.romance.user.points.MyPointsVO;

@Controller
public class MyCouponController {
  @Autowired
  MyCouponService ser;
  
  @GetMapping("mycoupon.do")
  public String mycoupon(MyCouponSearchVO vo,MyPointsSearchVO vop,Model model,JwtUtils util,HttpSession session) throws IOException {
    UserVO vou=util.getuser(session);
    if (vou==null) {

      return "redirect:index.do";
    }
    vo.setUser_id(vou.getUser_id());
    vop.setUser_id(vou.getUser_id());
   
      if(vo.getPage()==0) {
        vo.setPage(1);
      }
      int count=ser.selcouponcounts(vo);
      List<MyCouponVO> list=ser.selusercoupon(vo);
      System.out.println(count);
      System.out.println(list);
      
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
      model.addAttribute("vo",vo);
      model.addAttribute("list",list);
      System.out.println(vo);
      //----------------------------------------------------------------
      if(vop.getPage()==0) {
        vop.setPage(1);
      }
      int countp=ser.selpointscount(vop);
      List<MyPointsVO> listp=ser.seluserpoints(vop);
      System.out.println(countp);
      System.out.println(listp);
      
      if(countp%5==0) {
        countp-=1;
      }
      if(vop.getPage()<3) {
        model.addAttribute("startpagep", 1);
      }else {
        model.addAttribute("startpagep", vop.getPage()-2);
      }
      if(vop.getPage()+2>(countp/5)+1) {
        System.out.println(countp);
        model.addAttribute("endpagep", countp/5+1);
      }else {
        System.out.println("elp"+countp);
        model.addAttribute("endpagep", vop.getPage()+2);
      }
      model.addAttribute("countp",count-((vop.getPage()-1)*5));
      model.addAttribute("maxpagep",(int)countp/5+1);
      model.addAttribute("vop",vop);
      model.addAttribute("listp",listp);
      System.out.println(vop);
  
    return "my_Coupon";
  }
  @GetMapping("mycouponlist.do")
  @ResponseBody
  public List<MyCouponVO> mycouponlist(MyCouponSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    return ser.selusercoupon(vo);
  }
  @GetMapping("mycouponcount.do")
  @ResponseBody
  public int mycouponcount(MyCouponSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    return ser.selcouponcounts(vo);
  }
  @GetMapping("mypointslist.do")
  @ResponseBody
  public List<MyPointsVO> mypointslist(MyPointsSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    System.out.println(vo);
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    return ser.seluserpoints(vo);
  }
  @GetMapping("mypointscount.do")
  @ResponseBody
  public int mypointscount(MyPointsSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    UserVO vou=util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    return ser.selpointscount(vo);
  }
  @GetMapping("couponadd.do")
  @ResponseBody
  public int couponadd(CouponVO vo,JwtUtils util,HttpSession session) throws IOException{
   UserVO vou= util.getuser(session);
  System.out.println("couponadd"+vo);
   if(vou!=null) {
    return ser.couche(vo,vou.getUser_id());
   }else {
     return -1;
   }
  }
}
