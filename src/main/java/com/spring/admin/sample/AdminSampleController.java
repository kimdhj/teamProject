package com.spring.admin.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSampleController {
	@RequestMapping("/test.mdo")
	public String testAdmin() {
		System.out.println("Admid service Ã³¸®");
		return "adminTest";
	}
}
