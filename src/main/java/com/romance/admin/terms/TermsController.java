package com.romance.admin.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TermsController {
	
	@Autowired
	TermsService service;
	
	@RequestMapping("/admin_terms_Main.mdo")
	public String termsMain(TermsVO vo,Model model, TermsSearchVO svo) {
		System.out.println("admin_terms_main 실행");
		if(svo.getPage() == 0) {
			svo.setPage(1);
		}
		List<TermsVO> termsList = service.getTermsList(svo);
		int count = service.getCount(svo);
		System.out.println(count);
		model.addAttribute("termsList",termsList);
		System.out.println(svo.getPage());
		model.addAttribute("count", count - (svo.getPage() - 1)*5);
		if(count % 5 == 0 && count != 0) {
			count --;
		}
		model.addAttribute("page", count/5 + 1);
		model.addAttribute("currentpage", svo.getPage());
		model.addAttribute("startpage", (svo.getPage()/5)*5 + 1);
		if((count/5+1) <= ((svo.getPage()/5)+1)*5) {
			model.addAttribute("endpage", (count/5+1));
		}else {
			model.addAttribute("endpage", ((svo.getPage()/5)+1)*5 );
		}
		model.addAttribute("SearchVO", svo);
		return "admin_terms_Main";
	}
	
	@RequestMapping(value = "/ajax_a.mdo", method=RequestMethod.POST)
	@ResponseBody
	public int ajax_a(TermsSearchVO svo) {
		int count = service.getCount(svo);
		return count;
	}
	
	@RequestMapping(value = "ajax_b.mdo", method=RequestMethod.POST)
	@ResponseBody
	public List<TermsVO> ajax_b(TermsSearchVO svo){
		if(svo.getPage()==0) {
			svo.setPage(1);
		}
		
		return service.getTermsList(svo);
	}
	
	@GetMapping("/ajax_c.mdo")
	@ResponseBody
	public int ajax_c(TermsSearchVO svo) {
		return service.termsOverlap(svo);
	}
	
	@RequestMapping("/admin_terms_Write.mdo")
	public String termsWrite(Model model,TermsSearchVO svo) {
		System.out.println("insert terms");
		model.addAttribute("getCount", service.getCount(svo));
		return "admin_terms_Write";
	}
	
	@RequestMapping("/admin_terms_insert.mdo")
	public String temrsInsert(TermsVO vo) {
		System.out.println("terms insert 실행");
		service.insertTerms(vo);
		return "redirect:admin_terms_Main.mdo";
	}
	
	@RequestMapping("/admin_terms_Read.mdo")
	public String termsRead(TermsVO vo,Model model,int terms_seq, int count) {
		System.out.println("admin_terms_read 실행");
//		service.countCnt(seq);
		vo.setTerms_seq(terms_seq);
		model.addAttribute("terms", service.getTerms(vo));
		model.addAttribute("count", count);
		System.out.println(service.getTerms(vo));
		return "admin_terms_Read";
	}
	
	@RequestMapping("/admin_terms_Update.mdo")
	public String termsUpdate(TermsVO vo,Model model,int terms_seq, int count) {
		System.out.println("admin_terms_update 페이지 이동");
		vo.setTerms_seq(terms_seq);
		model.addAttribute("count", count);
		model.addAttribute("terms", service.getTerms(vo));
		return "admin_terms_Update";
	}
	
	@RequestMapping("/admin_terms_Alter.mdo")
	public String termsAlter(TermsVO vo, int count) {
		System.out.println("admin_terms_Alter 실행");
		service.alterTerms(vo);
		return "redirect:admin_terms_Read.mdo?terms_seq="+vo.getTerms_seq()+"&count="+count;
	}
	
	@RequestMapping("/admin_terms_Delete.mdo")
	public String termsDelete(TermsVO vo, int terms_seq) {
		System.out.println("admin_terms_Delete 실행");
		vo.setTerms_seq(terms_seq);
		service.deleteTerms(vo);
		return "redirect:admin_terms_Main.mdo";
	}
	
}
