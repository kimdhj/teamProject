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
		System.out.println(addTermsService.getAddTerms());
		List<termsVO> termsvo = addTermsService.getAddTerms();
		System.out.println(termsvo);
		model.addAttribute("termsList", termsvo);
		
		return "all_terms";
	}	
	
	//세션값 가져오기
	@RequestMapping("/getUid.do")
	@ResponseBody
	public UserVO getUid(JwtUtils util, HttpSession session) throws IOException {
		UserVO userVO = util.getuser(session);
		System.out.println(userVO);
		return userVO;
	}
	
	
}
