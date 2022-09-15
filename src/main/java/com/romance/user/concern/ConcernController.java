package com.romance.user.concern;

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

@Controller
public class ConcernController {
  @Autowired
  ConcernService ser;
  
  @GetMapping("/concernin.do")
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
  @GetMapping("/mywriter.do")
  public String myConcertWriter(ConcernSearchVO vo,JwtUtils util,HttpSession session,String pages,Model model) throws IOException  {
   UserVO vou= util.getuser(session);
   if(vou==null) {
     return "redirect:index.do";
   }
   
   vo.setUser_id(vou.getUser_id());
if(vo.getPage()==0) {
  vo.setPage(1);
}
   
    int count=ser.concerncount(vo);
    List<ConcernWriterVO> list=ser.concernall(vo);
    list=ser.getautor(list);
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
      model.addAttribute("endpage",vo.getPage()+2);
    }
    model.addAttribute("count",count-((vo.getPage()-1)*5));
    model.addAttribute("maxpage",(int)count/5+1);
    model.addAttribute("vo",vo);
    model.addAttribute("list",list);
    System.out.println(vo.getPage());
    
    return "my_ConcertWriter";
  }
  @GetMapping("concernlist.do")
  @ResponseBody
  public List<ConcernWriterVO>concernlist(ConcernSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    UserVO vou= util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    List<ConcernWriterVO> list=ser.concernall(vo);
    list=ser.getautor(list);
    return list;
  }
  @GetMapping("concerncount.do")
  @ResponseBody
  public int concerncount(ConcernSearchVO vo,JwtUtils util,HttpSession session) throws IOException{
    UserVO vou= util.getuser(session);
    vo.setUser_id(vou.getUser_id());
    if(vo.getPage()==0) {
      vo.setPage(1);
    }
    int count=ser.concerncount(vo);
    if(count%5==0) {
      count-=1;
    }
    return count;
  } 
  @GetMapping("concerndel.do")
  @ResponseBody   
  public void concerndel(@RequestParam("author_seq[]")List<Integer> author_seq,JwtUtils util,HttpSession session) throws IOException {
    UserVO vo=util.getuser(session);
    ser.concerndel(author_seq, vo.getUser_id());
  }

 
  
}
