package com.romance.admin.reply;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.security.JwtUtils;
import com.romance.user.book.BookVO;
import com.romance.user.login.UserVO;
import com.romance.user.orders.OrderBookListVO;
import com.romance.user.orders.PurchaseJoinVO;

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
  
  // 들어가는 페이지
  @RequestMapping("/myreviewInsert.do")
  public String reviewInsert(BookVO bvo, ReplyVO vo, PurchaseJoinVO blvo , ReplyJoinVO rjvo, Model model, HttpSession session, JwtUtils util) throws IOException {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 
    UserVO userVO = util.getuser(session);

//    System.out.println("insertVOVOVOVO : " + vo);
//    System.out.println("blvo : " + blvo);

    rjvo.setUser_id(userVO.getUser_id());
    
//    System.out.println("정보 가져갈 번호 = " + bvo.getBook_seq());
//    System.out.println("책 정보 = " + service.getBookInfo(bvo));
    
//    System.out.println();
//    System.out.println("review rjvo === " + rjvo + "\n");
    
    model.addAttribute("info", service.getBookInfo(bvo)); 
    model.addAttribute("bs", blvo);
//    model.addAttribute("reply", rjvo); // 리뷰 쓰려고 책 정보를 보내줄 때 써줘야되는 코드
    
    return "my_PurchaseReview";
  }
  
  // 입력해서 등록하는 페이지
  @PostMapping("/replyInsert.do")
  public String replyInsert( ReplyVO vo, HttpSession session, JwtUtils util, OrderBookListVO blvo) throws IOException {
    UserVO userVO = util.getuser(session);
    
    System.out.println("replyInsertVO : " + vo);
    System.out.println("replyInsertBLVO : " + blvo);
    
    vo.setUser_id(userVO.getUser_id());
    
    service.insert(vo); 
    service.reviewStateUpdate(blvo); // review_complete 를 1 로 바꿔서 리뷰 작성한 것으로 만들어주기
    
    
    return "redirect:bookdetail.do?book_seq=" + vo.getBook_seq();
  }
  
  @RequestMapping("/myreviewUpdate.do")
  public String goUpdate(HttpSession session, ReplyJoinVO rjvo, JwtUtils util, Model model, ReplyVO vo, BookVO bvo) throws IOException {
    
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 

    UserVO userVO = util.getuser(session);
    
    System.out.println();
    System.out.println("update 사이트 왔다아아");
    System.out.println("rjvo = " + rjvo);
    System.out.println(service.doubleReply(rjvo));
//    System.out.println(service.getBookInfo(bvo));
    System.out.println();
    
    vo.setUser_id(userVO.getUser_id());
    
    model.addAttribute("info", service.getBookInfo(bvo));
    model.addAttribute("reply", service.doubleReply(rjvo));
//    model.addAttribute("bs", blvo);
    
    return "my_PurchaseReviewUpdate";
  }
  
  @PostMapping("/replyUpdate.do")
  public String replyUpdate(ReplyVO vo, HttpSession session, JwtUtils util, Model model) throws IOException {
    UserVO userVO = util.getuser(session);
    
    System.out.println();
//    System.out.println("replyUpdate : " +  vo);
    System.out.println();
    
    vo.setUser_id(userVO.getUser_id());
    
    service.reviewUpdate(vo);
    
//    return "redirect:bookdetail.do?book_seq=" + vo.getBook_seq();
    return "redirect:movingReview.do";
  }
  
  
}
