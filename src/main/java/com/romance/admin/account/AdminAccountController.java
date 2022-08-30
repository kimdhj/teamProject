package com.romance.admin.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.login.AdminUserVO;

@Controller
@RequestMapping("/")
public class AdminAccountController {
	
	@Autowired
	private AdminAccountService adminAccountService;
	
	@RequestMapping("getAdmin_member_List.mdo")
	public String getUserList(AdminUserVO vo, Model model) {
		System.out.println("관리자에서 회원목록 처리");
			
		model.addAttribute("adminUserList", adminAccountService.getUserList(vo));
		return "admin_member_List";
	}
		
}
