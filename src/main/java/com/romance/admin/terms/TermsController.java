package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TermsController {
	
	@Autowired
	TermsService service;
	
	@RequestMapping("/admin_terms_Main.mdo")
	public String termsMain(TermsVO vo,Model model) {
		System.out.println("admin_terms_main 실행");
		List<TermsVO> termsList = service.getTermsList(vo);
		model.addAttribute("termsList",termsList);
		return "admin_terms_Main";
	}
	
	
	@RequestMapping("/admin_terms_Write.mdo")
	public String termsWrite(Model model) {
		System.out.println("insert terms");
		model.addAttribute("getCount", service.getCount());
		return "admin_terms_Write";
	}
	
	@RequestMapping("/admin_terms_insert.mdo")
	public String temrsInsert(TermsVO vo) {
		System.out.println("terms insert 실행");
		service.insertTerms(vo);
		return "redirect:admin_terms_Main.mdo";
	}
	
	@RequestMapping("/admin_terms_Read.mdo")
	public String termsRead(TermsVO vo,Model model,int terms_seq) {
		System.out.println("admin_terms_read 실행");
//		service.countCnt(seq);
		vo.setTerms_seq(terms_seq);
		model.addAttribute("terms", service.getTerms(vo));
		System.out.println(service.getTerms(vo));
		return "admin_terms_Read";
	}
	
	@RequestMapping("/admin_terms_Update.mdo")
	public String termsUpdate(TermsVO vo,Model model,int terms_seq) {
		System.out.println("admin_terms_update 페이지 이동");
		vo.setTerms_seq(terms_seq);
		model.addAttribute("terms", service.getTerms(vo));
		return "admin_terms_Update";
	}
	
	@RequestMapping("/admin_terms_Alter.mdo")
	public String termsAlter(TermsVO vo) {
		System.out.println("admin_terms_Alter 실행");
		service.alterTerms(vo);
		return "redirect:admin_terms_Read.mdo?terms_seq="+vo.getTerms_seq();
	}
	
	@RequestMapping("/admin_terms_Delete.mdo")
	public String termsDelete(TermsVO vo, int terms_seq) {
		System.out.println("admin_terms_Delete 실행");
		vo.setTerms_seq(terms_seq);
		service.deleteTerms(vo);
		return "redirect:admin_terms_Main.mdo";
	}
	
}
