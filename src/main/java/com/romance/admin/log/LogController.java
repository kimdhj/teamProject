package com.romance.admin.log;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.romance.admin.login.AdminUserVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class LogController {
	@Autowired
	private LogService logService;
	
	@ModelAttribute("conditionMapVOne")
	public Map<String, String> searchConditionVOneMap() {
		Map<String, String> conditionMapVOne = new HashMap<>();
		conditionMapVOne.put("회원ID", "USER_ID");
		return conditionMapVOne;
	}
	@ModelAttribute("conditionMapVTwo")
	public Map<String, String> searchConditionVTwoMap() {
		Map<String, String> conditionMapVTwo = new HashMap<>();
		conditionMapVTwo.put("회원ID", "USER_ID");
		conditionMapVTwo.put("작업자ID", "ADMIN_ID");
		return conditionMapVTwo;
	}
	
	
	@GetMapping("adminLoginLog.mdo")
	public String adminLoginLog(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
	  UserVO vosession = utils.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }

	  AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			
			if(criteria.getSearchCondition() == null) {
				criteria.setSearchCondition("USER_ID");
			}
			if(criteria.getSearchKeyword() == null) {
				criteria.setSearchKeyword("");
			}
			
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
		
	  UserVO vosession = utils.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }

	  AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			
			if(criteria.getSearchCondition() == null) {
				criteria.setSearchCondition("USER_ID");
			}
			if(criteria.getSearchKeyword() == null) {
				criteria.setSearchKeyword("");
			}
			
			Pagination pagination = new Pagination();
			pagination.setCriteria(criteria);
			pagination.setTotalCount(logService.getWorkTotalCount());
			model.addAttribute("pagination", pagination);
			model.addAttribute("workLogList", logService.getWorkLogList(criteria));
			System.out.println(">>>>>>>>" + logService.getWorkLogList(criteria));
			return "admin_log_work";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	@GetMapping("adminPaymentLog.mdo")
	public String adminPaymentLog(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
	  UserVO vosession = utils.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }

	  AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			
			if(criteria.getSearchCondition() == null) {
				criteria.setSearchCondition("USER_ID");
			}
			if(criteria.getSearchKeyword() == null) {
				criteria.setSearchKeyword("");
			}
			
			Pagination pagination = new Pagination();
			pagination.setCriteria(criteria);
			pagination.setTotalCount(logService.getPaymentTotalCount());
			System.out.println(">>>>>>>>>" + logService.getPaymentTotalCount());
			model.addAttribute("pagination", pagination);
			model.addAttribute("paymentLogList", logService.getPaymentLogList(criteria));
			System.out.println(logService.getPaymentLogList(criteria));
			return "admin_log_payment";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
}
