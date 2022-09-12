package com.romance.admin.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
//		System.out.println(svo);
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
	@GetMapping(value = "/QnaDelete.mdo")
	public String delete(AskVO vo) {
		
		if(vo.getAsk_file() != null) { // isEmpty() : 업로드 한 파일 존재 여부를 리턴(없으면 true 리턴) 
			String key = vo.getAsk_file();
			String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
			String fileName = key.replaceAll(uploadFolder, ""); // 확장자 
			
			System.out.println("key : " + fileName);
			
			AwsS3 awsS3 = AwsS3.getInstance();
			awsS3.delete(fileName);
			System.out.println(fileName);
		}
		
		service.delete(vo);
		return "redirect:QnaList.mdo";
	}
	
//@GetMapping(value = "/qnaChkbox.mdo")
//@ResponseBody
//public String chkboxDelete(@RequestParam(value = "ask_seq[]") List<String> ask_seq) {
//	System.out.println("checkDelete : " + ask_seq);
//	
//	service.chkboxDelete(ask_seq);
//	return null;
//}
	
}
