package com.romance.user.my.sub;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.romance.admin.coupon.CouponService;
import com.romance.admin.icon.IconService;
import com.romance.admin.log.LoggingService;
import com.romance.admin.log.PaymentLogVO;
import com.romance.admin.sub.SubscribeService;
import com.romance.admin.sub.SubscribeVO;
import com.romance.security.JwtUtils;
import com.romance.user.book.BookSearchVO;
import com.romance.user.login.UserService;
import com.romance.user.login.UserVO;
import com.romance.user.my.infomodify.MyInfoService;
import com.romance.user.my.profile.MyProfileService;
import com.romance.user.subUtil.subscancel;
import com.romance.user.subUtil.subsche;


@Controller
@SessionAttributes("my_sub")
public class MySubController {

	@Autowired
	private IconService iconService;
	@Autowired
	private MySubService mySubService;
	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private CouponService couponService;
	@Autowired
	MyProfileService myProfileService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	MyInfoService ser;
	@Autowired
	UserService seru;
	@Autowired
	LoggingService loggingService;
	
	//인클루드 사항 삭제
	//마이페이지 구독정보
	@RequestMapping("/my_getSub.do")
	public String my_getSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo, BookSearchVO vo) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
		   return "redirect:/myMain.do";
		}   
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		
		model.addAttribute("mybook",mySubService.mybook(vosession.getUser_id()));
		model.addAttribute("user_name", vosession.getUser_name());
		model.addAttribute("user_point", vosession.getUser_point());
		model.addAttribute("user_sub_count", vosession.getUser_sub_count());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(vosession));
		model.addAttribute("cate", mySubService.getcate(vosession));
		model.addAttribute("mynewlist",mySubService.newcate(vo));
		
		return "my_AddReadInfo";
	}
	
	//세션정보를 vo에 전달
	@RequestMapping(value="check_csb.do", method=RequestMethod.POST)
	@ResponseBody
	public UserVO check_csb(HttpSession session, JwtUtils util) throws IOException {
		UserVO userVO = util.getuser(session);
		
		return userVO;
	}
	
	//마이페이지 구독취소
	@RequestMapping("/my_cancelSub.do")
	public String my_cancelSub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO userVO = util.getuser(session);
	
		model.addAttribute("user_name", userVO.getUser_name());
		model.addAttribute("user_point", userVO.getUser_point());
		model.addAttribute("user_sub_count", userVO.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", userVO.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(userVO));
		
		return "my_AddReadCancel";
	}
	
	//마이페이지 구독정보변경
	@RequestMapping("/my_modifySub.do")
	public String my_modifySub(HttpSession session, JwtUtils util, Model model, SubscribeVO svo) throws IOException {
		UserVO vosession = util.getuser(session);
		if((vosession == null||!vosession.getUser_sub().equals("1"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
		   return "redirect:index.do";
		}   
	 
    model.addAttribute("catelist",mySubService.getcatelist());
    model.addAttribute("mybook",mySubService.mybook(vosession.getUser_id()));
    model.addAttribute("catemy",mySubService.getcatemy(vosession.getUser_id()));
		model.addAttribute("user_name", vosession.getUser_name());
		model.addAttribute("user_point",vosession.getUser_point());
		model.addAttribute("user_sub_count", vosession.getUser_sub_count());
		model.addAttribute("user_sub_pay_before", vosession.getUser_sub_pay_before());
		model.addAttribute("icon", iconService.getIcon());
		model.addAttribute("sub", subscribeService.getSub(svo));
		model.addAttribute("cou", couponService.owncoupon(vosession));
		
		return "my_AddReadModify";
	}
	
	//구독 취소 비밀번호 체크
	@PostMapping("/cancelSubs.do")
	public String cancelSubs(UserVO vo, Model model, HttpSession session, JwtUtils utils) throws Exception {
		UserVO voToken = utils.getuser(session);
		if(voToken != null) {
			System.out.println("회원탈퇴 준비완료 누구?? + " + vo.getUser_id());
			String user_id = voToken.getUser_id();
			String user_password = myProfileService.getSessionUser(user_id).getUser_password();
			System.out.println("세션 회원정보 비밀번호 : " + user_password);
			
			//세션정보의 회원아이디 값과 입력받은 회원 아이디 값이 같은경우에만 값이 들어옴.
			//만약 세션정보의 비밀번호와 입력받은 비밀번호가 다를경우 업데이트하면안됨.
			if(bCryptPasswordEncoder.matches(vo.getUser_password(), user_password)) {//matches - 입력받은비밀번호, 비교하고자하는 인코딩된 비밀번호
				System.out.println("비밀번호를 맞췄다니 대단해~");
				System.out.println("d");
				//session.invalidate();//탈퇴하면 세션끊고 로그인화면으로|
				vo.setUser_id(voToken.getUser_id());
			    session.removeAttribute("id");
			    myProfileService.cancelSubs(user_id);
			    voToken = seru.onesearch(vo.getUser_id());
			    voToken.setUser_password(null);	
			    String token = utils.createToken("유저", voToken);
			    session.setAttribute("id", token);
				return "redirect:event_Sub.do";
			} else {
				System.out.println("비밀번호가 다르자나!!");
				return "redirect:my_cancelSub.do";
			}
	
		} else {
			return "redirect:login.do";
		}
	}
	
	@RequestMapping("/go_Sub_Pay.do")
	public String go_Sub_Pay(UserVO vo, Model model, HttpSession session, JwtUtils util) {
		
		return "sub_Pay";
	}
	
	@GetMapping("/mysubpay.do")
  public String mysubpay(Model model, JwtUtils util, HttpSession session) throws IOException {
	  UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
return "redirect:index.do";
} 
	  UserVO vo = util.getuser(session);
    model.addAttribute("user", vo);
    return "my_SubPay";
  }
  
  @PostMapping("/subreg.do")
  @ResponseBody
  public int subreg(@RequestParam("cuid") String cuid, subsche sc,JwtUtils util,HttpSession session) throws Exception {
    System.out.println("subreg " + cuid);
    UserVO vo=util.getuser(session);
    String num=cuid.replaceAll(vo.getUser_id(),"");
    System.out.println("구독 num : "+num);
    vo.setUser_sub_start(num);
    System.out.println("구독 vo : "+vo);
    mySubService.subupdate(vo);
    UUID ran = UUID.randomUUID();
    sc.subpay(cuid, cuid + "|" + ran.toString());
    // 테이블에 시간 밀리세컨드로 만든거 넣기 + 개월수 1로 바꾸기
    
    //구독 결제 로그 입력
    subPaymentLog(vo.getUser_id());
 
    mySubService.subon(vo.getUser_id());
    UserVO vou=seru.onesearch(vo.getUser_id());
    vou.setUser_password(null);
    String token=util.createToken("유저", vou);
    session.setAttribute("id", token);
    return 1;
  }
  
  @PostMapping("/subcancel.do")
  @ResponseBody
  public int subcancel(String cuid, subscancel sc,JwtUtils util,HttpSession session) throws Exception {
    // 테이블에 시간 밀리세컨드로 만든거 지우기
    UserVO user=util.getuser(session);
    cuid=user.getUser_id()+user.getUser_sub_start();
    System.out.println("취소 아이디"+cuid);
    sc.subcancel(cuid);
    mySubService.subdel(user.getUser_id());
    UserVO vo=seru.onesearch(user.getUser_id());
    String token=util.createToken("유저", vo);
    session.setAttribute("id", token);
    return 1;
  }
  
  @PostMapping("/subrepay.do")
  @ResponseBody
  public void subrepay(@RequestBody JSONObject json, subsche sc,JwtUtils util,HttpSession session) throws Exception {
    System.out.println("구독 재결제");
    System.out.println(json);
    System.out.println(json.get("merchant_uid"));
    
    String mid = (String) json.get("merchant_uid");
    if (!mid.contains("_")) {
      int ind = mid.indexOf("|");
      System.out.println("결과물12" + mid.substring(0, ind));
      String cuid = mid.substring(0, ind);
      UUID ran = UUID.randomUUID();
      
      sc.subpay(cuid, cuid + "|" + ran.toString());
      int idd=cuid.indexOf("&");
      String id=cuid.substring(0,idd);
      
      //구독 재결재 로그 입력
      subRePaymentLog(id);
      
      mySubService.subon(id);
      
    }
    
  }
  @GetMapping("subfin.do")
  public String subfin(JwtUtils util, HttpSession session) throws IOException {
    UserVO vosession = util.getuser(session);
    if((vosession == null||!vosession.getUser_role().equals("ROLE_MEMBER"))&&(vosession == null||!vosession.getUser_role().equals("ROLE_MASTER"))){
      return "redirect:index.do";
      } 
    return "sub_Finish";
  }
  
  //구독로그
  public void subPaymentLog(String user_id) throws Exception {
	  String payment_log_id = user_id;
	  int payment_log_money = 30000;
	  String payment_log_contents = "[구독 결제] ";
	  payment_log_contents += "결제금액 30,000";
	  
	  PaymentLogVO paymentLogVO = new PaymentLogVO();
	  paymentLogVO.setPayment_log_id(payment_log_id);
	  paymentLogVO.setPayment_log_money(payment_log_money);
	  paymentLogVO.setPayment_log_contents(payment_log_contents);
	  loggingService.insertPaymentLog(paymentLogVO);
  }
  //구독 repay 로그
  public void subRePaymentLog(String user_id) throws Exception {
	  String payment_log_id = user_id;
	  int payment_log_money = 30000;
	  String payment_log_contents = "[구독 재결제] ";
	  payment_log_contents += "결제금액 30,000";
	  
	  PaymentLogVO paymentLogVO = new PaymentLogVO();
	  paymentLogVO.setPayment_log_id(payment_log_id);
	  paymentLogVO.setPayment_log_money(payment_log_money);
	  paymentLogVO.setPayment_log_contents(payment_log_contents);
	  loggingService.insertPaymentLog(paymentLogVO);
  }
  @PostMapping("subupdate.do")
  public String subupdate(int[] category_num,JwtUtils util, HttpSession session) throws IOException {
    UserVO user=util.getuser(session);
    mySubService.delcate(user.getUser_id());
    mySubService.joininsert(category_num, user.getUser_id());
    System.out.println("cnum : "+category_num.toString());
    return "redirect:my_getSub.do";
  }
	
}
