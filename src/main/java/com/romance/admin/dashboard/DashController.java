package com.romance.admin.dashboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class DashController {
	@Autowired
	private DashService dashService;
	
	@GetMapping("adminMain.mdo")
	public String myMain(DashVO dashVO, Model model) {
		
		
		
		return "admin_main";
	}
	
}
