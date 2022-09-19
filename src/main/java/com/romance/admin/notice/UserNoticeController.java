package com.romance.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserNoticeController {
  
  @Autowired
  private NoticeService service;
  
  // Info Controller
  @GetMapping(value = "/info.do")
  public String info() {
    return "info_Info";
  }
  
  @GetMapping(value = "/notice.do")
  public String notice(NoticeSearchVO svo, Model model) {
    List<NoticeVO> list = service.getNoticeList(svo);
    
    int count = service.getCount(svo);
    
    model.addAttribute("list", list);
    model.addAttribute("count", count - (svo.getPage() - 1)*5);
    
    if(count % 5 == 0) {
      count--;
    }
    
    if(svo.getPage()<3) {
      model.addAttribute("startpage", 1);
    }else {
      model.addAttribute("startpage", svo.getPage()-2);
    }
    if(svo.getPage()+2>count/5+1) {
      model.addAttribute("endpage", count/5+1);
    }else {
      model.addAttribute("endpage", svo.getPage()+2);
    }
    
    System.out.println("count : " + count);
    
    model.addAttribute("page", count / 5 + 1);
    model.addAttribute("allCount", count); // 전체 공지사항 개수
    model.addAttribute("allPage", svo.getPage()); // 전체 페이지
    model.addAttribute("allSvo", svo); // 검색할 내용 넘겨주기
    
    return "notice_Notice";
  }
  
  @GetMapping("/noticeList.do")
  @ResponseBody
  public List<NoticeVO> noticeList(NoticeSearchVO svo){
    List<NoticeVO> noticeList = service.getNoticeList(svo);
    return noticeList;
  }
  
  @GetMapping("/noticeCount.do")
  @ResponseBody
  public int noticeCount(NoticeSearchVO svo) {
    System.out.println("csvo : " + svo);
    int count = service.getCount(svo);
    return count;
  }
  
  @GetMapping("/noticeDetail.do")
  public String detail(NoticeVO vo, Model model, NoticeSearchVO svo) {
    System.out.println("상세보기 : " + vo);
    vo = service.getNotice(vo);
    
    service.cnt(vo.getNotice_seq());
    model.addAttribute("vo", vo);
    model.addAttribute("svo", svo);
    
    return "notice_NoticeDetail";
  }
  
  
  
}
