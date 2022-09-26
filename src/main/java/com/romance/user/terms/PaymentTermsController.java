package com.romance.user.terms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.terms.TermsVO;

@Controller
public class PaymentTermsController {

	@Autowired
	PaymentTermsService service;
	
	// 회원가입 약관 이동
		@RequestMapping("/payment_terms.do")
		public String join_terms(Model model) {
			//무슨 약관인지 명시해주기
			model.addAttribute("termscategory", "결제");
			model.addAttribute("oc", "Join");
			List<TermsVO> termsvo = service.getPaymentTerms();
			for(TermsVO vo:termsvo) {
				String target= vo.getTerms_title();
				String [] title_split = target.split("-");
				String title_payment = title_split[1].trim();
				vo.setTerms_title(title_payment);
				System.out.println(vo.getTerms_title());
			};
			
		    System.out.println(termsvo);
			
			model.addAttribute("termsList", termsvo);
			
			return "payment_Terms";
		}
}
