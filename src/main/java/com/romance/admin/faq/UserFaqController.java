package com.romance.admin.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.qna.AskReplyVO;
import com.romance.admin.qna.AskSearchVO;
import com.romance.admin.qna.AskService;
import com.romance.admin.qna.AskVO;

@Controller
public class UserFaqController {
  @Autowired
  private FaqService service;
  
  @Autowired
  private AskService askService;
  
  @GetMapping("/cs.do")
  public String faq(FaqSearchVO svo, Model model, AskSearchVO asvo, AskVO avo) {
    
    List<AskVO> askList = askService.getAskList(asvo);
    model.addAttribute("askList", askList);
    
    int count = askService.getCount(asvo);
    model.addAttribute("count", count - (asvo.getPage() - 1) * 5);
    if (count % 5 == 0) {
      count--;
    }
    
    if (asvo.getPage() < 3) {
      model.addAttribute("startpage", 1);
    } else {
      model.addAttribute("startpage", asvo.getPage() - 2);
    }
    if (asvo.getPage() + 2 > count / 5 + 1) {
      model.addAttribute("endpage", count / 5 + 1);
    } else {
      model.addAttribute("endpage", asvo.getPage() + 2);
    }
    
    System.out.println("count : " + count);
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count);
    model.addAttribute("allPage", asvo.getPage());
    model.addAttribute("allSvo", asvo);

//    // FAQ - 주문
//    List<FaqVO> orderlist = service.getOrderList(svo);
//    int Ocount = service.getOrderCount(svo);
//    
//    model.addAttribute("order", orderlist);
//    model.addAttribute("Ocount", Ocount - (svo.getPage() - 1)*5);
//    
//    if(Ocount % 5 == 0) {
//      Ocount--;
//    }
//    
//    if(svo.getPage()<3) {
//      model.addAttribute("orderstartpage", 1);
//    }else {
//      model.addAttribute("orderstartpage", svo.getPage()-2);
//    }
//    if(svo.getPage()+2>Ocount/5+1) {
//      model.addAttribute("orderendpage", Ocount/5+1);
//    }else {
//      model.addAttribute("orderendpage", svo.getPage()+2);
//    }
//    
//    System.out.println("Ocount : " + Ocount);
//    
//    model.addAttribute("Opage", Ocount / 5 + 1);
//    model.addAttribute("OallCount", Ocount); // 전체 공지사항 개수
//    model.addAttribute("OallPage", svo.getPage()); // 전체 페이지
//    model.addAttribute("OallSvo", svo); // 검색할 내용 넘겨주기
//    
//    // FAQ 배송
//    List<FaqVO> deliverylist = service.getDeliveryList(svo);
//    int Dcount = service.getDeliveryCount(svo);
//    
//    model.addAttribute("delivery", deliverylist);
//    model.addAttribute("Dcount", Dcount - (svo.getPage() - 1)*5);
//    
//    if(Dcount % 5 == 0) {
//      Dcount--;
//    }
//    
//    if(svo.getPage()<3) {
//      model.addAttribute("deliverystartpage", 1);
//    }else {
//      model.addAttribute("deliverystartpage", svo.getPage()-2);
//    }
//    if(svo.getPage()+2>Ocount/5+1) {
//      model.addAttribute("deliveryendpage", Dcount/5+1);
//    }else {
//      model.addAttribute("deliveryendpage", svo.getPage()+2);
//    }
//    
//    System.out.println("Dcount : " + Dcount);
//    
//    model.addAttribute("Dpage", Dcount / 5 + 1);
//    model.addAttribute("DallCount", Dcount); // 전체 공지사항 개수
//    model.addAttribute("DallPage", svo.getPage()); // 전체 페이지
//    model.addAttribute("DallSvo", svo); // 검색할 내용 넘겨주기
//    
//    // FAQ 반품
//    List<FaqVO> changelist = service.getChangeList(svo);
//    int Ccount = service.getChangeCount(svo);
//    
//    model.addAttribute("change", changelist);
//    model.addAttribute("Ccount", Ccount - (svo.getPage() - 1)*5);
//    
//    if(Ccount % 5 == 0) {
//      Ccount--;
//    }
//    
//    if(svo.getPage()<3) {
//      model.addAttribute("changestartpage", 1);
//    }else {
//      model.addAttribute("changestartpage", svo.getPage()-2);
//    }
//    if(svo.getPage()+2>Ocount/5+1) {
//      model.addAttribute("changeendpage", Ccount/5+1);
//    }else {
//      model.addAttribute("changeendpage", svo.getPage()+2);
//    }
//    
//    System.out.println("Ccount : " + Ccount);
//    
//    model.addAttribute("Ccount", Ccount / 5 + 1);
//    model.addAttribute("CallCount", Ccount); // 전체 공지사항 개수
//    model.addAttribute("CallPage", svo.getPage()); // 전체 페이지
//    model.addAttribute("CallSvo", svo); // 검색할 내용 넘겨주기
//    
//    // FAQ 회원
//    List<FaqVO> userlist = service.getUserList(svo);
//    int Ucount = service.getUserCount(svo);
//    
//    model.addAttribute("user", userlist);
//    model.addAttribute("Ucount", Ucount - (svo.getPage() - 1)*5);
//    
//    if(Ucount % 5 == 0) {
//      Ucount--;
//    }
//    
//    if(svo.getPage()<3) {
//      model.addAttribute("userstartpage", 1);
//    }else {
//      model.addAttribute("userstartpage", svo.getPage()-2);
//    }
//    if(svo.getPage()+2>Ocount/5+1) {
//      model.addAttribute("userendpage", Ucount/5+1);
//    }else {
//      model.addAttribute("userendpage", svo.getPage()+2);
//    }
//    
//    System.out.println("Ucount : " + Ucount);
//    
//    model.addAttribute("Upage", Ucount / 5 + 1);
//    model.addAttribute("UallCount", Ucount); // 전체 공지사항 개수
//    model.addAttribute("UallPage", svo.getPage()); // 전체 페이지
//    model.addAttribute("UallSvo", svo); // 검색할 내용 넘겨주기
//    
    return "notice_Cs";
  }
  
  // FAQ
  @GetMapping("/faqList.do")
  @ResponseBody
  public List<FaqVO> faqList(FaqSearchVO svo){
//    System.out.println(svo);
    List<FaqVO> faqList = service.getFaqList(svo);
    return faqList;
  }
  
  @GetMapping("/faqCount.do")
  @ResponseBody
  public int faqCount(FaqSearchVO svo) {
    int count = service.getCount(svo);
    return count;
  }
  
  // QnA
  @GetMapping("/qnaList.do")
  @ResponseBody
  public List<AskVO> qnaList(AskSearchVO svo) {
    List<AskVO> askList = askService.getAskList(svo);
    return askList;
  }
  
  @GetMapping("/qnaCount.do")
  @ResponseBody
  public int qnaCount(AskSearchVO svo) {
    int Qcount = askService.getCount(svo);
    return Qcount;
  }
  
  // 답변 대기
  @RequestMapping("/csDetail.do")
  public String QnaDetail(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo) {
    vo = askService.getAsk(vo);
    arvo = askService.getAskReply(arvo);
    
    System.out.println("답변대기(VO) : " + vo);
    
    if(arvo != null) {
      model.addAttribute("askReply", arvo);
      System.out.println("답변대기(ARVO) : " + arvo);
    }
    
    model.addAttribute("ask", vo);
    model.addAttribute("svo", svo);
    
    return "notice_CsDetail";
  }
  
  // 답변 완료
//  @GetMapping("/qnaDetail.do")
//  public String qnaDetail(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo) {
//    vo = askService.getAsk(vo);
//    arvo = askService.getAskReply(arvo);
//    
//    System.out.println("답변완료(VO) : " + vo);
//    System.out.println("답변완료(ARVO) : " + arvo);
//    
//    model.addAttribute("svo", svo);
//    model.addAttribute("ask", vo);
//    model.addAttribute("askReply", arvo);
//    
//    return "notice_CsDetail";
//  }
  
  
  
}
