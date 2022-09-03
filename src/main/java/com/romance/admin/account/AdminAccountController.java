package com.romance.admin.account;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.login.AdminUserVO;

@Controller
@RequestMapping("/")
public class AdminAccountController {
	
	@Autowired
	private AdminAccountService adminAccountService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("이름", "USER_NAME");
		conditionMap.put("아이디", "USER_ID");
		
		return conditionMap;
	}
	
	
	@RequestMapping("getAdmin_member_List.mdo")
	public String getUserList(Criteria criteria, Model model) throws Exception {
		System.out.println("관리자에서 회원목록 처리");
		System.out.println("검색 조건 : " + criteria.getSearchCondition());
		System.out.println("검색 단어 : " + criteria.getSearchKeyword());
		System.out.println("현재 페이지 : " + criteria.getPageNum());
		System.out.println("한페이지당 글 갯수 : " + criteria.getPerPageNum());;
		
		if(criteria.getSearchCondition() == null) {
			criteria.setSearchCondition("USER_NAME");
		}
		if(criteria.getSearchKeyword() == null) {
			criteria.setSearchKeyword("");
		}
		
		Pagenation pagenation = new Pagenation();
		pagenation.setCriteria(criteria);
		pagenation.setTotalCount(adminAccountService.totalCount());
//		System.out.println("totalCount : " + pagenation.getTotalCount());
//		System.out.println("startPage : " + pagenation.getStartPage());
//		System.out.println("endPage : " + pagenation.getEndPage());
		System.out.println(pagenation);
		model.addAttribute("pagenation", pagenation);
		model.addAttribute("adminUserListWithPaging", adminAccountService.getUserListWithPaging(criteria));
		
		
		
		return "admin_member_List";
	}
	
	
		 
}
