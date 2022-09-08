package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class termsController {
	
	@Autowired
	termsService service;
	@RequestMapping("/admin_terms_Write.mdo")
	public String termsWrite() {
		System.out.println("insert terms");
		return "admin_terms_Write";
	}
	
	@RequestMapping("/admin_terms_insert.mdo")
	public String temrsInsert(termsVO vo) {
		System.out.println("terms insert 실행");
		service.insertTerms(vo);
		return "redirect:admin_terms_Main.mdo";
	}
	
	@RequestMapping("/admin_terms_Main.mdo")
	public String termsMain(termsVO vo,Model model) {
		System.out.println("admin_terms_main 실행");
		List<termsVO> termsList = service.getTermsList(vo);
		model.addAttribute("termsList",termsList);
		return "admin_terms_Main";
	}
	
	@RequestMapping("/admin_terms_Read.mdo")
	public String termsRead(termsVO vo,Model model,int seq) {
		System.out.println("admin_terms_read 실행");
//		service.countCnt(seq);
		vo.setTerms_seq(seq);
		model.addAttribute("terms", service.getTerms(vo));
		System.out.println(service.getTerms(vo));
		return "admin_terms_Read";
	}
	
	@RequestMapping("/admin_terms_Update.mdo")
	public String termsUpdate(termsVO vo,Model model,int seq) {
		System.out.println("admin_terms_update 페이지 이동");
		vo.setTerms_seq(seq);
		model.addAttribute("terms", service.getTerms(vo));
		return "admin_terms_Update";
	}
	
	@RequestMapping("/admin_terms_Alter.mdo")
	public String termsAlter(termsVO vo) {
		System.out.println("admin_terms_Alter 실행");
		service.alterTerms(vo);
		return "redirect:admin_terms_Read.mdo";
	}
	
}
