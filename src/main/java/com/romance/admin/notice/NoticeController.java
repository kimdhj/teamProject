package com.romance.admin.notice;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/admin_post_Notice.mdo", method=RequestMethod.GET)
	public String getNoticeList(Model model) {
		System.out.println("admin notice List");
		List<NoticeVO> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "admin_post_Notice";
	}
	
	@RequestMapping(value = "/admin_post_NoticeInsert.mdo", method=RequestMethod.POST)
	// @RequestParam("notice_file") String notice_file
	public String insertNotice(@RequestParam("notice_file") MultipartFile notice_file, NoticeVO vo) throws IOException{
		if(!notice_file.isEmpty()) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String fileName = notice_file.getOriginalFilename(); // getOriginalFilename() : 업로드 한 파일명을 문자열로 리턴
			notice_file.transferTo(new File("E:/MyProject/" + fileName)); // transferTo(File destFile) : 업로드 한 파일을 destFile 에 저장
		}
		System.out.println("vo2: " + vo);
		noticeService.insertNotice(vo);
	
		return "redirect:admin_post_Notice.mdo";
	}
	
	@GetMapping(value = "/admin_post_NoticeInsert.mdo")
	public String selectSeq(@RequestParam("notice_seq")int notice_seq, Model model) {
		model.addAttribute("notice", noticeService.selectSeq(notice_seq));
		return "admin_post_NoticeInsert";
	}
	
	@RequestMapping(value = "/admin_post_NoticeDelete.mdo", method=RequestMethod.GET)
	public String deleteNotice(NoticeVO vo) {
		System.out.println("삭제");
		noticeService.deleteNotice(vo);
		return "redirect:admin_post_Notice.mdo";
	}
	
	@RequestMapping(value = "/admin_post_NoticeDetail.mdo")
	public String getNotice(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "admin_post_NoticeDetail";
	}
	
	@RequestMapping(value = "/admin_post_NoticeUpdate.mdo", method=RequestMethod.GET)
	public String updateNotice( String notice_seq, Model model) {
		System.out.println(notice_seq);
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_seq(Integer.parseInt(notice_seq));
		System.out.println(vo);
		model.addAttribute("notice", noticeService.selectSeq(vo.getNotice_seq()));
		return "admin_post_NoticeUpdate";
	}
	
	@RequestMapping(value = "/admin_post_NoticeUpdate.mdo", method=RequestMethod.POST)
	public String updateNotice(NoticeVO vo) {
		System.out.println("update vo1 : " + vo);
		noticeService.updateNotice(vo);
		return "redirect:admin_post_Notice.mdo";
	}
	
	@RequestMapping(value = "/amin_post_NoticeUpdate_checkPW.mdo", method = RequestMethod.POST)
	@ResponseBody
	public String passwdCheck(NoticeVO vo, Model model) {
		// 비밀번호 체크
		boolean result = noticeService.checkPW(vo);
		System.out.println("result : " + result);
		
		if(result) { // 비밀번호가 맞다면
			return "1";
		}else {
			return "0";
		}
	}
}

// 비밀번호 같으면 1, 없으면 0 -> seq, passwd 둘 다 같을 경우에 처리 / 하나라도 다를 경우 처리 불가의 controller 작성


