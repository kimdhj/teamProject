package com.romance.admin.account;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.romance.admin.coupon.CouponVO;
import com.romance.admin.login.AdminUserVO;
import com.romance.security.JwtUtils;

@Controller
@RequestMapping("/")
public class AdminAccountController {
	
	@Autowired
	private AdminAccountService adminAccountService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("아이디", "USER_ID");
		conditionMap.put("이름", "USER_NAME");

		return conditionMap;
	}
	
	@GetMapping("getAdmin_member_List.mdo")
	public String getUserListWithPaging(Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) { //토큰값이 null이 아닌경우
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
//			System.out.println("totalCount : " + pagination.getTotalCount());
//			System.out.println("startPage : " + pagination.getStartPage());
//			System.out.println("endPage : " + pagination.getEndPage());
			System.out.println(pagination);
			System.out.println("현재페이지" + criteria.getPageNum());
			model.addAttribute("pagination", pagination);
			model.addAttribute("adminUserListWithPaging", adminAccountService.getUserListWithPaging(criteria));
			
			return "admin_member_List";
		} else {
			return "redirect:admin_login.mdo";
		}
		
	}
	
	@GetMapping("getAdmin_member_Detail.mdo")
	public String getUserDetail(AdminUserVO vo, @ModelAttribute("criteria") Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("지금 보고있는 아이디가? : " + vo.getUser_id());
			
			//현재 상세페이지 에서 보고있는 회원의 보유쿠폰명 리스트로 받아오기
			List<String> myCouponList = new ArrayList<>();
			List<CouponVO> myCouponVOList = adminAccountService.getUserCouponList(vo.getUser_id());
			System.out.println(">>>>>앙 : " + myCouponVOList);
			System.out.println();
			model.addAttribute("criteria", criteria);
			model.addAttribute("getUserDetail", adminAccountService.getUserDetail(vo));
			return "admin_member_Detail";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
	@GetMapping("getAdmin_admin_List.mdo")
	public String getAdminListWithPaging(AdminUserVO vo, Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
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
			System.out.println(">>>>페이지네이션 토탈카운트!" + pagination.getTotalCount());
			System.out.println(">>>>Criteria pageNum! " + criteria.getPageNum());
			model.addAttribute("pagination", pagination);
			model.addAttribute("adminListWithPaging", adminAccountService.getAdminListWithPaging(criteria));
			return "admin_admin_List";
		} else {
			return "redirect:admin_login.mdo";
		}
		
	}
	//관리자계정 생성
	@PostMapping("insertAdminAccount.mdo")
	public String insertAdminAccount(AdminUserVO vo, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("관리자 계정 생성");
			System.out.println(vo);
			vo.setUser_password(bCryptPasswordEncoder.encode(vo.getUser_password()));
			adminAccountService.insertAdminAccount(vo);
			
			return "redirect:getAdmin_admin_List.mdo";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//회원정보 수정
	@PostMapping("updateUserAccount.mdo")
	public String updateUserAccount(AdminUserVO vo, HttpSession session, JwtUtils utils, Criteria criteria) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("계정정보 수정");
			System.out.println("키워드 : " + criteria.getSearchKeyword());
			if(vo.getUser_password() != null && !vo.getUser_password().equals("")) { // 입력비밀번호 null값, ''빈문자열 아닐경우에만 암호화 진행
				vo.setUser_password(bCryptPasswordEncoder.encode(vo.getUser_password()));
			}
			//searchKeyword의 경우 한글인코딩을 해줘서 쿼리스트링으로 보내준다
			String encodedSearchKeyword = URLEncoder.encode(criteria.getSearchKeyword(), "UTF-8");
			String queryString = "?user_id=" + vo.getUser_id() + "&pageNum=" + criteria.getPageNum() + "&searchCondition=" + criteria.getSearchCondition() + "&searchKeyword=" + encodedSearchKeyword + "&selectCondition=" + criteria.getSelectCondition();
			System.out.println("쿼리스트링 : " + queryString);
			System.out.println(">>>>>뭐가뭐가들어갔나" + vo);
			adminAccountService.updateUserAccount(vo);
			return "redirect:getAdmin_member_Detail.mdo" + queryString;
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//관리자계정 추가시 아이디 중복체크
	@PostMapping("idCheck.mdo")
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String user_id) throws Exception {
		int cnt = adminAccountService.idCheck(user_id);
		System.out.println(user_id);
		System.out.println("아이디체크 cnt = " + cnt);
		return cnt;
	}
	
	//회원상세 쿠폰관련
	//회원상세 포인트관련
}
