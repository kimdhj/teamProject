package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class termsController {
	
	
	termsService service;
	@RequestMapping("/admin_terms_Main.mdo")
	public String termsMain(termsVO vo,Model model) {
		System.out.println("admin_terms_main process");
		List<termsVO> termsList = service.getTermsList(vo); 
		return "admin_terms_Main";
	}
	
	@RequestMapping("/admin_terms_Read.mdo")
	public String termsRead() {
		System.out.println("admin_terms_read process");
		return "admin_terms_Read";
	}
	
	@RequestMapping("/admin_terms_Write.mdo")
	public String termsWrite() {
		System.out.println("admin_terms_write process");
		return "admin_terms_Write";
	}
}
