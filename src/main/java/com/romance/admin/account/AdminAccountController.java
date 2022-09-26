package com.romance.admin.account;

import java.io.IOException;
import java.net.URLEncoder;
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
import com.romance.admin.coupon.UserCouponVO;
import com.romance.admin.log.LoggingService;
import com.romance.admin.log.WorkLogVO;
import com.romance.admin.login.AdminUserVO;
import com.romance.security.JwtUtils;
import com.romance.user.login.UserVO;

@Controller
@RequestMapping("/")
public class AdminAccountController {
	
	@Autowired
	private AdminAccountService adminAccountService;
	
	@Autowired
	private LoggingService loggingService; //로그관련 서비스 의존성 주입(로그인로그는 각 로그인 패키지에 따로작업함)
	
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
	  
	  UserVO vosession = utils.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }

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
	  UserVO vosession = utils.getuser(session);
	  if((vosession == null||!vosession.getUser_role().equals("ROLE_ADMIN"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
	    return "redirect:admin_login.mdo";
	  }

	  AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("무엇을 들고오셨는가? : " + vo);
			System.out.println("지금 보고있는 아이디가? : " + vo.getUser_id());
						
			//현재 상세페이지 에서 보고있는 회원의 보유쿠폰명 리스트로 받아오기
			List<UserCouponVO> myCouponVOList = adminAccountService.getUserCouponList(vo.getUser_id());
			Map<Integer, String> myCouponMap = new HashMap<>();
			//List에 값이 있는경우에만 작업
			if(myCouponVOList.size() > 0) {
				System.out.println(">>>>>앙 : " + myCouponVOList);
				System.out.println(">>>>>잉 : " + myCouponVOList.get(0).getUser_coupon_name());
				//coupon_seq랑 coupon_name 값을 가져가서 활용하기 위함.
				for(int i = 0; i < myCouponVOList.size(); i++) {
					myCouponMap.put(myCouponVOList.get(i).getUser_coupon_seq(), myCouponVOList.get(i).getUser_coupon_name());
				}
			} else {
				myCouponMap.put(0, "보유쿠폰 없음");
			}
			System.out.println("쿠폰이름과 해당시퀀스 맵 : " + myCouponMap);
			
			//현재 지급가능한 쿠폰목록 가져오기
			List<CouponVO> couponVOList = adminAccountService.getCouponList();
			System.out.println("지급가능한 쿠폰 리스트 : " + couponVOList);
			
			//쿠폰이 있을때만 jsp에서 변수사용하고 아니면 고정값 사용하기위함.
			model.addAttribute("couponVOListSize", couponVOList.size());
			//지급가능한 쿠폰목록이 있을경우에만!
			if(couponVOList.size() > 0) {
				model.addAttribute("couponVOList", couponVOList);
			}
			model.addAttribute("myCouponMap", myCouponMap);	
			model.addAttribute("criteria", criteria);
			model.addAttribute("getUserDetail", adminAccountService.getUserDetail(vo));
			return "admin_member_Detail";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//링크로 접속할때 마스터 아니면 들어갈 수 없도록 함
	@PostMapping("isMaster.mdo")
	@ResponseBody
	public int isMaster(HttpSession session, JwtUtils utils) throws Exception {
		int returnValue = 0;
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			if(voToken.getUser_role().equals("ROLE_MASTER")) {
				System.out.println("마스터는 접근을 허용한다");
				returnValue = 0;
				return returnValue; //마스터임 접근을 허용한다
			} else {
				returnValue = 1;
				return returnValue; //마스터가 아님 접근불가
			}
			
		} else {
			returnValue = 2;
			return returnValue; //로그인부터 하세요
		}
	}
	
	@GetMapping("getAdmin_admin_List.mdo")
	public String getAdminListWithPaging(AdminUserVO vo, Criteria criteria, Model model, HttpSession session, JwtUtils utils) throws Exception {
	  UserVO vosession = utils.getuser(session);
	  if(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER")){
	    return "redirect:admin_login.mdo";
	  }   
	  AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			if(voToken.getUser_role().equals("ROLE_MASTER")) {
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
				System.out.println("권한부족");
				return "redirect:adminMain.mdo";
			}			
		} else {
			return "redirect:admin_login.mdo";
		}
		
	}
	
	//work_log 포인트
	//관리자계정 생성
	@PostMapping("insertAdminAccount.mdo")
	public String insertAdminAccount(AdminUserVO vo, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("관리자 계정 생성");
			System.out.println(vo);
			vo.setUser_password(bCryptPasswordEncoder.encode(vo.getUser_password()));
			adminAccountService.insertAdminAccount(vo);
			
			//관리자계정 생성 후 로그입력
			makeAdminAccountLog(vo, voToken);
			
			return "redirect:getAdmin_admin_List.mdo";
		} else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//관리자 계정 삭제
	@GetMapping("deleteAdminAccount.mdo")
	public String delAdminAccount(String user_id, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println(">>>>>>>계정삭제할 아이디 : " + user_id);
			deleteAdminAccountLog(user_id, voToken);
			adminAccountService.deleteAdminAccount(user_id);
			return "redirect:getAdmin_admin_List.mdo";
		} else {
			return "redirect:admin_login.mdo";
		}
	}

	//work_log 포인트
	//회원정보 수정
	@PostMapping("updateUserAccount.mdo")
	public String updateUserAccount(AdminUserVO vo, HttpSession session, JwtUtils utils, Criteria criteria) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("계정정보 수정");
			if(vo.getUser_password() != null && !vo.getUser_password().equals("")) { // 입력비밀번호 null값, ''빈문자열 아닐경우에만 암호화 진행
				vo.setUser_password(bCryptPasswordEncoder.encode(vo.getUser_password()));
			}
			//searchKeyword의 경우 한글인코딩을 해줘서 쿼리스트링으로 보내준다
			String encodedSearchKeyword = URLEncoder.encode(criteria.getSearchKeyword(), "UTF-8");
			String queryString = "?user_id=" + vo.getUser_id() + "&pageNum=" + criteria.getPageNum() + "&searchCondition=" + criteria.getSearchCondition() + "&searchKeyword=" + encodedSearchKeyword + "&selectCondition=" + criteria.getSelectCondition();
			System.out.println("쿼리스트링 : " + queryString);
			System.out.println(">>>>>뭐가뭐가들어갔나" + vo);
			
			//회원정보 수정로그 (수정전에 체크하여 변경전 값 기록)
			userInfoWorkLog(vo.getUser_id(), voToken); //작업대상 아이디와 세션정보를 파라미터로 보낸다
			
			//회원정보 수정
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
	
	//work_log 포인트
	//회원상세 쿠폰관련
	//쿠폰 지급
		@PostMapping("giveCoupon.mdo")
		@ResponseBody
		public boolean giveCoupon(@RequestParam("coupon_seq") int coupon_seq, @RequestParam("user_id") String user_id, HttpSession session, JwtUtils utils) throws Exception {
			AdminUserVO voToken = utils.getAdmin(session);
			if(voToken != null) {
				System.out.println("으갸갸갸갸 : " + coupon_seq);
				//지급할 쿠폰 정보 가져오기
				CouponVO couponVO = adminAccountService.getCouponInfo(coupon_seq);
				System.out.println("아니진짜루우우 : " + couponVO);
				System.out.println("으갸갸갸갸 : " + user_id);
				//가져온 지급할 쿠폰 정보와 현재 지급할 유저의 아이디를 받아서 객체에 저장
				UserCouponVO userCouponVO = new UserCouponVO();
				userCouponVO.setUser_coupon_code(couponVO.getCoupon_code());
				userCouponVO.setUser_coupon_effect(couponVO.getCoupon_effect());
				userCouponVO.setUser_coupon_name(couponVO.getCoupon_name());
				userCouponVO.setUser_id(user_id);
				System.out.println(">>>>>이자시가 쿠폰 선물이당!! : " + userCouponVO);
				
				//세팅이 끝났으면 이 객체를 가져가서 insert해준다.
				adminAccountService.giveCoupon(userCouponVO);
				
				//쿠폰지급이 완료되면 로그에 찍어준다.
				couponInsertWorkLog(userCouponVO, voToken);
				
				return true;
			} else {
				return false;
			}
			
		}

	//work_log 포인트
	//보유쿠폰 삭제
	@PostMapping("deleteUserCoupon.mdo")
	@ResponseBody
	public boolean deleteUserCoupon(@RequestParam("user_coupon_seq") int user_coupon_seq, HttpSession session, JwtUtils utils) throws Exception {
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("컨트롤러로 넘어는오냐?");
			System.out.println("쿠폰시퀀스 : " + user_coupon_seq);
			
			//삭제할 쿠폰의 정보를 가져온다(로그입력용)
			UserCouponVO userCouponVO = adminAccountService.forDeleteCoupon(user_coupon_seq);

			//쿠폰삭제!
			adminAccountService.deleteUserCoupon(user_coupon_seq);
			
			//쿠폰삭제가 완료되면 로그입력
			couponDeleteWorkLog(userCouponVO, voToken);
			return true;
		} else {
			return false;
		}
	}
	
	//work_log 포인트
	//회원상세 포인트관련
	//포인트 지급
	@PostMapping("givePoint.mdo")
	@ResponseBody
	public boolean givePoint(@RequestParam("givePoint") int givePoint, @RequestParam("user_id") String user_id, HttpSession session, JwtUtils utils) throws Exception {
		boolean returnValue = false;
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("지급할 포인트 : " + givePoint);
			System.out.println("지급대상 아이디 : " + user_id);
			
			//현재 유저의 보유 포인트를 가져와서 지급할 포인트와 더해준다
			int user_point = adminAccountService.getUserPoint(user_id);
			user_point += givePoint;
			
			//포인트 지급하기
			UserVO userVO = new UserVO();
			userVO.setUser_id(user_id);
			userVO.setUser_point(user_point);
			adminAccountService.giveUserPoint(userVO);
			
			//포인트 지급완료 후 로그에 기록한다.
			pointPlusWorkLog(givePoint, user_id, voToken);
			
			returnValue = true;
			return returnValue;
		} else {
			returnValue = false;
			return returnValue;
		}
		
	}
	
	//work_log 포인트
	//포인트 차감
	@PostMapping("deletePoint.mdo")
	@ResponseBody
	public int deletePoint(@RequestParam("deletePoint") int deletePoint, @RequestParam("user_id") String user_id, HttpSession session, JwtUtils utils) throws Exception {
		int returnValue = 0;
		AdminUserVO voToken = utils.getAdmin(session);
		if(voToken != null) {
			System.out.println("지급할 포인트 : " + deletePoint);
			System.out.println("지급대상 아이디 : " + user_id);
			
			//현재 유저의 보유 포인트를 가져와서 포인트차감을 진행한다.
			//차감할 포인트가 현재 보유포인트보다 크다면 해당내용 알람 띄우기.
			int user_point = adminAccountService.getUserPoint(user_id);
			System.out.println(user_point);
			if(user_point >= deletePoint) {
				user_point -= deletePoint;
			} else {
				//아닐경우 false반환해서 보유포인트보다 적다고 표기할 목적
				returnValue = 0;
				return returnValue;
			}
			//포인트 차감하기
			UserVO userVO = new UserVO();
			userVO.setUser_id(user_id);
			userVO.setUser_point(user_point);
			adminAccountService.deleteUserPoint(userVO);
			
			//포인트 차감완료 후 로그에 기록한다.
			pointMinusWorkLog(deletePoint, user_id, voToken);
			
			returnValue = 1;
			return returnValue;
		} else {
			//returnValue가 false일 경우 보유포인트보다 차감포인트가 더 크거나, 다시로그인해야함
			returnValue = 2;
			return returnValue;
		}
		
	}
	
	//회원정보 수정 로그
	public void userInfoWorkLog(String user_id, AdminUserVO voToken) throws Exception {
		if(voToken != null) {
			//변경전 데이터 받아오기
			AdminUserVO beforeVO = adminAccountService.getUser(user_id);
			System.out.println(">>>>>변경전 데이터 : " + beforeVO);
			
			System.out.println(">>>>>토큰에서 받아온 값" + voToken);
			String work_log_id = voToken.getUser_id();
			String work_log_target_id = user_id;
			String work_log_contents = "[회원정보수정] 변경전 ";
			work_log_contents += "구분 : " + beforeVO.getUser_sub()
								+ ", 상태 : " + beforeVO.getUser_state()
								+ ", 연락처 : " + beforeVO.getUser_phone()
								+ ", 이메일 : " + beforeVO.getUser_email();
			System.out.println("작업자 아이디 : " + work_log_id);			
			System.out.println("작업대상 아이디 : " + work_log_target_id);			
			System.out.println("작업 내용 : " + work_log_contents);
			
			//작업로그에 기록할 정보 담기
			WorkLogVO workLogVO = new WorkLogVO();
			workLogVO.setWork_log_id(work_log_id);//작업자
			workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
			workLogVO.setWork_log_contents(work_log_contents);//작업내용
			loggingService.insertWorkLog(workLogVO);
			
		} else {
			System.out.println("토큰값 없음");
		}
		
	}
	
	//쿠폰 지급 로그
	public void couponInsertWorkLog(UserCouponVO userCouponVO, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = userCouponVO.getUser_id();
		String work_log_contents = "[쿠폰지급] ";
		work_log_contents += "쿠폰명 : " + userCouponVO.getUser_coupon_name()
							+ ", 쿠폰효과 : " + userCouponVO.getUser_coupon_effect()
							+ ", 쿠폰코드 : " + userCouponVO.getUser_coupon_code();
		System.out.println("작업자 아이디 : " + work_log_id);			
		System.out.println("작업대상 아이디 : " + work_log_target_id);			
		System.out.println("작업 내용 : " + work_log_contents);
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
	
	//쿠폰 차감 로그
	public void couponDeleteWorkLog(UserCouponVO userCouponVO, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = userCouponVO.getUser_id();
		String work_log_contents = "[쿠폰삭제] ";
		work_log_contents += "쿠폰명 : " + userCouponVO.getUser_coupon_name()
							+ ", 쿠폰효과 : " + userCouponVO.getUser_coupon_effect()
							+ ", 쿠폰코드 : " + userCouponVO.getUser_coupon_code();
		System.out.println("작업자 아이디 : " + work_log_id);			
		System.out.println("작업대상 아이디 : " + work_log_target_id);			
		System.out.println("작업 내용 : " + work_log_contents);
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
	
	//포인트 지급 로그
	public void pointPlusWorkLog(int givePoint, String user_id, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = user_id;
		String work_log_contents = "[포인트지급] ";
		work_log_contents += "지급한 포인트 : " + givePoint + "포인트";
		
		System.out.println("작업자 아이디 : " + work_log_id);			
		System.out.println("작업대상 아이디 : " + work_log_target_id);			
		System.out.println("작업 내용 : " + work_log_contents);
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
	
	//포인트 차감 로그
	public void pointMinusWorkLog(int deletePoint, String user_id, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = user_id;
		String work_log_contents = "[포인트차감] ";
		work_log_contents += "차감한 포인트 : " + deletePoint + "포인트";
		
		System.out.println("작업자 아이디 : " + work_log_id);			
		System.out.println("작업대상 아이디 : " + work_log_target_id);			
		System.out.println("작업 내용 : " + work_log_contents);
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
	

	//관리자 계정 생성 로그
	public void makeAdminAccountLog(AdminUserVO vo, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = vo.getUser_id();
		String work_log_contents = "[관리자계정생성] ";
		work_log_contents += "생성 아이디 : " + vo.getUser_id() + ", 생성 이름 : " + vo.getUser_name();
		
		System.out.println("작업자 아이디 : " + work_log_id);			
		System.out.println("작업대상 아이디 : " + work_log_target_id);			
		System.out.println("작업 내용 : " + work_log_contents);
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
	
	//관리자 계정 삭제 로그
	public void deleteAdminAccountLog(String user_id, AdminUserVO voToken) throws Exception {
		String work_log_id = voToken.getUser_id();
		String work_log_target_id = user_id;
		String work_log_contents = "[관리자계정삭제] ";
		work_log_contents += "작업자 : " + work_log_id + ", 삭제한 아이디 : " + work_log_target_id;
		WorkLogVO workLogVO = new WorkLogVO();
		workLogVO.setWork_log_id(work_log_id);//작업자
		workLogVO.setWork_log_target_id(work_log_target_id);//작업대상
		workLogVO.setWork_log_contents(work_log_contents);//작업내용
		loggingService.insertWorkLog(workLogVO);
	}
}
