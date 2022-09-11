package com.romance.admin.faq;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.romance.security.JwtUtils;
import com.romance.server.AwsS3;
import com.romance.user.login.UserVO;

@Controller
public class FaqController {
	@Autowired
	private FaqService service;
	
	// Faq List
	@RequestMapping(value="/FaqList.mdo", method=RequestMethod.GET)
	public String getFaqList(FaqSearchVO svo, Model model) {
//		System.out.println(svo);
		List<FaqVO> faqList = service.getFaqList(svo);
		model.addAttribute("faqList", faqList);

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
		return "admin_post_Faq";
	}
	
	@GetMapping("/faqList.mdo")
	@ResponseBody
	public List<FaqVO> faqList(FaqSearchVO svo){
//		System.out.println(svo);
		List<FaqVO> faqList = service.getFaqList(svo);
		return faqList;
	}
	
	@GetMapping("/faqCount.mdo")
	@ResponseBody
	public int faqCount(FaqSearchVO svo) {
		int count = service.getCount(svo);
		return count;
	}
	
	// DELETE
	@GetMapping(value = "/faqDelete.mdo")
	public String delete(FaqVO vo) {
		
		if(vo.getFAQ_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String key = vo.getFAQ_fileName();
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
			System.out.println("key : " + fileName);
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.delete(fileName);
			System.out.println(fileName);
		}
		
		service.delete(vo);
		return "redirect:FaqList.mdo";
	}
	
	@GetMapping(value = "/faqChkbox.mdo")
	@ResponseBody
	public String chkboxDelete(@RequestParam(value = "FAQ_seq[]") List<String> FAQ_seq) {
		System.out.println("checkDelete : " + FAQ_seq);
		
		service.chkboxDelete(FAQ_seq);
		return null;
	}
	
	// Detail
	@GetMapping(value = "/FaqDetail.mdo")
	public String getFaq(Model model, FaqVO vo, FaqSearchVO svo) {
		vo = service.getFaq(vo);
		String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
		
		if(vo.getFAQ_fileName() != null) {
			String one = vo.getFAQ_fileName().replaceAll(uploadFolder, "");
			int dot = one.indexOf(".");
			one = one.substring(0, dot);
			System.out.println(one);
			model.addAttribute("one", one);
		}
		
		model.addAttribute("svo", svo);
		model.addAttribute("faq", vo);
		return "admin_post_FaqDetail";
	}
	
	// Insert
	// post 방식 insert 로 내용 넘겨주기
	@PostMapping(value = "/FaqInsert.mdo")
	public String insert(FaqVO vo) throws IOException {
		System.out.println("insert: " + vo);
		MultipartFile file = vo.getFAQ_file();
		
		if(!file.isEmpty()) {
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			String fileName = file.getOriginalFilename(); // getOriginalFilename() : 업로드 한 파일명을 문자열로 리턴
			String expand = fileName.substring(fileName.indexOf(".")); // 확장자 
			String name = fileName.replaceAll(expand, "");
			System.out.println(name);
			
			String key = name + UUID.randomUUID().toString() + expand; // 파일 이름 랜덤으로 정해주기
			System.out.println("key : " + key);
			
			InputStream is = file.getInputStream();
			String contentType = file.getContentType(); // getContentType : 클라이언트가 요청정보를 전송할 때 사용한 컨텐트의 타입 구하기
			Long contentLength = file.getSize(); // getSize : 컬럼의 크기를 리턴
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.upload(is, key, contentType, contentLength); // 파일 업로드
			
			vo.setFAQ_fileName(uploadFolder + key);
		}
		
		service.insert(vo);
		System.out.println(vo.getFAQ_fileName());
		
		return "redirect:FaqList.mdo";
	}
	
	// get 방식 insert 로 페이지 호출 -> 여기서 로그인 세션 넣어주기
	@GetMapping(value="/FaqInsert.mdo")
	public String getInsert(FaqVO vo, Model model, HttpSession session, JwtUtils util) {
		UserVO userVO = util.getuser(session);
		model.addAttribute("seq", vo.getFAQ_seq());
		model.addAttribute("user", userVO.getUser_id());
		
		System.out.println(userVO.getUser_id());
		
		return "admin_post_FaqInsert";
	}
	
	// Update -> 내가 가져가야 하는 값을 잘 생각하고 찍어야됨.
	@GetMapping(value="/FaqUpdate.mdo")
	public String update(FaqVO vo, FaqSearchVO svo, Model model) {
//		System.out.println("getUpdate: " + service.getFaq(vo));
		model.addAttribute("svo", svo);
		model.addAttribute("faq", service.getFaq(vo)); // 해당 vo 를 넘겨줘서 getFaq(상세보기 화면) 가져오기
		return "admin_post_FaqUpdate";
	}
	
	@PostMapping(value="/FaqUpdate.mdo")
	public String update(FaqVO vo, Model model) throws IOException {
		System.out.println("update : " + vo);
		String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
		
		if(vo.getFAQ_fileName() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String key = vo.getFAQ_fileName();
			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
			System.out.println("key : " + fileName);
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.delete(fileName);
			System.out.println(fileName);
			
		}
		
		MultipartFile file = vo.getFAQ_file();
		if(!file.isEmpty()) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String fileName = file.getOriginalFilename(); // getOriginalFilename() : 업로드 한 파일명을 문자열로 리턴
			String expand = fileName.substring(fileName.indexOf(".")); // 확장자 
			String name = fileName.replaceAll(expand, "");
			System.out.println(name);
			String key = name + UUID.randomUUID().toString() + expand; // 파일 이름 랜덤으로 정해주기
			System.out.println("key : " + key);
			InputStream is = file.getInputStream();
			String contentType = file.getContentType();
			Long contentLength = file.getSize();
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.upload(is, key, contentType, contentLength); // 파일 업로드
			
			vo.setFAQ_fileName(uploadFolder + key);
		}
		
		service.update(vo);
		return "redirect:FaqList.mdo";
	}
	
	// checkPW
	@PostMapping(value = "/FaqCheckPW.mdo")
	@ResponseBody
	public String checkPW(FaqVO vo, Model model) {
//		System.out.println("checkPW: " + vo);
		boolean result = service.checkPW(vo);
		
		if(result) {
			return "1";
		}else {
			return "0";
		}
	}
}
