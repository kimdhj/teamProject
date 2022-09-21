package com.romance.admin.reply;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class UserReplyController {
  @Autowired
  private ReplyService service;
  
//  @RequestMapping("/myreviewInsert.do")
//  public String reviewInsert(ReplyVO vo, ReplyJoinVO rjvo, JwtUtils util, HttpSession session, Model model) throws IOException {
//    UserVO userVO = util.getuser(session); // 로그인 체크 여부를 따지는 것
//    
//    if(userVO == null) {
//      return "redirect:index.do";
//    }
//    
////    service.insert(vo); 
//    
//    model.addAttribute("user", userVO);
//    model.addAttribute("replyJoin", rjvo); // 리뷰 쓰려고 책 정보를 보내줄 때 써줘야되는 코드
//    
//    return "my_PurchaseReview";
//  }
  
  @RequestMapping("/myreviewInsert.do")
  public String reviewInsert(ReplyVO vo, ReplyJoinVO rjvo, Model model) throws IOException {
    
    
//    service.insert(vo); 
    
    model.addAttribute("replyJoin", rjvo); // 리뷰 쓰려고 책 정보를 보내줄 때 써줘야되는 코드
    
    return "my_PurchaseReview";
  }
  
  
  
}
