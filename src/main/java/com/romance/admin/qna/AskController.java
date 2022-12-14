package com.romance.admin.qna;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.romance.admin.login.AdminUserVO;

import com.romance.security.JwtUtils;
import com.romance.server.AwsS3;
import com.romance.user.login.UserVO;

@Controller
public class AskController {

  @Autowired
  private AskService service;
  
  // List
  @GetMapping(value = "/QnaList.mdo")
  public String getAskList(AskSearchVO svo, Model model, AskVO vo,JwtUtils util, HttpSession session) throws IOException  {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    List<AskVO> askList = service.getAskList(svo);
    model.addAttribute("askList", askList);
    
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
    System.out.println("vo_status: " + vo.getAsk_status());
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count);
    model.addAttribute("allPage", svo.getPage());
    model.addAttribute("allSvo", svo);
    
    return "admin_post_Qna";
  }
  
  @GetMapping("/qnaList.mdo")
  @ResponseBody
  public List<AskVO> qnaList(AskSearchVO svo) {
    List<AskVO> askList = service.getAskList(svo);
    return askList;
  }
  
  @GetMapping("/qnaCount.mdo")
  @ResponseBody
  public int qnaCount(AskSearchVO svo) {
    int count = service.getCount(svo);
    return count;
  }
  
  // Delete (List, ?????????????????? ?????? + ?????? ??????)
  @GetMapping(value = "/AskDelete.mdo") // ?????? ??????(?????? + ??????)
  public String delete(AskVO vo, AskReplyVO arvo) throws FileNotFoundException, IOException {
    
    System.out.println("AskDelete : " + vo);
    
    if (vo.getAsk_file() != null) { // isEmpty() : ????????? ??? ?????? ?????? ????????? ??????(????????? true ??????)
      String key = vo.getAsk_file();
      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
      String fileName = key.replaceAll(uploadFolder, ""); // ?????????
      
      System.out.println("key : " + fileName);
      
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.delete(fileName);
      System.out.println(fileName);
    }
    
    if (arvo != null) {
      if (arvo.getAsk_reply_file() != null) { // isEmpty() : ????????? ??? ?????? ?????? ????????? ??????(????????? true ??????)
        String key = arvo.getAsk_reply_file();
        String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
        String fileName = key.replaceAll(uploadFolder, ""); // ?????????
        
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
  
  @GetMapping(value = "/AskReplyDelete.mdo") // ?????? ??????

  public String delete(AskReplyVO arvo, AskVO vo) throws FileNotFoundException, IOException { 
    if (arvo.getAsk_reply_file() != null) { // isEmpty() : ????????? ??? ?????? ?????? ????????? ??????(????????? true ??????)

      String key = arvo.getAsk_reply_file();
      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
      String fileName = key.replaceAll(uploadFolder, ""); // ?????????
      
      System.out.println("key : " + fileName);
      
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.delete(fileName);
      System.out.println(fileName);
    }
    
    service.delete2(arvo);
    service.changeStatus(vo);
    
    return "redirect:QnaList.mdo";
  }
  
  @GetMapping(value = "/qnaChkbox.mdo")
  @ResponseBody
  public String chkboxDelete(@RequestParam(value = "ask_seq[]") List<String> ask_seq, AskReplyVO arvo) throws FileNotFoundException, IOException {
    System.out.println("checkDelete : " + ask_seq);
    System.out.println("arvo(???????????? ??????) : " + arvo);
    service.chkboxDelete1(ask_seq);
    
    if (arvo != null) {
      service.chkboxDelete2(ask_seq);
    }
    
    return null;
  }
  
  // Detail - ?????? ??????
  @GetMapping(value = "/QnaDetail.mdo")
  public String getDetail1(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo, HttpSession session, JwtUtils util) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    AdminUserVO admin = util.getAdmin(session);
    
    if(admin == null) {
      return "admin_login.mdo";
    }
    
    if(admin.getUser_role().equals("ROLE_ADMIN")) {
      admin.setUser_id("?????????");
    }
    
    model.addAttribute("admin", admin.getUser_id());
    
    vo = service.getAsk(vo);
    arvo = service.getAskReply(arvo);
    System.out.println("?????? ?????? ??? : " + vo);
    
    System.out.println("?????? ?????? ???2 : " + arvo);
    String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
    
    if (vo.getAsk_file() != null) {
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
  
  // Detail - ?????? ?????? (???????????? ????????? ?????? ????????????, ????????? ?????? ?????????) -> ?????? ?????? ???
  @GetMapping(value = "/qnaDetail.mdo")
  public String getDetail2(Model model, AskVO vo, AskReplyVO arvo, AskSearchVO svo, HttpSession session, JwtUtils util) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }

    AdminUserVO admin = util.getAdmin(session);
    
    if(admin == null) {
      return "admin_login.mdo";
    }
    
    if(admin.getUser_role().equals("ROLE_ADMIN")) {
      admin.setUser_id("?????????");
    }
    
    model.addAttribute("admin", admin.getUser_id());
    
    vo = service.getAsk(vo);
    arvo = service.getAskReply(arvo);
    
    System.out.println("?????? ?????? ???1 : " + vo);
    System.out.println("?????? ?????? ???2 : " + arvo);
    
    System.out.println("?????? ?????? " + arvo);
    String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
    
    if (vo.getAsk_file() != null) {
      String one = vo.getAsk_file().replaceAll(uploadFolder, "");
      int dot = one.indexOf(".");
      one = one.substring(0, dot);
      System.out.println(one);
      model.addAttribute("one", one);
    }
    
    if (arvo.getAsk_reply_file() != null) {
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
    System.out.println("result : " + result);
    if (result) {
      System.out.println("result2 : " + result);
      return "1";
    } else {
      System.out.println("result3 : " + result);
      return "0";
    }
  }
  
  // ?????? ?????? ??????
  @PostMapping("/askReplyInsert.mdo")
  public String insert(AskReplyVO arvo, AskVO vo,JwtUtils util, HttpSession session) throws IOException{
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }


 

    System.out.println("askReplyInsert : " + arvo);
    System.out.println("askReplyInsert2 : " + vo);
    
    MultipartFile file = arvo.getAsk_reply_uploadFile();
    
    if(file != null) {
      String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
      String fileName = arvo.getAsk_reply_uploadFile().getOriginalFilename();
      String expand = fileName.substring(fileName.indexOf("."));
      String name = fileName.replaceAll(expand, "");
      String key = name + UUID.randomUUID().toString() + expand;
      System.out.println("key : " + key);
      
      InputStream is = file.getInputStream();
      String contentType = file.getContentType();
      Long contentLength = file.getSize();
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.upload(is, key, contentType, contentLength);
      
      arvo.setAsk_reply_file(uploadFolder + key);
    }
    
    service.getAsk(vo);
    System.out.println("?????? ??????123: " + vo);
    
    service.answerInsert(arvo);
    service.answerStatus(vo);
    
    System.out.println("?????? ?????? : " + vo.getAsk_status());
    
    return "redirect:QnaList.mdo";
  }
  
  // Update
  @GetMapping("/QnaUpdate.mdo")
  public String getUpdate(AskReplyVO arvo, AskVO vo, Model model,JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }


  
    AdminUserVO admin = util.getAdmin(session);
    
    if(admin == null) {
      return "admin_login.mdo";
    }
    
    if(admin.getUser_role().equals("ROLE_ADMIN")) {
      admin.setUser_id("?????????");
    }
    
    model.addAttribute("admin", admin.getUser_id());
    

    System.out.println("GET update AskVO : " + vo);
    System.out.println("GET update AskReplyVO : " + arvo);
    
    vo = service.getAsk(vo);
    arvo = service.getAskReply(arvo);

    System.out.println("GET12 update AskVO : " + vo);
    System.out.println("GET12 update AskReplyVO : " + arvo);
    
    model.addAttribute("ask", vo);
    model.addAttribute("askReply", arvo);

    return "admin_post_QnaUpdate";
  }
  
  @PostMapping("/QnaUpdate.mdo")
  public String update(AskReplyVO arvo, AskVO vo, Model model,JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:admin_login.mdo";
    }
    System.out.println("POST update AskReplyVO : " + arvo);
    System.out.println("POST update AskVO : " + vo);


//    model.addAttribute("ask", vo);
//    model.addAttribute("askReply", arvo);
    
    
    MultipartFile file = arvo.getAsk_reply_uploadFile();
    String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
    
    if(arvo.getAsk_reply_file() != null) { // isEmpty() : ????????? ??? ?????? ?????? ????????? ??????(????????? true ??????) 
      String key = arvo.getAsk_reply_file();
      String fileName = key.replaceAll(uploadFolder, ""); // ????????? 
      System.out.println("key : " + fileName);
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.delete(fileName);
      System.out.println(fileName);
      
    }
    
    System.out.println(file);
    
    // js ?????? 
    if(!file.isEmpty()) {
  
      String fileName = file.getOriginalFilename();
      System.out.println(fileName.indexOf("."));
      String expand = fileName.substring(fileName.indexOf("."));
      String name = fileName.replaceAll(expand, "");
      String key = name + UUID.randomUUID().toString() + expand;
      System.out.println("key : " + key);
      
      InputStream is = file.getInputStream();
      String contentType = file.getContentType();
      Long contentLength = file.getSize();
      AwsS3 awsS3 = AwsS3.getInstance();
      awsS3.upload(is, key, contentType, contentLength);
      
      arvo.setAsk_reply_file(uploadFolder + key);
    }
    
    service.update(arvo);
    
    return "redirect:QnaList.mdo";
  }
  
}
