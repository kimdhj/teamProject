package com.romance.admin.terms;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
public class AddTermsController {

	@Autowired
	AddTermsService addTermsService;

	// 회원가입 약관 이동
	@RequestMapping("/join_terms.do")
	public String join_terms(String kakaoid, Model model) {
		// 무슨 약관인지 명시해주기
		model.addAttribute("termscategory", "회원가입");
		model.addAttribute("title_sub", "이용");
		model.addAttribute("oc", "Join");
		System.out.println(addTermsService.getAddTerms());
		List<TermsVO> termsvo = addTermsService.getAddTerms();
		List<TermsVO> termsPvo = addTermsService.getAddpersonalTerms();
		
		for(TermsVO vo:termsvo) {
			String target= vo.getTerms_title();
			String [] title_split = target.split("-");
			String title_terms = title_split[1].trim();
			vo.setTerms_title(title_terms);
		};
		
		for(TermsVO pvo:termsPvo) {
			String target= pvo.getTerms_title();
			String [] title_split = target.split("-");
			String title_term = title_split[1].trim();
			pvo.setTerms_title(title_term);
		};
		

		model.addAttribute("termsList", termsvo);
		model.addAttribute("termsPList", termsPvo);
		model.addAttribute("kakaoid", kakaoid);
		return "all_terms";
	}

	// 세션값 가져오기
	@RequestMapping("/getUid.do")
	@ResponseBody
	public UserVO getUid(JwtUtils util, HttpSession session) throws IOException {
		UserVO voToken = util.getuser(session);
		if (voToken != null) {
			return voToken;
		} else {
			return null;
		}
	}

	// 구독 약관 이동
	@RequestMapping("/sub_terms.do")
	public String sub_terms(Model model) {
		// 무슨 약관인지 명시해주기
		model.addAttribute("termscategory", "구독");
		model.addAttribute("oc", "Sub");
		model.addAttribute("title_sub", "구독");
		System.out.println(addTermsService.getAddsubTerms());
		List<TermsVO> termsvo = addTermsService.getAddsubTerms();
		List<TermsVO> termsPvo = addTermsService.getAddpersonalTerms();
		
		for(TermsVO vo:termsvo) {
			String target= vo.getTerms_title();
			String [] title_split = target.split("-");
			String title_terms = title_split[1].trim();
			vo.setTerms_title(title_terms);
		};
		
		for(TermsVO pvo:termsPvo) {
			String target= pvo.getTerms_title();
			String [] title_split = target.split("-");
			String title_term = title_split[1].trim();
			pvo.setTerms_title(title_term);
		};
		
		
		
		model.addAttribute("termsList", termsvo);
		model.addAttribute("termsPList", termsPvo);

		return "all_terms";
	}

}
