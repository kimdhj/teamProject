package com.romance.admin.account;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("getAdmin_member_List.mdo")
	public String getUserList(Criteria criteria, Model model) throws Exception {
		System.out.println("관리자에서 회원목록 처리");
		System.out.println("검색 조건 : " + criteria.getSearchCondition());
		System.out.println("검색 단어 : " + criteria.getSearchKeyword());
		System.out.println("현재 페이지 : " + criteria.getPageNum());
		System.out.println("한페이지당 글 갯수 : " + criteria.getPerPageNum());;
		
		if(criteria.getSearchCondition() == null) {
			criteria.setSearchCondition("USER_ID");
		}
		if(criteria.getSearchKeyword() == null) {
			criteria.setSearchKeyword("");
		}
		System.out.println("셀렉트컨디션 : " + criteria.getSelectCondition());				
		Pagination pagination = new Pagination();
		pagination.setCriteria(criteria);
		pagination.setTotalCount(adminAccountService.totalCount(criteria));
		System.out.println("페이지네이션 토탈카운트" + pagination.getTotalCount());
//		System.out.println("totalCount : " + pagination.getTotalCount());
//		System.out.println("startPage : " + pagination.getStartPage());
//		System.out.println("endPage : " + pagination.getEndPage());
		System.out.println(pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("adminUserListWithPaging", adminAccountService.getUserListWithPaging(criteria));
		
		return "admin_member_List";
	}
	
	@GetMapping("getAdmin_member_Detail.mdo")
	public String getUserDetail(AdminUserVO vo,@ModelAttribute("criteria") Criteria criteria, Model model) {
		
		model.addAttribute("criteria", criteria);
		model.addAttribute("getUserDetail", adminAccountService.getUserDetail(vo));
		return "admin_member_Detail";
	}
	
	@GetMapping("getAdmin_admin_List.mdo")
	public String getAdminList(Criteria criteria, Model model) throws Exception {
		System.out.println("Mybatis로 adminList 기능 처리");
		
		if(criteria.getSearchCondition() == null) {
			criteria.setSearchCondition("USER_ID");
		}
		if(criteria.getSearchKeyword() == null) {
			criteria.setSearchKeyword("");
		}
		
		Pagination pagination = new Pagination();
		pagination.setCriteria(criteria);
		pagination.setTotalCount(adminAccountService.adminTotalCount(criteria));
		model.addAttribute("pagination", pagination);
		model.addAttribute("adminListWithPaging", adminAccountService.getAdminListWithPaging(criteria));
		return "admin_admin_List";
	}
	
	@PostMapping("insertAdminAccount.mdo")
	public String insertAdminAccount(AdminUserVO vo) throws Exception {
		System.out.println("관리자 계정 생성");
		adminAccountService.insertAdminAccount(vo);
		
		return "redirect:getAdmin_admin_List.mdo";
	}
	
	@PostMapping("idCheck.mdo")
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) throws Exception {
		int cnt = adminAccountService.idCheck(user_id);
		System.out.println(user_id);
		System.out.println("아이디체크 cnt = " + cnt);
		return cnt;
	}
	
		 
}
