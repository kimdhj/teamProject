package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class termsController {
	
	
	termsService service;
	@RequestMapping("/admin_terms_Write.mdo")
	public String termsWrite() {
		System.out.println("insert terms");
		return "admin_terms_Write";
	}
	
	@RequestMapping("/admin_terms_insert.mdo")
	public String temrsInsert(termsVO vo) {
		System.out.println("terms insert 싫행");
		service.insertTerms(vo);
		return "admin_terms_Main";
	}
	
	@RequestMapping("/admin_terms_Main.mdo")
	public String termsMain(termsVO vo,Model model) {
		System.out.println("admin_terms_main process");
//		List<termsVO> termsList = service.getTermsList(vo);
//		model.addAttribute("termsList",termsList);
		return "admin_terms_Main";
	}
	
	@RequestMapping("/admin_terms_Read.mdo")
	public String termsRead() {
		System.out.println("admin_terms_read process");
		return "admin_terms_Read";
	}
	
}
