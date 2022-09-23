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
	public String join_terms(Model model) {
		//무슨 약관인지 명시해주기
		model.addAttribute("termscategory", "회원가입");
		model.addAttribute("oc", "Join");
		System.out.println(addTermsService.getAddTerms());
		List<TermsVO> termsvo = addTermsService.getAddTerms();
		System.out.println(termsvo);
		model.addAttribute("termsList", termsvo);
		
		return "all_terms";
	}	
	
	//세션값 가져오기
	@RequestMapping("/getUid.do")
	@ResponseBody
	public UserVO getUid(JwtUtils util, HttpSession session) throws IOException {
		UserVO voToken = util.getuser(session);
		if(voToken != null) {
			return voToken;
		} else {
			return null;
		}	
	}
	
		//구독 약관 이동
		@RequestMapping("/sub_terms.do")
		public String sub_terms(Model model) {
			//무슨 약관인지 명시해주기
			model.addAttribute("termscategory", "구독");
			model.addAttribute("oc", "Sub");
			System.out.println(addTermsService.getAddsubTerms());
			List<TermsVO> termsvo = addTermsService.getAddsubTerms();
			System.out.println(termsvo);
			model.addAttribute("termsList", termsvo);
			
			return "all_terms";
		}	
		
}
