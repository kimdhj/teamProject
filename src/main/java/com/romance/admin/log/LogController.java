package com.romance.admin.log;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.login.AdminUserVO;
import com.romance.security.JwtUtils;

@Controller
@RequestMapping("/")
public class LogController {
	@Autowired
	private LogService logService;
	
	@GetMapping("adminLoginLog.mdo")
	public String adminLoginLog(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			Pagination pagination = new Pagination();
			pagination.setCriteria(criteria);
			pagination.setTotalCount(logService.getLoginTotalCount());
			model.addAttribute("pagination", pagination);
			model.addAttribute("loginLogList", logService.getLoginLogList(criteria));
			return "admin_log_login";
		} else {
			return "redirect:admin_login.mdo";
		}
		
	}
	@GetMapping("adminWorkLog.mdo")
	public String adminWorkLog(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			Pagination pagination = new Pagination();
			pagination.setCriteria(criteria);
			pagination.setTotalCount(logService.getWorkTotalCount());
			model.addAttribute("pagination", pagination);
			model.addAttribute("workLogList", logService.getWorkLogList(criteria));
			return "admin_log_work";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	@GetMapping("adminPaymentLog.mdo")
	public String adminPaymentLog(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
		
			return "admin_log_payment";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
}
