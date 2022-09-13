package com.romance.admin.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.server.AwsS3;

@Controller
public class AskController {
  @Autowired
  private AskService service;
  
  // List
  @GetMapping(value="/QnaList.mdo")
  public String getAskList(AskSearchVO svo, Model model) {
    
    List<AskVO> askList = service.getAskList(svo);
    model.addAttribute("askList", askList);
    
    int count = service.getCount(svo);
    model.addAttribute("count", count - (svo.getPage() - 1) * 5);
    if(count % 5 == 0) {
      count--;
    }
    
    if(svo.getPage() < 3) {
      model.addAttribute("startpage", 1);
    }else {
      model.addAttribute("startpage", svo.getPage() - 2);
    }
    if(svo.getPage() + 2 > count / 5 + 1) {
      model.addAttribute("endpage", count / 5 + 1);
    }else {
      model.addAttribute("endpage", svo.getPage() + 2);
    }
    
    System.out.println("count : " + count);
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count);
    model.addAttribute("allPage", svo.getPage());
    model.addAttribute("allSvo", svo);
    
    return "admin_post_Qna";
  }
  
  @GetMapping("/qnaList.mdo")
  @ResponseBody
  public List<AskVO> qnaList(AskSearchVO svo){
    List<AskVO> askList = service.getAskList(svo);
    return askList;
  }
  
  @GetMapping("/qnaCount.mdo")
  @ResponseBody
  public int qnaCount(AskSearchVO svo) {
    int count = service.getCount(svo);
    return count;
  }
  
  // Delete (List)
  @GetMapping(value = "/AskDelete.mdo") // 질문 삭제(질문 + 답변)
  public String delete(AskVO vo) {
    AskReplyVO arvo = new AskReplyVO();
    System.out.println("AskDelete : " + vo);
    
    if(vo.getAsk_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
      String key = vo.getAsk_file();
      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
      String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
      
      System.out.println("key : " + fileName);
      
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.delete(fileName);
      System.out.println(fileName);
    }
    
    if(arvo != null) {
     if(arvo.getAsk_reply_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
        String key = arvo.getAsk_reply_file();
        String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
        String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
        
        System.out.println("key : " + fileName);
        
        AwsS3 awsS3 = AwsS3.getInstance();
        awsS3.delete(fileName);
        System.out.println(fileName);
      }
     service.delete2(arvo);
    }
    
    service.delete1(vo);
    return "redirect:QnaList.mdo";
  }
  
  @GetMapping(value = "/AskReplyDelete.mdo") // 답변 삭제
  public String delete(AskReplyVO arvo) { 
    
    if(arvo.getAsk_reply_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
      String key = arvo.getAsk_reply_file();
      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
      String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
      
      System.out.println("key : " + fileName);
      
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.delete(fileName);
      System.out.println(fileName);
    }
    
    service.delete2(arvo);
    return "redirect:QnaList.mdo";
  }
  
  @GetMapping(value = "/qnaChkbox.mdo")
  @ResponseBody
  public String chkboxDelete(@RequestParam(value = "ask_seq[]") List<String> ask_seq, AskReplyVO arvo) {
    System.out.println("checkDelete : " + ask_seq);
    System.out.println("arvo(체크박스 삭제) : " + arvo);
    service.chkboxDelete1(ask_seq);
    
    if(arvo != null) {
      service.chkboxDelete2(ask_seq);
    }
    
    return null;
  }
  
  // Detail - 답변 대기
  @GetMapping(value = "/QnaDetail.mdo")
  public String getDetail1(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo) {
    vo = service.getAsk(vo);
    arvo = service.getAskReply(arvo);
    
    System.out.println("답변 대기 " + arvo);
    String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
    
    if(vo.getAsk_file() != null) {
      String one = vo.getAsk_file().replaceAll(uploadFolder, "");
      int dot = one.indexOf(".");
      one = one.substring(0, dot);
      System.out.println(one);
      model.addAttribute("one", one);
    }
    
    model.addAttribute("svo", svo);
    model.addAttribute("ask", vo);
    model.addAttribute("askReply", arvo);
    
    return "admin_post_QnaDetail";
  }
  
  // Detail - 답변 완료 (오류나는 이유가 답변 완료인데, 답변이 없기 때문에)
  @GetMapping(value = "qnaDetail.mdo")
  public String getDetail2(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo) {
    vo = service.getAsk(vo);
    arvo = service.getAskReply(arvo);
    
    System.out.println("답변 완료 " + arvo);
    String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
    
    if(vo.getAsk_file() != null) {
      String one = vo.getAsk_file().replaceAll(uploadFolder, "");
      int dot = one.indexOf(".");
      one = one.substring(0, dot);
      System.out.println(one);
      model.addAttribute("one", one);
    }
    
    if(arvo.getAsk_reply_file() != null) {
      String one = arvo.getAsk_reply_file().replaceAll(uploadFolder, "");
      int dot = one.indexOf(".");
      one = one.substring(0, dot);
      System.out.println(one);
      model.addAttribute("one", one);
    }
    
    model.addAttribute("svo", svo);
    model.addAttribute("ask", vo);
    model.addAttribute("askReply", arvo);
    
    return "admin_post_QnaDetail";
  }
  
  // checkPW
  @PostMapping(value = "/QnaCheckPW.mdo")
  @ResponseBody
  public String checkPW(AskReplyVO arvo, Model model) {
    System.out.println("checkPW : " + arvo);
    boolean result = service.checkPW(arvo);
    
    if(result) {
      return "1";
    }else {
      return "0";
    }
    
  }
}
