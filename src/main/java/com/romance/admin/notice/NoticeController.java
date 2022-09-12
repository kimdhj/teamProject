package com.romance.admin.notice;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.romance.security.JwtUtils;
import com.romance.server.AwsS3;
import com.romance.user.login.UserVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 목록 - 페이징
	@RequestMapping(value = "/admin_post_Notice.mdo", method=RequestMethod.GET)
	public String getNoticeList(Model model, NoticeSearchVO svo) {
		System.out.println("svo : " + svo); // 데이터가 넘어오는지 확인
		List<NoticeVO> noticeList = noticeService.getNoticeList(svo); // 공지사항 목록
		int count = noticeService.getCount(svo);
		model.addAttribute("noticeList", noticeList); // 전체 공지사항
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
		
		System.out.println("count"  + count);
		model.addAttribute("page", count / 5 + 1);
		model.addAttribute("allCount", count); // 전체 공지사항 개수
		model.addAttribute("allPage", svo.getPage()); // 전체 페이지
		model.addAttribute("allSvo", svo); // 검색할 내용 넘겨주기
		return "admin_post_Notice";
	}
	
	// ajax 에서 사용할 noticelist 와 listcount 만들기 - 페이징 및 검색
	@GetMapping("/noticeList.mdo")
	@ResponseBody
	public List<NoticeVO> noticeList(NoticeSearchVO svo){
		List<NoticeVO> noticeList = noticeService.getNoticeList(svo);
		return noticeList;
	}
	
	@GetMapping("/noticeCount.mdo")
	@ResponseBody
	public int noticeCount(NoticeSearchVO svo) {
		System.out.println("csvo : " + svo);
		int count = noticeService.getCount(svo);
		return count;
	}
	
	// POST 방식으로 insert 해주는 컨트롤러(파일, VO 가져가서 insert)
	@RequestMapping(value = "/admin_post_NoticeInsert.mdo", method=RequestMethod.POST)
	// @RequestParam("notice_file") MultipartFile notice_file : 서버에 있는 파일 / String notice_fileName : DB 에 있는 파일
	public String insertNotice(NoticeVO vo) throws IOException{
		System.out.println("insertController: "+ vo);
		
		MultipartFile notice_file = vo.getNotice_file();
		if(!notice_file.isEmpty()) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			String fileName = notice_file.getOriginalFilename(); // getOriginalFilename() : 업로드 한 파일명을 문자열로 리턴
			String expand = fileName.substring(fileName.indexOf(".")); // 확장자 
			String name = fileName.replaceAll(expand, "");
			System.out.println(name);
			String key = name + UUID.randomUUID().toString() + expand; // 파일 이름 랜덤으로 정해주기
			System.out.println("key : " + key);
			InputStream is = notice_file.getInputStream();
			String contentType = notice_file.getContentType();
			Long contentLength = notice_file.getSize();
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.upload(is, key, contentType, contentLength); // 파일 업로드
			
			vo.setNotice_fileName(uploadFolder + key);
		}
		
		noticeService.insertNotice(vo);
		System.out.println(vo.getNotice_fileName());
		return "redirect:admin_post_Notice.mdo";
	}
	
	// NoticeInsert.jsp 로 이동 처리해주는 컨트롤러
	@RequestMapping(value = "/admin_post_Insert.mdo")
	public String insert(HttpSession session, JwtUtils util, Model model) {
		UserVO userVo = util.getuser(session);
		
		model.addAttribute("user", userVo.getUser_id());
		System.out.println(userVo.getUser_id());
//		model.addAttribute("user", userVo.getUser_name());
		return "admin_post_NoticeInsert";
	}
	
	// get 방식으로 notice_seq 를 가지고 이동
	@GetMapping(value = "/admin_post_NoticeInsert.mdo")
	public String selectSeq(@RequestParam("notice_seq")int notice_seq, Model model) {
		model.addAttribute("notice", noticeService.selectSeq(notice_seq));
		return "admin_post_NoticeInsert";
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "/noticeDelete.mdo", method=RequestMethod.GET)
	public String delete(NoticeVO vo) {
		vo = noticeService.selectSeq(vo.getNotice_seq());
		System.out.println("delete : " + vo);
		if(vo.getNotice_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String key = vo.getNotice_fileName();
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
			System.out.println("key : " + fileName);
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.delete(fileName);
			System.out.println(fileName);
		}
		
		noticeService.deleteNotice(vo);
		return "redirect:admin_post_Notice.mdo";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value = "/admin_post_NoticeDetail.mdo")
	public String getNotice(Model model, NoticeVO vo, NoticeSearchVO svo) {
//		System.out.println("컨트롤러 " + svo);
		System.out.println("컨트롤러 " + vo);
		vo = noticeService.getNotice(vo);
		String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
		if(vo.getNotice_fileName() != null) {
			String one = vo.getNotice_fileName().replaceAll(uploadFolder, "");
			int dot = one.indexOf(".");
			one = one.substring(0, dot);
			System.out.println(one);
			model.addAttribute("one", one);
		}
		model.addAttribute("svo", svo);
		model.addAttribute("notice", vo);
		return "admin_post_NoticeDetail";
	}
	
	// 공지사항 수정인데, seq 를 들고가서 해당 seq 값의 전체 데이터를 뽑아내서 수정하도록 해주는 컨트롤ㄹ러
	@RequestMapping(value = "/admin_post_NoticeUpdate.mdo", method=RequestMethod.GET)
	public String updateNotice(String notice_seq, Model model, NoticeSearchVO svo) {
//		System.out.println(notice_seq);
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_seq(Integer.parseInt(notice_seq));
//		System.out.println(vo);
		System.out.println("update : " + noticeService.selectSeq(vo.getNotice_seq()));
		model.addAttribute("notice", noticeService.selectSeq(vo.getNotice_seq()));
		model.addAttribute("svo", svo);
		return "admin_post_NoticeUpdate";
	}
	
	// 공지사항 수정
	@RequestMapping(value = "/admin_post_NoticeUpdate.mdo", method=RequestMethod.POST)
	public String updateNotice(NoticeVO vo, Model model) throws IOException {
		System.out.println("update vo : " + vo);
		String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
		
		if(vo.getNotice_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String key = vo.getNotice_fileName();
			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
			System.out.println("key : " + fileName);
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.delete(fileName);
			System.out.println(fileName);
			
		}
		
		MultipartFile notice_file = vo.getNotice_file();
		if(!notice_file.isEmpty()) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String fileName = notice_file.getOriginalFilename(); // getOriginalFilename() : 업로드 한 파일명을 문자열로 리턴
			String expand = fileName.substring(fileName.indexOf(".")); // 확장자 
			String name = fileName.replaceAll(expand, "");
			System.out.println(name);
			String key = name + UUID.randomUUID().toString() + expand; // 파일 이름 랜덤으로 정해주기
			System.out.println("key : " + key);
			InputStream is = notice_file.getInputStream();
			String contentType = notice_file.getContentType();
			Long contentLength = notice_file.getSize();
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.upload(is, key, contentType, contentLength); // 파일 업로드
			
			vo.setNotice_fileName(uploadFolder + key);
		}

		noticeService.updateNotice(vo);
		return "redirect:admin_post_Notice.mdo";
	}

	// 비밀번호 같으면 1, 없으면 0 -> seq, passwd 둘 다 같을 경우에 처리 / 하나라도 다를 경우 처리 불가의 controller 작성 -> SearchVO
	@RequestMapping(value = "/admin_post_NoticeUpdate_checkPW.mdo", method = RequestMethod.POST)
	@ResponseBody // 리턴 값을 데이터 전송할 때 사용 (페이지 이동 X)
	public String passwdCheck(NoticeVO vo, Model model) {
		System.out.println("비밀번호 확인: " + vo);
		// 비밀번호 체크
		boolean result = noticeService.checkPW(vo);
		System.out.println("result : " + result);
		
		if(result) { // 비밀번호가 맞다면
			return "1";
		}else {
			return "0";
		}
	}
	
	// 체크 박스 선택한 값 삭제 -> SearchVo
	@RequestMapping(value = "/admin_post_NoticeChkbox.mdo", method = RequestMethod.GET)
	@ResponseBody
	public String checkBox(@RequestParam(value = "notice_seq[]")List<String> notice_seq) {
		noticeService.checkBox(notice_seq); // Service 랑 연결
		System.out.println("Controller : " + notice_seq);
		return null;
	}
	
	// 페이징 처리
	@RequestMapping(value="/notice.mdo", method=RequestMethod.GET)
	public String notice(NoticeSearchVO vo, Model model) {
		System.out.println("vo : " + vo);
		return null;
	}
	
}



