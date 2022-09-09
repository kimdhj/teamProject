package com.romance.admin.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FaqController {
	@Autowired
	private FaqService service;
	
	// Faq List
	@RequestMapping(value="/admin_post_Faq.mdo", method=RequestMethod.GET)
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
		System.out.println(vo);
		service.delete(vo);
		return "redirect:admin_post_Faq.mdo";
	}
	
	@GetMapping(value = "/faqChkbox.mdo")
	@ResponseBody
	public String chkboxDelete(@RequestParam(value = "FAQ_seq[]") List<String> FAQ_seq) {
		service.chkboxDelete(FAQ_seq);
		return null;
	}
	
	// Detail
	@GetMapping(value = "/admin_post_FaqDetail.mdo")
	public String getFaq(Model model, FaqVO vo, FaqSearchVO svo) {
		model.addAttribute("svo", svo);
		model.addAttribute("faq", service.getFaq(vo));
		return "admin_post_FaqDetail";
	}
	
	// Insert
	@PostMapping(value = "/admin_post_FaqInsert.mdo")
	public String insertFaq() {
		return null;
	}
	
}