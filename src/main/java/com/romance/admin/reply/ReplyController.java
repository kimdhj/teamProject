package com.romance.admin.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReplyController {
  @Autowired
  private ReplyService service;
  
  // 전체 List - 조인 값이 필요하니깐 !
  @GetMapping("/ReplyList.mdo")
  public String getReplyList(ReplyVO vo, Model model, ReplySearchVO svo, ReplyJoinVO rjvo) {
    List<ReplyJoinVO> replyList = service.getReplyList(svo);
    model.addAttribute("replyList", replyList);
    
//    System.out.println(replyList);
    
    int count = service.getCount(svo);
    model.addAttribute("count", count - (svo.getPage() - 1) * 5);
    if (count % 5 == 0) {
      count--;
    }
    
    if (svo.getPage() < 3) {
      model.addAttribute("startpage", 1);
    } else {
      model.addAttribute("startpage", svo.getPage() - 2);
    }
    if (svo.getPage() + 2 > count / 5 + 1) {
      model.addAttribute("endpage", count / 5 + 1);
    } else {
      model.addAttribute("endpage", svo.getPage() + 2);
    }
    
    System.out.println("count : " + count);
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count);
    model.addAttribute("allPage", svo.getPage());
    model.addAttribute("allSvo", svo);
    
    return "admin_post_Review";
  }
  
  @GetMapping("/replyList.mdo")
  @ResponseBody
  public List<ReplyJoinVO> replyList(ReplySearchVO svo){
    List<ReplyJoinVO> replyList = service.getReplyList(svo);
    return replyList;
  }
  
  @GetMapping("/replyCount.mdo")
  @ResponseBody
  public int replyCount(ReplySearchVO svo) {
    int count = service.getCount(svo);
    return count;
  }
  
  // Delete
  @GetMapping("/ReplyDelete.mdo")
  public String delete(ReplyVO vo) {
    System.out.println("replyDelete : " + vo);
    service.delete(vo);
    return "redirect:ReplyList.mdo";
  }
  
  // CheckBox Delete 
  // 체크박스 선택하면 삭제할 수 있도록하는데, String 으로 List 로 받아주기
  // int 로 형 변환시켜준 다음, mybatis 에서 쿼리문 진행 후 값 리턴
  @GetMapping("/replyChkbox.mdo")
  @ResponseBody
  public String chkboxDelete(@RequestParam(value="reply_seq[]", required = false) List<String> reply_seq) {
    System.out.println("checkBoxDeleteSeq : " + reply_seq);

    service.chkboxDelete(reply_seq);
    return null;
  }
  
  // Blind 처리 0 -> 1
  @GetMapping("/ReplyBlind.mdo")
  public String blind(ReplyVO vo) {
      service.blind(vo);
      
//    vo = service.getReply(vo);
//     if(vo.isUser_blank() == false) {
//       service.blind(vo);
//     }
     
    return "redirect:ReplyList.mdo";
  }
  
  //Blind 처리 해제 1 -> 0
  @GetMapping("/ReplyBlindCancel.mdo")
  public String blindCancel(ReplyVO vo) {
    System.out.println("블라인드 해제 " + vo);
    
    service.blindCancel(vo);
    
    return "redirect:ReplyList.mdo";
  }
  
  @GetMapping("/chkboxBlind.mdo")
  @ResponseBody
  public String chkboxBlind(@RequestParam(value="reply_seq[]") List<String> reply_seq) {
    service.chkboxBlind(reply_seq);
    return null;
  }
  
  @GetMapping("/chkboxBlindCancel.mdo")
  @ResponseBody
  public String chkboxBlindCancel(@RequestParam(value = "reply_seq[]") List<String> reply_seq) {
    service.chkboxBlindCancel(reply_seq);
    return null;
  }
  
  
  
  
}
