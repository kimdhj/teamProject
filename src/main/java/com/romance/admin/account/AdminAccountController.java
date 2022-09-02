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
	public String getUserList(AdminUserVO vo, Model model) {
		System.out.println("관리자에서 회원목록 처리");
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("USER_NAME");
		}
		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
			
		model.addAttribute("adminUserList", adminAccountService.getUserList(vo));
		
		
		
		return "admin_member_List";
	}
	
	
		 
}
