package com.romance.admin.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LogController {
	@Autowired
	private LogService logService;
	
	@GetMapping("adminLog.mdo")
	public String log() {
		return "admin_log";
	}
}
