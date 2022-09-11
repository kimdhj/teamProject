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
		System.out.println("Mybatis로 차트데이터 테스트용 처리");
		model.addAttribute("dashVO", dashVO);
		model.addAttribute("getSubRatio", dashService.getSubRatio(dashVO));
		System.out.println(dashVO);

		return "admin_main";
	}
	
}
